# - Find CEGUI includes and library
#
# This module defines
#  CEGUI_INCLUDE_DIR
#  CEGUI_LIBRARIES, the libraries to link against to use CEGUI.
#  CEGUI_LIB_DIR, the location of the libraries
#  CEGUI_FOUND, If false, do not try to use CEGUI
#
# Copyright © 2007, Matt Williams
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

if(POLICY CMP0011)
       cmake_policy(SET CMP0011 OLD) # or even better, NEW
       endif(POLICY CMP0011)

IF (CEGUI_LIBRARIES AND CEGUI_INCLUDE_DIR)
	SET(CEGUI_FIND_QUIETLY TRUE)
ENDIF (CEGUI_LIBRARIES AND CEGUI_INCLUDE_DIR)

IF (WIN32) #Windows
	# MESSAGE(STATUS "Looking for CEGUI")
	# SET(OGRESDK $ENV{OGRE_HOME})
	# SET(OGRESOURCE $ENV{OGRE_SRC})
	# IF (OGRESDK)
		# MESSAGE(STATUS "Using CEGUI in OGRE SDK")
		# SET(OGRESDK $ENV{OGRE_HOME})
		# STRING(REGEX REPLACE "[\\]" "/" OGRESDK "${OGRESDK}" )
		# SET(CEGUI_INCLUDE_DIR ${OGRESDK}/include/CEGUI)
		# SET(CEGUI_LIB_DIR ${OGRESDK}/lib)
		# SET(CEGUI_LIBRARIES debug CEGUIBase_d optimized CEGUIBase)
	# ENDIF (OGRESDK)
	# IF (OGRESOURCE)
		# MESSAGE(STATUS "Using CEGUI in OGRE dependencies")
		# SET(CEGUI_INCLUDE_DIR C:/ogre/Dependencies/include C:/ogre/Dependencies/include/CEGUI)
		# SET(CEGUI_LIB_DIR C:/ogre/Dependencies/lib/Release C:/ogre/Dependencies/lib/Debug)
		# SET(CEGUI_LIBRARIES debug CEGUIBase_d optimized CEGUIBase)
	# ENDIF (OGRESOURCE)
	SET(CEGUI_LIBRARIES debug CEGUIBase_d optimized CEGUIBase)
ELSE (WIN32) #Unix
	CMAKE_MINIMUM_REQUIRED(VERSION 2.4.7 FATAL_ERROR)
	FIND_PACKAGE(PkgConfig)
	PKG_SEARCH_MODULE(CEGUI CEGUI)
	SET(CEGUI_INCLUDE_DIR ${CEGUI_INCLUDE_DIRS})
	SET(CEGUI_LIB_DIR ${CEGUI_LIBDIR})
	SET(CEGUI_LIBRARIES ${CEGUI_LIBRARIES} CACHE STRING "")
ENDIF (WIN32)

#Do some preparation
SEPARATE_ARGUMENTS(CEGUI_INCLUDE_DIR)
SEPARATE_ARGUMENTS(CEGUI_LIBRARIES)

SET(CEGUI_INCLUDE_DIR ${CEGUI_INCLUDE_DIR} CACHE PATH "")
SET(CEGUI_LIBRARIES ${CEGUI_LIBRARIES} CACHE STRING "")
SET(CEGUI_LIB_DIR ${CEGUI_LIB_DIR} CACHE PATH "")

IF (CEGUI_INCLUDE_DIR AND CEGUI_LIBRARIES)
	SET(CEGUI_FOUND TRUE)
ENDIF (CEGUI_INCLUDE_DIR AND CEGUI_LIBRARIES)

IF (CEGUI_FOUND)
	IF (NOT CEGUI_FIND_QUIETLY)
		MESSAGE(STATUS "  libraries : ${CEGUI_LIBRARIES} from ${CEGUI_LIB_DIR}")
		MESSAGE(STATUS "  includes  : ${CEGUI_INCLUDE_DIR}")
	ENDIF (NOT CEGUI_FIND_QUIETLY)
ELSE (CEGUI_FOUND)
	IF (CEGUI_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could not find CEGUI")
	ENDIF (CEGUI_FIND_REQUIRED)
ENDIF (CEGUI_FOUND)

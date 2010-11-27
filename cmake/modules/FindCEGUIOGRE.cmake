# - Find CEGUIOGRE includes and library
#
# This module defines
#  CEGUIOGRE_INCLUDE_DIR
#  CEGUIOGRE_LIBRARIES, the libraries to link against to use CEGUIOGRE.
#  CEGUIOGRE_LIB_DIR, the location of the libraries
#  CEGUIOGRE_FOUND, If false, do not try to use CEGUIOGRE
#
# Copyright © 2007, Matt Williams
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

if( POLICY CMP0011 )
  cmake_policy( SET CMP0011 OLD ) # or even better, NEW
endif( POLICY CMP0011 )

IF (CEGUIOGRE_LIBRARIES AND CEGUIOGRE_INCLUDE_DIR)
	SET(CEGUIOGRE_FIND_QUIETLY TRUE)
ENDIF (CEGUIOGRE_LIBRARIES AND CEGUIOGRE_INCLUDE_DIR)

IF (WIN32) #Windows
	MESSAGE(STATUS "Looking for CEGUIOGRE")
	#SET(OGRESDK $ENV{OGRE_HOME})
	#SET(OGRESOURCE $ENV{OGRE_SRC})
	# IF (OGRESDK)
		# MESSAGE(STATUS "Using CEGUIOGRE from OGRE SDK")
		# SET(OGRESDK $ENV{OGRE_HOME})
		# STRING(REGEX REPLACE "[\\]" "/" OGRESDK "${OGRESDK}")
		# SET(CEGUIOGRE_INCLUDE_DIR ${OGRESDK}/samples/include)
		# SET(CEGUIOGRE_LIB_DIR ${OGRESDK}/lib)
		# SET(CEGUIOGRE_LIBRARIES debug OgreGUIRenderer_d optimized OgreGUIRenderer)
	# ENDIF (OGRESDK)
	# IF (OGRESOURCE)
		# MESSAGE(STATUS "Using CEGUIOGRE from OGRE Source")
		# SET(CEGUIOGRE_INCLUDE_DIR C:/ogre/Samples/Common/CEGUIRenderer/include)
		# SET(CEGUIOGRE_LIB_DIR ${OGRESDK}/lib)
		# SET(CEGUIOGRE_LIBRARIES debug OgreGUIRenderer_d optimized OgreGUIRenderer)
	# ENDIF (OGRESOURCE)
	SET(CEGUIOGRE_INCLUDE_DIR ${CEGUI_INCLUDE_DIR})
	SET(CEGUIOGRE_LIB_DIR ${CEGUI_LIB_DIR})
	SET(CEGUIOGRE_LIBRARIES debug CEGUIOgreRenderer_d optimized CEGUIOgreRenderer)
ELSE (WIN32) #Unix
	CMAKE_MINIMUM_REQUIRED(VERSION 2.4.7 FATAL_ERROR)
	FIND_PACKAGE(PkgConfig)
	PKG_SEARCH_MODULE(CEGUIOGRE CEGUI-OGRE)
	SET(CEGUIOGRE_INCLUDE_DIR ${CEGUIOGRE_INCLUDE_DIRS})
	SET(CEGUIOGRE_LIB_DIR ${CEGUIOGRE_LIBDIR})
	SET(CEGUIOGRE_LIBRARIES ${CEGUIOGRE_LIBRARIES} CACHE STRING "")
ENDIF (WIN32)

#Do some preparation
SEPARATE_ARGUMENTS(CEGUIOGRE_INCLUDE_DIR)
SEPARATE_ARGUMENTS(CEGUIOGRE_LIBRARIES)

SET(CEGUIOGRE_INCLUDE_DIR ${CEGUIOGRE_INCLUDE_DIR} CACHE PATH "")
SET(CEGUIOGRE_LIBRARIES ${CEGUIOGRE_LIBRARIES} CACHE STRING "")
SET(CEGUIOGRE_LIB_DIR ${CEGUIOGRE_LIB_DIR} CACHE PATH "")

IF (CEGUIOGRE_INCLUDE_DIR AND CEGUIOGRE_LIBRARIES)
	SET(CEGUIOGRE_FOUND TRUE)
ENDIF (CEGUIOGRE_INCLUDE_DIR AND CEGUIOGRE_LIBRARIES)

IF (CEGUIOGRE_FOUND)
	IF (NOT CEGUIOGRE_FIND_QUIETLY)
		MESSAGE(STATUS "  libraries : ${CEGUIOGRE_LIBRARIES} from ${CEGUIOGRE_LIB_DIR}")
		MESSAGE(STATUS "  includes  : ${CEGUIOGRE_INCLUDE_DIR}")
	ENDIF (NOT CEGUIOGRE_FIND_QUIETLY)
ELSE (CEGUIOGRE_FOUND)
	IF (CEGUIOGRE_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could not find CEGUIOGRE")
	ENDIF (CEGUIOGRE_FIND_REQUIRED)
ENDIF (CEGUIOGRE_FOUND)

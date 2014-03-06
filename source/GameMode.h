/*
 *  Copyright (C) 2011-2014  OpenDungeons Team
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef GAMEMODE_H
#define GAMEMODE_H

#include "AbstractApplicationMode.h"

#include "GameMap.h"

class  GameMode: public AbstractApplicationMode
{
 public:
    GameMode(ModeManager*);

    virtual ~GameMode();

    virtual bool mouseMoved     (const OIS::MouseEvent &arg);
    virtual bool mousePressed   (const OIS::MouseEvent &arg, OIS::MouseButtonID id);
    virtual bool mouseReleased  (const OIS::MouseEvent &arg, OIS::MouseButtonID id);
    virtual bool keyPressed     (const OIS::KeyEvent &arg);
    virtual bool keyReleased    (const OIS::KeyEvent &arg);
    virtual void handleHotkeys  (OIS::KeyCode keycode);

    void onFrameStarted(const Ogre::FrameEvent& evt);
    void onFrameEnded(const Ogre::FrameEvent& evt);

private:
    //! \brief Sets whether a tile must marked or unmarked for digging.
    //! this value is based on the first marked flag tile selected.
    bool mDigSetBool;

    //! \brief A reference to the game map used by the game mode
    //! For now, handled by the frame listener, don't delete it.
    GameMap* mGameMap;

    //! \brief Stores the lastest mouse cursor and light positions.
    int mMouseX;
    int mMouseY;

    //! \brief The Mouse environment light following the mouse, don't delete it.
    Ogre::Light* mMouseLight;

    //! \brief Handle updating the selector position on screen
    void handleCursorPositionUpdate();

    //! \brief A sub-function called by mouseMoved()
    //! It will handle the potential mouse wheel logic
    void handleMouseWheel(const OIS::MouseEvent& arg);

    // Refresh the tiles borders based a recent change on the map
    void refreshBorderingTilesOf(const std::vector<Tile*>& affectedTiles);
};

#endif // GAMEMODE_H

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

#ifndef ODCLIENT_H
#define ODCLIENT_H

#include "ODSocketClient.h"
#include "ODPacket.h"
#include "ChatMessage.h"

#include <OgreSingleton.h>

// TODO : put this into some better header
#define OD_STRING_S(x) #x
#define OD_STRING_S_(x) OD_STRING_S(x)
#define S__LINE__ OD_STRING_S_(__LINE__)
#define OD_ASSERT_TRUE(a)        if(!(a)) LogManager::getSingleton().logMessage("False Assert file " + std::string(__FILE__) + " line " + std::string(S__LINE__))

class ODClient: public Ogre::Singleton<ODClient>,
    public ODSocketClient
{
    friend class Console;
 public:
    ODClient();
    ~ODClient();

    // CLIENT

    /*! \brief A function which runs on the client to handle communications with the server.
     *
     * A single instance of this thread is spawned by the client when it connects
     * to a server.
     */
    void processClientSocketMessages();

    /*! \brief The function which monitors the clientNotificationQueue for new events and informs the server about them.
     *
     * This runs on the client side and acts as a "consumer" on the
     * clientNotificationQueue.  It takes an event out of the queue, determines
     * which clients need to be informed about that particular event, and
     * dispacthes TCP packets to inform the clients about the new information.
     */
    void processClientNotifications();

 private:
    void sendToServer(ODPacket& packetToSend);

    std::string mTmpReceivedString;
};

#endif // ODCLIENT_H
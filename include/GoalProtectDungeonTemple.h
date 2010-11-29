#ifndef GOALPROTECTDUNGEONTEMPLE_H
#define GOALPROTECTDUNGEONTEMPLE_H

#include "Goal.h"

class GoalProtectDungeonTemple : public Goal
{
	public:
		// Constructors
		GoalProtectDungeonTemple(string nName, string nArguments);

		// Inherited functions
		bool isMet(Seat *s);
		bool isUnmet(Seat *s);
		bool isFailed(Seat *s);
		string getDescription();
		string getSuccessMessage();
		string getFailedMessage();
};

#endif

#Requires AutoHotkey v2.0

/**
 * Literally just counts failures in the test and attaches them to a property on
 * the Yunit instance
 */
class YunitResultCounter {

    static passes := 0
    static failures := 0

    __New(instance) { 

    }

    Update(Category, Test, Result)
    {
        if(result is Error){
            YunitResultCounter.failures++
        }
        else{
            YunitResultCounter.passes++
        }
    }
}
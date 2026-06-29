#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_USER_PRESENCE_TYPE.ahk" { POWER_USER_PRESENCE_TYPE }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_USER_PRESENCE {
    #StructPack 4

    UserPresence : POWER_USER_PRESENCE_TYPE

}

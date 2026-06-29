#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSA_COMPATIBILITY_BEHAVIOR_ID.ahk" { WSA_COMPATIBILITY_BEHAVIOR_ID }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSA_COMPATIBILITY_MODE {
    #StructPack 4

    BehaviorId : WSA_COMPATIBILITY_BEHAVIOR_ID

    TargetOsVersion : UInt32

}

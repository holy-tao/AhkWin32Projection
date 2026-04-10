#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSA_COMPATIBILITY_BEHAVIOR_ID.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class WSA_COMPATIBILITY_MODE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {WSA_COMPATIBILITY_BEHAVIOR_ID}
     */
    BehaviorId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TargetOsVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

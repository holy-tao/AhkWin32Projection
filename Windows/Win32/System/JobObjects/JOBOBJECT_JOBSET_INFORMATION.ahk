#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOBOBJECT_JOBSET_INFORMATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MemberLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

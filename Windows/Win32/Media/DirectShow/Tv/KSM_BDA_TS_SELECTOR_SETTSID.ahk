#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_TS_SELECTOR_SETTSID extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSM_NODE}
     */
    NodeMethod{
        get {
            if(!this.HasProp("__NodeMethod"))
                this.__NodeMethod := KSM_NODE(this.ptr + 0)
            return this.__NodeMethod
        }
    }

    /**
     * @type {Integer}
     */
    usTSID {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}

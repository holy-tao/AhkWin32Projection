#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_WMDRMTUNER_SETPIDPROTECTION extends Win32Struct
{
    static sizeof => 40

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
    ulPID {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    uuidKeyID {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

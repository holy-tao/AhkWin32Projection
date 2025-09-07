#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_CAS_CLOSEMMIDIALOG extends Win32Struct
{
    static sizeof => 56

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
    ulDialogRequest {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 20, 11, "UTF-16")
        set => StrPut(value, this.ptr + 20, 11, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ulDialogNumber {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ulReason {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}

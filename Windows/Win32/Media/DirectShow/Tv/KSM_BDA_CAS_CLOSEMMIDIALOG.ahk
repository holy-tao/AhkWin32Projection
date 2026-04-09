#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_CAS_CLOSEMMIDIALOG extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSM_NODE}
     */
    NodeMethod {
        get {
            if(!this.HasProp("__NodeMethod"))
                this.__NodeMethod := KSM_NODE(0, this)
            return this.__NodeMethod
        }
    }

    /**
     * @type {Integer}
     */
    ulDialogRequest {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 28, 11, "UTF-8")
        set => StrPut(value, this.ptr + 28, 11, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    ulDialogNumber {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulReason {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}

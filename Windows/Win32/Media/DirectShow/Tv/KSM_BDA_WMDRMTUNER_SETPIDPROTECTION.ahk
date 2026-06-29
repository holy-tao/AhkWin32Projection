#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_WMDRMTUNER_SETPIDPROTECTION extends Win32Struct {
    static sizeof => 56

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
    ulPID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Guid}
     */
    uuidKeyID {
        get {
            if(!this.HasProp("__uuidKeyID"))
                this.__uuidKeyID := Guid(36, this)
            return this.__uuidKeyID
        }
    }
}

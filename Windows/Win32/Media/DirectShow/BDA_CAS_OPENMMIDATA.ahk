#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_CAS_OPENMMIDATA extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulDialogNumber {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulDialogRequest {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    uuidDialogType {
        get {
            if(!this.HasProp("__uuidDialogType"))
                this.__uuidDialogType := Guid(8, this)
            return this.__uuidDialogType
        }
    }

    /**
     * @type {Integer}
     */
    usDialogDataLength {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    argbDialogData {
        get {
            if(!this.HasProp("__argbDialogDataProxyArray"))
                this.__argbDialogDataProxyArray := Win32FixedArray(this.ptr + 26, 1, Primitive, "char")
            return this.__argbDialogDataProxyArray
        }
    }
}

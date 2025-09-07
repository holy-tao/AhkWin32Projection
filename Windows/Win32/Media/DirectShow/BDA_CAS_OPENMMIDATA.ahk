#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_CAS_OPENMMIDATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Pointer<Guid>}
     */
    uuidDialogType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    usDialogDataLength {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    argbDialogData{
        get {
            if(!this.HasProp("__argbDialogDataProxyArray"))
                this.__argbDialogDataProxyArray := Win32FixedArray(this.ptr + 18, 1, Primitive, "char")
            return this.__argbDialogDataProxyArray
        }
    }
}

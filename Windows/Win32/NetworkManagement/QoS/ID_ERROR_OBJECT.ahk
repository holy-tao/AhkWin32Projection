#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ID_ERROR_OBJECT structure contains error message information for Identity Policy Elements for RSVP.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-id_error_object
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class ID_ERROR_OBJECT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * Length of <b>udIdErrData</b>, in bytes.
     * @type {Integer}
     */
    usIdErrLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type of Identity Policy Element error.
     * @type {Integer}
     */
    ucAType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Sub-type of the Identity Policy Element error.
     * @type {Integer}
     */
    ucSubType {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    usReserved {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Value for the Identity Policy Element error.
     * @type {Integer}
     */
    usIdErrorValue {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Identity Policy Element error data.
     * @type {Array<Byte>}
     */
    ucIdErrData{
        get {
            if(!this.HasProp("__ucIdErrDataProxyArray"))
                this.__ucIdErrDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__ucIdErrDataProxyArray
        }
    }
}

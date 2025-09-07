#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by the SCardLocateCardsByATR function to locate cards.
 * @see https://learn.microsoft.com/windows/win32/api/winscard/ns-winscard-scard_atrmask
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_ATRMASK extends Win32Struct
{
    static sizeof => 76

    static packingSize => 4

    /**
     * The number of bytes in the ATR and the mask.
     * @type {Integer}
     */
    cbAtr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <b>BYTE</b> values for the ATR of the card with extra alignment bytes.
     * @type {Array<Byte>}
     */
    rgbAtr{
        get {
            if(!this.HasProp("__rgbAtrProxyArray"))
                this.__rgbAtrProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__rgbAtrProxyArray
        }
    }

    /**
     * An array of <b>BYTE</b> values for the mask for the ATR with extra alignment bytes.
     * @type {Array<Byte>}
     */
    rgbMask{
        get {
            if(!this.HasProp("__rgbMaskProxyArray"))
                this.__rgbMaskProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__rgbMaskProxyArray
        }
    }
}

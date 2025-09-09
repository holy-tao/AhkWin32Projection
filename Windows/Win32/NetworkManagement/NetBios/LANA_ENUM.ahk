#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LANA_ENUM structure contains the numbers for the current LAN adapters.
 * @remarks
 * The <b>LANA_ENUM</b> structure is pointed to by the ncb_buffer member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure when an application issues the <b>NCBENUM</b> command. The <b>NCBENUM</b> command is not part of the IBM NetBIOS 3.0 specification.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-lana_enum
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class LANA_ENUM extends Win32Struct
{
    static sizeof => 256

    static packingSize => 1

    /**
     * Specifies the number of valid entries in the array of LAN adapter numbers.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies an array of LAN adapter numbers.
     * @type {Array<Byte>}
     */
    lana{
        get {
            if(!this.HasProp("__lanaProxyArray"))
                this.__lanaProxyArray := Win32FixedArray(this.ptr + 1, 255, Primitive, "char")
            return this.__lanaProxyArray
        }
    }
}

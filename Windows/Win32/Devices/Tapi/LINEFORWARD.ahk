#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEFORWARD structure describes an entry of the forwarding instructions. The LINEFORWARDLIST and the LINEADDRESSSTATUS structures can contain an array of LINEFORWARD structures.
 * @remarks
 * This structure may not be extended.
 * 
 * Each entry in the 
 * <b>LINEFORWARD</b> structure specifies a forwarding request.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineforward
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEFORWARD extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Types of forwarding. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">LINEFORWARDMODE_ Constants</a>.
     * @type {Integer}
     */
    dwForwardMode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the variably sized field containing the address of a caller to be forwarded, in bytes.
     * @type {Integer}
     */
    dwCallerAddressSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCallerAddressOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Country or region code of the destination address to which the call is to be forwarded.
     * @type {Integer}
     */
    dwDestCountryCode {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the variably sized field containing the address of the address where calls are to be forwarded, in bytes.
     * @type {Integer}
     */
    dwDestAddressSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of this structure to the variably sized field containing the address of the address where calls are to be forwarded. The size of the field is specified by <b>dwDestAddressSize</b>.
     * @type {Integer}
     */
    dwDestAddressOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

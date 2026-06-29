#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEFORWARD structure describes an entry of the forwarding instructions. The LINEFORWARDLIST and the LINEADDRESSSTATUS structures can contain an array of LINEFORWARD structures.
 * @remarks
 * This structure may not be extended.
 * 
 * Each entry in the 
 * <b>LINEFORWARD</b> structure specifies a forwarding request.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineforward
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEFORWARD {
    #StructPack 4

    /**
     * Types of forwarding. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineforwardmode--constants">LINEFORWARDMODE_ Constants</a>.
     */
    dwForwardMode : UInt32

    /**
     * Size of the variably sized field containing the address of a caller to be forwarded, in bytes.
     */
    dwCallerAddressSize : UInt32

    dwCallerAddressOffset : UInt32

    /**
     * Country or region code of the destination address to which the call is to be forwarded.
     */
    dwDestCountryCode : UInt32

    /**
     * Size of the variably sized field containing the address of the address where calls are to be forwarded, in bytes.
     */
    dwDestAddressSize : UInt32

    /**
     * Offset from the beginning of this structure to the variably sized field containing the address of the address where calls are to be forwarded. The size of the field is specified by <b>dwDestAddressSize</b>.
     */
    dwDestAddressOffset : UInt32

}

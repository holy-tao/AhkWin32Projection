#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SdpAttributeRange structure is used in a Bluetooth query to constrain the set of attributes to return in the query.
 * @see https://learn.microsoft.com/windows/win32/api/bthsdpdef/ns-bthsdpdef-sdpattributerange
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SdpAttributeRange {
    #StructPack 2

    /**
     * Minimum attribute value for which to search.
     */
    minAttribute : UInt16

    /**
     * Maximum attribute value for which to search.
     */
    maxAttribute : UInt16

}

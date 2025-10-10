#Requires AutoHotkey v2.0.0 64-bit

/**
 * The COMPARTMENT_ID enumeration indicates the network routing compartment identifier.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-compartment_id
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class COMPARTMENT_ID{

    /**
     * Indicates that the routing compartment is undefined.
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED_COMPARTMENT_ID => 0

    /**
     * Indicates the default routing compartment.
     * @type {Integer (Int32)}
     */
    static DEFAULT_COMPARTMENT_ID => 1
}

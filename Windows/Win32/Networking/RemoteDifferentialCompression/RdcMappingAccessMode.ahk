#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the access mode values for RDC file mapping objects.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ne-msrdc-rdcmappingaccessmode
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcMappingAccessMode{

    /**
     * The mapping access mode is unknown.
     * @type {Integer (Int32)}
     */
    static RDCMAPPING_Undefined => 0

    /**
     * Specifies read-only access.
     * @type {Integer (Int32)}
     */
    static RDCMAPPING_ReadOnly => 1

    /**
     * Specifies read/write access.
     * @type {Integer (Int32)}
     */
    static RDCMAPPING_ReadWrite => 2
}

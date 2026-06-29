#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the access mode values for RDC file mapping objects.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdcmappingaccessmode
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct RdcMappingAccessMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

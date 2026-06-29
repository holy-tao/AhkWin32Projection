#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the encoding method that is used by the serialization object to produce the package.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_write_flags
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct OPC_WRITE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use Zip64 encoding. The minimum software version for extracting a package with Zip64 encoding is 4.5.
     * @type {Integer (Int32)}
     */
    static OPC_WRITE_DEFAULT => 0

    /**
     * Force Zip32 encoding. The minimum software version for extracting a package with Zip32 encoding is 2.0.
     * 
     * If   one or more of the following Zip32 limitations are violated, the package write will fail:<ul>
     * <li>The maximum size for a single, uncompressed file item is 4 gigabytes.</li>
     * <li>The maximum number of file items is 65535 (2¹⁶-1).</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static OPC_WRITE_FORCE_ZIP32 => 1
}

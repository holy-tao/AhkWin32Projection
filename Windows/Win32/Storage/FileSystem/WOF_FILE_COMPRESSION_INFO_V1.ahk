#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines metadata specific to files provided by WOF_PROVIDER_FILE.
 * @see https://docs.microsoft.com/windows/win32/api//wofapi/ns-wofapi-wof_file_compression_info_v1
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class WOF_FILE_COMPRESSION_INFO_V1 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the compression algorithm that is used to compress this file. Currently defined algorithms are: 
     * 
     * <table>
     * <tr>
     * <td>FILE_PROVIDER_COMPRESSION_XPRESS4K</td>
     * <td>Indicates that the data for the file should be compressed in 4kb chunks with the XPress algorithm. This algorithm is designed to be computationally lightweight, and provides for rapid access to data.</td>
     * </tr>
     * <tr>
     * <td>FILE_PROVIDER_COMPRESSION_LZX</td>
     * <td>Indicates that the data for the file should be compressed in 32kb chunks with the LZX algorithm. This algorithm is designed to be highly compact, and provides for small footprint for infrequently accessed data.</td>
     * </tr>
     * <tr>
     * <td>FILE_PROVIDER_COMPRESSION_XPRESS8K</td>
     * <td>Indicates that the data for the file should be compressed in 8kb chunks with the XPress algorithm.</td>
     * </tr>
     * <tr>
     * <td>FILE_PROVIDER_COMPRESSION_XPRESS16K</td>
     * <td>Indicates that the data for the file should be compressed in 16kb chunks with the XPress algorithm.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Algorithm {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies flags for the operation. Reserved for future use, should be 0.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of RDC-specific error codes.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ne-msrdc-rdc_errorcode
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RDC_ErrorCode extends Win32Enum{

    /**
     * The operation was completed successfully.
     * @type {Integer (Int32)}
     */
    static RDC_NoError => 0

    /**
     * The data header is incompatible with this library.
     * @type {Integer (Int32)}
     */
    static RDC_HeaderVersionNewer => 1

    /**
     * The data header is incompatible with this library.
     * @type {Integer (Int32)}
     */
    static RDC_HeaderVersionOlder => 2

    /**
     * The data header is missing or corrupt.
     * @type {Integer (Int32)}
     */
    static RDC_HeaderMissingOrCorrupt => 3

    /**
     * The data header format is incorrect.
     * @type {Integer (Int32)}
     */
    static RDC_HeaderWrongType => 4

    /**
     * The end of data was reached before all data expected was read.
     * @type {Integer (Int32)}
     */
    static RDC_DataMissingOrCorrupt => 5

    /**
     * Additional data was found past where the end of data was expected.
     * @type {Integer (Int32)}
     */
    static RDC_DataTooManyRecords => 6

    /**
     * The final file checksum doesn't match.
     * @type {Integer (Int32)}
     */
    static RDC_FileChecksumMismatch => 7

    /**
     * An application callback function returned failure.
     * @type {Integer (Int32)}
     */
    static RDC_ApplicationError => 8

    /**
     * The operation was aborted.
     * @type {Integer (Int32)}
     */
    static RDC_Aborted => 9

    /**
     * The failure of the function is not RDC-specific and the <b>HRESULT</b> returned by 
     *       the function contains the specific error code.
     * @type {Integer (Int32)}
     */
    static RDC_Win32Error => 10
}

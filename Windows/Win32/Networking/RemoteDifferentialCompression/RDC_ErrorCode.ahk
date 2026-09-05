#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of RDC-specific error codes.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdc_errorcode
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
class RDC_ErrorCode extends Win32Enum {

    /**
     * The operation was completed successfully.
     * Native name: RDC_NoError
     * @type {Integer (Int32)}
     */
    static NoError => 0

    /**
     * The data header is incompatible with this library.
     * Native name: RDC_HeaderVersionNewer
     * @type {Integer (Int32)}
     */
    static HeaderVersionNewer => 1

    /**
     * The data header is incompatible with this library.
     * Native name: RDC_HeaderVersionOlder
     * @type {Integer (Int32)}
     */
    static HeaderVersionOlder => 2

    /**
     * The data header is missing or corrupt.
     * Native name: RDC_HeaderMissingOrCorrupt
     * @type {Integer (Int32)}
     */
    static HeaderMissingOrCorrupt => 3

    /**
     * The data header format is incorrect.
     * Native name: RDC_HeaderWrongType
     * @type {Integer (Int32)}
     */
    static HeaderWrongType => 4

    /**
     * The end of data was reached before all data expected was read.
     * Native name: RDC_DataMissingOrCorrupt
     * @type {Integer (Int32)}
     */
    static DataMissingOrCorrupt => 5

    /**
     * Additional data was found past where the end of data was expected.
     * Native name: RDC_DataTooManyRecords
     * @type {Integer (Int32)}
     */
    static DataTooManyRecords => 6

    /**
     * The final file checksum doesn't match.
     * Native name: RDC_FileChecksumMismatch
     * @type {Integer (Int32)}
     */
    static FileChecksumMismatch => 7

    /**
     * An application callback function returned failure.
     * Native name: RDC_ApplicationError
     * @type {Integer (Int32)}
     */
    static ApplicationError => 8

    /**
     * The operation was aborted.
     * Native name: RDC_Aborted
     * @type {Integer (Int32)}
     */
    static Aborted => 9

    /**
     * The failure of the function is not RDC-specific and the <b>HRESULT</b> returned by 
     *       the function contains the specific error code.
     * Native name: RDC_Win32Error
     * @type {Integer (Int32)}
     */
    static Win32Error => 10
}

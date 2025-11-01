#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IRdcFileReader interface is used to provide the equivalent of a file handle, because the data being synchronized may not exist as a file on disk.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcfilereader
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcFileReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcFileReader
     * @type {Guid}
     */
    static IID => Guid("{96236a74-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcFileReader
     * @type {Guid}
     */
    static CLSID => Guid("{96236a89-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFileSize", "Read", "GetFilePosition"]

    /**
     * Retrieves the size of the specified file, in bytes.
     * @param {Pointer<Integer>} fileSize 
     * @returns {HRESULT} If the function succeeds, the return value is the low-order doubleword of the file size, and, if 
     *        <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the function puts the 
     *        high-order doubleword of the file size into the variable pointed to by that parameter.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is <b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. When 
     *        <i>lpFileSizeHigh</i> is <b>NULL</b>, the results returned for large 
     *        files are ambiguous, and you will not be able to determine the actual size of the file. It is recommended that 
     *        you use <a href="/windows/desktop/api/fileapi/nf-fileapi-getfilesizeex">GetFileSizeEx</a> instead.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b> and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return a value other than 
     *        <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize(fileSize) {
        fileSizeMarshal := fileSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, fileSizeMarshal, fileSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offsetFileStart 
     * @param {Integer} bytesToRead 
     * @param {Pointer<Integer>} bytesActuallyRead 
     * @param {Pointer<Integer>} buffer 
     * @param {Pointer<BOOL>} eof 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilereader-read
     */
    Read(offsetFileStart, bytesToRead, bytesActuallyRead, buffer, eof) {
        bytesActuallyReadMarshal := bytesActuallyRead is VarRef ? "uint*" : "ptr"
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", offsetFileStart, "uint", bytesToRead, bytesActuallyReadMarshal, bytesActuallyRead, bufferMarshal, buffer, "ptr", eof, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} offsetFromStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilereader-getfileposition
     */
    GetFilePosition(offsetFromStart) {
        offsetFromStartMarshal := offsetFromStart is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, offsetFromStartMarshal, offsetFromStart, "HRESULT")
        return result
    }
}

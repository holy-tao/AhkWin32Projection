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
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize() {
        result := ComCall(3, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
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
        eofMarshal := eof is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", offsetFileStart, "uint", bytesToRead, bytesActuallyReadMarshal, bytesActuallyRead, bufferMarshal, buffer, eofMarshal, eof, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilereader-getfileposition
     */
    GetFilePosition() {
        result := ComCall(5, this, "uint*", &offsetFromStart := 0, "HRESULT")
        return offsetFromStart
    }
}

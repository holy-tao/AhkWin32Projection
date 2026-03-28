#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IRdcFileReader interface is used to provide the equivalent of a file handle, because the data being synchronized may not exist as a file on disk.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcfilereader
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
     * Returns the size of a file.
     * @returns {Integer} Address of a <b>ULONGLONG</b> that on successful return will be filled with the size 
     *       of the file, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilereader-getfilesize
     */
    GetFileSize() {
        result := ComCall(3, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
    }

    /**
     * Reads the specified amount of data starting at the specified position.
     * @remarks
     * Typically RDC will read the file sequentially from start to end. When reading signatures, the file may be read 
     *     more than once.
     * 
     * If the <b>BOOL</b> pointed to by the <i>eof</i> parameter is not <b>TRUE</b> 
     *     on return then the value pointed to by the <i>bytesActuallyRead</i> parameter must equal the 
     *     <i>bytesToRead</i> parameter. If the value pointed to by the <i>eof</i> 
     *     parameter is set, then the value pointed to by the <i>bytesActuallyRead</i> parameter can be 
     *     any value between zero and the <i>bytesToRead</i> parameter.
     * @param {Integer} offsetFileStart Offset from the start of the data at which to start the read.
     * @param {Integer} bytesToRead Number of bytes to be read.
     * @param {Pointer<Integer>} bytesActuallyRead Address of a <b>ULONG</b> that will receive the number of bytes read.
     * @param {Pointer<Integer>} _buffer 
     * @param {Pointer<BOOL>} eof Address of a <b>BOOL</b> that is set to <b>TRUE</b> if the end of 
     *       the file has been read.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilereader-read
     */
    Read(offsetFileStart, bytesToRead, bytesActuallyRead, _buffer, eof) {
        bytesActuallyReadMarshal := bytesActuallyRead is VarRef ? "uint*" : "ptr"
        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"
        eofMarshal := eof is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", offsetFileStart, "uint", bytesToRead, bytesActuallyReadMarshal, bytesActuallyRead, _bufferMarshal, _buffer, eofMarshal, eof, "HRESULT")
        return result
    }

    /**
     * Returns the current file position.
     * @returns {Integer} Address of a <b>ULONGLONG</b> that will receive the current offset from the start of 
     *       the data.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilereader-getfileposition
     */
    GetFilePosition() {
        result := ComCall(5, this, "uint*", &offsetFromStart := 0, "HRESULT")
        return offsetFromStart
    }
}

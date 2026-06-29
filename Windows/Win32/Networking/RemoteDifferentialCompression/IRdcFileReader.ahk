#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IRdcFileReader interface is used to provide the equivalent of a file handle, because the data being synchronized may not exist as a file on disk.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcfilereader
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcFileReader extends IUnknown {
    /**
     * The interface identifier for IRdcFileReader
     * @type {Guid}
     */
    static IID := Guid("{96236a74-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcFileReader
     * @type {Guid}
     */
    static CLSID := Guid("{96236a89-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcFileReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFileSize     : IntPtr
        Read            : IntPtr
        GetFilePosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcFileReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Pointer<Integer>} _buffer Address of the buffer that receives the data read. This buffer must be at least 
     *       <i>bytesToRead</i> bytes in size.
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

    Query(iid) {
        if (IRdcFileReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 2)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 6)
        this.vtbl.GetFilePosition := CallbackCreate(GetMethod(implObj, "GetFilePosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFileSize)
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.GetFilePosition)
    }
}

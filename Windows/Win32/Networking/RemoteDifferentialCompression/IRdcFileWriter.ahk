#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRdcFileReader.ahk" { IRdcFileReader }

/**
 * Abstract interface to read from and write to a file.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-irdcfilewriter
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct IRdcFileWriter extends IRdcFileReader {
    /**
     * The interface identifier for IRdcFileWriter
     * @type {Guid}
     */
    static IID := Guid("{96236a75-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRdcFileWriter interfaces
    */
    struct Vtbl extends IRdcFileReader.Vtbl {
        Write         : IntPtr
        Truncate      : IntPtr
        DeleteOnClose : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRdcFileWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Write bytes to a file starting at a given offset.
     * @param {Integer} offsetFileStart Starting offset.
     * @param {Integer} bytesToWrite Number of bytes to be written to the file.
     * @returns {Integer} The data to be written to the file.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilewriter-write
     */
    Write(offsetFileStart, bytesToWrite) {
        result := ComCall(6, this, "uint", offsetFileStart, "uint", bytesToWrite, "char*", &_buffer := 0, "HRESULT")
        return _buffer
    }

    /**
     * Truncates a file to zero length.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilewriter-truncate
     */
    Truncate() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Sets a file to be deleted (or truncated) on close.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilewriter-deleteonclose
     */
    DeleteOnClose() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRdcFileWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 4)
        this.vtbl.Truncate := CallbackCreate(GetMethod(implObj, "Truncate"), flags, 1)
        this.vtbl.DeleteOnClose := CallbackCreate(GetMethod(implObj, "DeleteOnClose"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.Truncate)
        CallbackFree(this.vtbl.DeleteOnClose)
    }
}

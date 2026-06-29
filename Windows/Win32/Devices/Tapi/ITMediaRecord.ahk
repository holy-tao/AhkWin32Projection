#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITMediaRecord interface provides recording-specific methods that allow an application to set and get the names of files to record.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itmediarecord
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITMediaRecord extends IDispatch {
    /**
     * The interface identifier for ITMediaRecord
     * @type {Guid}
     */
    static IID := Guid("{f5dd4592-5476-4cc1-9d4d-fad3eefe7db2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITMediaRecord interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_FileName : IntPtr
        get_FileName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITMediaRecord.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    FileName {
        get => this.get_FileName()
        set => this.put_FileName(value)
    }

    /**
     * The put_FileName method sets the name of the file to record.
     * @param {BSTR} bstrFileName The <b>BSTR</b> representation of the file name.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediarecord-put_filename
     */
    put_FileName(bstrFileName) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(7, this, BSTR, bstrFileName, "HRESULT")
        return result
    }

    /**
     * The get_FileName method retrieves the name of the file that was used for recording by this terminal.
     * @returns {BSTR} The <b>BSTR</b> representation of the file name. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediarecord-get_filename
     */
    get_FileName() {
        pbstrFileName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrFileName, "HRESULT")
        return pbstrFileName
    }

    Query(iid) {
        if (ITMediaRecord.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_FileName := CallbackCreate(GetMethod(implObj, "put_FileName"), flags, 2)
        this.vtbl.get_FileName := CallbackCreate(GetMethod(implObj, "get_FileName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_FileName)
        CallbackFree(this.vtbl.get_FileName)
    }
}

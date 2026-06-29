#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A developer implemented interface that allows a metafile to be replayed.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1gdimetafilesink
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GdiMetafileSink extends IUnknown {
    /**
     * The interface identifier for ID2D1GdiMetafileSink
     * @type {Guid}
     */
    static IID := Guid("{82237326-8111-4f7c-bcf4-b5c1175564fe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GdiMetafileSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProcessRecord : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GdiMetafileSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is called once for each record stored in a metafile.
     * @param {Integer} recordType Type: <b>DWORD</b>
     * 
     * The type of the record.
     * @param {Pointer<Void>} recordData Type: <b>void*</b>
     * 
     * The data for the record.
     * @param {Integer} recordDataSize Type: <b>UINT</b>
     * 
     * The byte size of the record data.
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * Return true if the record is successfully.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gdimetafilesink-processrecord
     */
    ProcessRecord(recordType, recordData, recordDataSize) {
        recordDataMarshal := recordData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", recordType, recordDataMarshal, recordData, "uint", recordDataSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1GdiMetafileSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessRecord := CallbackCreate(GetMethod(implObj, "ProcessRecord"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessRecord)
    }
}

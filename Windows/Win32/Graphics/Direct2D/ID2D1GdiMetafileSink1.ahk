#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1GdiMetafileSink.ahk" { ID2D1GdiMetafileSink }

/**
 * This interface performs all the same functions as the existing ID2D1GdiMetafileSink interface. It also enables access to metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1gdimetafilesink1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GdiMetafileSink1 extends ID2D1GdiMetafileSink {
    /**
     * The interface identifier for ID2D1GdiMetafileSink1
     * @type {Guid}
     */
    static IID := Guid("{fd0ecb6b-91e6-411e-8655-395e760f91b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GdiMetafileSink1 interfaces
    */
    struct Vtbl extends ID2D1GdiMetafileSink.Vtbl {
        ProcessRecord : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GdiMetafileSink1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides access to metafile records, including their type, data, and flags.
     * @remarks
     * For details on the EMF and EMF+ formats, please see Microsoft technical documents  <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca">MS-EMF</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emfplus/5f92c789-64f2-46b5-9ed4-15a9bb0946c6">MS-EMFPLUS</a>.
     * @param {Integer} recordType Type: <b>DWORD</b>
     * 
     * The type of metafile record being processed. Please see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca">MS-EMF</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emfplus/5f92c789-64f2-46b5-9ed4-15a9bb0946c6">MS-EMFPLUS</a> for a list of record types.
     * @param {Pointer<Void>} recordData Type: <b>const void*</b>
     * 
     * The data contained in this record. Please see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca">MS-EMF</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emfplus/5f92c789-64f2-46b5-9ed4-15a9bb0946c6">MS-EMFPLUS</a> for information on record data layouts.
     * @param {Integer} recordDataSize Type: <b>UINT</b>
     * 
     * TThe size of the data pointed to by recordData.
     * @param {Integer} flags Type: <b>UINT32</b>
     * 
     * The set of flags set for this record. Please see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca">MS-EMF</a> and <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-emfplus/5f92c789-64f2-46b5-9ed4-15a9bb0946c6">MS-EMFPLUS</a> for information on record flags.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * S_OK if successful, otherwise a failure HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gdimetafilesink1-processrecord
     */
    ProcessRecord(recordType, recordData, recordDataSize, flags) {
        recordDataMarshal := recordData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", recordType, recordDataMarshal, recordData, "uint", recordDataSize, "uint", flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1GdiMetafileSink1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessRecord := CallbackCreate(GetMethod(implObj, "ProcessRecord"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessRecord)
    }
}

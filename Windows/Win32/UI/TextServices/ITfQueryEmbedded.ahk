#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\FORMATETC.ahk" { FORMATETC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfQueryEmbedded interface is implemented by the TSF manager and used by a text service to determine if a context can accept an embedded object.
 * @remarks
 * To obtain an instance of this interface, call the <b>ITfContext::QueryInterface</b> method with IID_ITfQueryEmbedded.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfqueryembedded
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfQueryEmbedded extends IUnknown {
    /**
     * The interface identifier for ITfQueryEmbedded
     * @type {Guid}
     */
    static IID := Guid("{0fab9bdb-d250-4169-84e5-6be118fdd7a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfQueryEmbedded interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryInsertEmbedded : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfQueryEmbedded.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfQueryEmbedded::QueryInsertEmbedded method
     * @param {Pointer<Guid>} pguidService A GUID that identifies the service associated with the object. This value can be <b>NULL</b> if <i>pFormatEtc</i> is valid.
     * @param {Pointer<FORMATETC>} pFormatEtc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure that contains data about the object to be embedded. This value can be <b>NULL</b> if <i>pguidService</i> is valid.
     * @returns {BOOL} Pointer to a Boolean value that receives the query result. This value receives a nonzero value if the object can be embedded, or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfqueryembedded-queryinsertembedded
     */
    QueryInsertEmbedded(pguidService, pFormatEtc) {
        result := ComCall(3, this, Guid.Ptr, pguidService, FORMATETC.Ptr, pFormatEtc, BOOL.Ptr, &pfInsertable := 0, "HRESULT")
        return pfInsertable
    }

    Query(iid) {
        if (ITfQueryEmbedded.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryInsertEmbedded := CallbackCreate(GetMethod(implObj, "QueryInsertEmbedded"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryInsertEmbedded)
    }
}

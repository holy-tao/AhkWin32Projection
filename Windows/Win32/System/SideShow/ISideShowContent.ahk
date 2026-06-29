#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISideShowCapabilities.ahk" { ISideShowCapabilities }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct ISideShowContent extends IUnknown {
    /**
     * The interface identifier for ISideShowContent
     * @type {Guid}
     */
    static IID := Guid("{c18552ed-74ff-4fec-be07-4cfed29d4887}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISideShowContent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContent               : IntPtr
        get_ContentId            : IntPtr
        get_DifferentiateContent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISideShowContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ContentId {
        get => this.get_ContentId()
    }

    /**
     * @type {BOOL} 
     */
    DifferentiateContent {
        get => this.get_DifferentiateContent()
    }

    /**
     * 
     * @param {ISideShowCapabilities} in_pICapabilities 
     * @param {Pointer<Integer>} out_pdwSize 
     * @param {Pointer<Pointer<Integer>>} out_ppbData 
     * @returns {HRESULT} 
     */
    GetContent(in_pICapabilities, out_pdwSize, out_ppbData) {
        out_pdwSizeMarshal := out_pdwSize is VarRef ? "uint*" : "ptr"
        out_ppbDataMarshal := out_ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", in_pICapabilities, out_pdwSizeMarshal, out_pdwSize, out_ppbDataMarshal, out_ppbData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentId() {
        result := ComCall(4, this, "uint*", &out_pcontentId := 0, "HRESULT")
        return out_pcontentId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_DifferentiateContent() {
        result := ComCall(5, this, BOOL.Ptr, &out_pfDifferentiateContent := 0, "HRESULT")
        return out_pfDifferentiateContent
    }

    Query(iid) {
        if (ISideShowContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContent := CallbackCreate(GetMethod(implObj, "GetContent"), flags, 4)
        this.vtbl.get_ContentId := CallbackCreate(GetMethod(implObj, "get_ContentId"), flags, 2)
        this.vtbl.get_DifferentiateContent := CallbackCreate(GetMethod(implObj, "get_DifferentiateContent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContent)
        CallbackFree(this.vtbl.get_ContentId)
        CallbackFree(this.vtbl.get_DifferentiateContent)
    }
}

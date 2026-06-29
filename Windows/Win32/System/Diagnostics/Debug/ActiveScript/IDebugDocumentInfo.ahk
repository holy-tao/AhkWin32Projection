#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DOCUMENTNAMETYPE.ahk" { DOCUMENTNAMETYPE }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugDocumentInfo extends IUnknown {
    /**
     * The interface identifier for IDebugDocumentInfo
     * @type {Guid}
     */
    static IID := Guid("{51973c1f-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDocumentInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName            : IntPtr
        GetDocumentClassId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDocumentInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @param {DOCUMENTNAMETYPE} dnt 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName(dnt) {
        pbstrName := BSTR.Owned()
        result := ComCall(3, this, DOCUMENTNAMETYPE, dnt, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetDocumentClassId() {
        pclsidDocument := Guid()
        result := ComCall(4, this, Guid.Ptr, pclsidDocument, "HRESULT")
        return pclsidDocument
    }

    Query(iid) {
        if (IDebugDocumentInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 3)
        this.vtbl.GetDocumentClassId := CallbackCreate(GetMethod(implObj, "GetDocumentClassId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetDocumentClassId)
    }
}

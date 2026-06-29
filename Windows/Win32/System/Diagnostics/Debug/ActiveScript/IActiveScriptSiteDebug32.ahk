#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugDocumentContext.ahk" { IDebugDocumentContext }
#Import ".\IDebugApplication32.ahk" { IDebugApplication32 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugApplicationNode.ahk" { IDebugApplicationNode }
#Import ".\IActiveScriptErrorDebug.ahk" { IActiveScriptErrorDebug }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptSiteDebug32 extends IUnknown {
    /**
     * The interface identifier for IActiveScriptSiteDebug32
     * @type {Guid}
     */
    static IID := Guid("{51973c11-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptSiteDebug32 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDocumentContextFromPosition : IntPtr
        GetApplication                 : IntPtr
        GetRootApplicationNode         : IntPtr
        OnScriptErrorDebug             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptSiteDebug32.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwSourceContext 
     * @param {Integer} uCharacterOffset 
     * @param {Integer} uNumChars 
     * @returns {IDebugDocumentContext} 
     */
    GetDocumentContextFromPosition(dwSourceContext, uCharacterOffset, uNumChars) {
        result := ComCall(3, this, "uint", dwSourceContext, "uint", uCharacterOffset, "uint", uNumChars, "ptr*", &ppsc := 0, "HRESULT")
        return IDebugDocumentContext(ppsc)
    }

    /**
     * 
     * @returns {IDebugApplication32} 
     */
    GetApplication() {
        result := ComCall(4, this, "ptr*", &ppda := 0, "HRESULT")
        return IDebugApplication32(ppda)
    }

    /**
     * 
     * @returns {IDebugApplicationNode} 
     */
    GetRootApplicationNode() {
        result := ComCall(5, this, "ptr*", &ppdanRoot := 0, "HRESULT")
        return IDebugApplicationNode(ppdanRoot)
    }

    /**
     * 
     * @param {IActiveScriptErrorDebug} pErrorDebug 
     * @param {Pointer<BOOL>} pfEnterDebugger 
     * @param {Pointer<BOOL>} pfCallOnScriptErrorWhenContinuing 
     * @returns {HRESULT} 
     */
    OnScriptErrorDebug(pErrorDebug, pfEnterDebugger, pfCallOnScriptErrorWhenContinuing) {
        pfEnterDebuggerMarshal := pfEnterDebugger is VarRef ? "int*" : "ptr"
        pfCallOnScriptErrorWhenContinuingMarshal := pfCallOnScriptErrorWhenContinuing is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pErrorDebug, pfEnterDebuggerMarshal, pfEnterDebugger, pfCallOnScriptErrorWhenContinuingMarshal, pfCallOnScriptErrorWhenContinuing, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptSiteDebug32.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDocumentContextFromPosition := CallbackCreate(GetMethod(implObj, "GetDocumentContextFromPosition"), flags, 5)
        this.vtbl.GetApplication := CallbackCreate(GetMethod(implObj, "GetApplication"), flags, 2)
        this.vtbl.GetRootApplicationNode := CallbackCreate(GetMethod(implObj, "GetRootApplicationNode"), flags, 2)
        this.vtbl.OnScriptErrorDebug := CallbackCreate(GetMethod(implObj, "OnScriptErrorDebug"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDocumentContextFromPosition)
        CallbackFree(this.vtbl.GetApplication)
        CallbackFree(this.vtbl.GetRootApplicationNode)
        CallbackFree(this.vtbl.OnScriptErrorDebug)
    }
}

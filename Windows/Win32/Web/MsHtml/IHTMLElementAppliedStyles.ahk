#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRulesAppliedCollection.ahk" { IRulesAppliedCollection }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElementAppliedStyles extends IDispatch {
    /**
     * The interface identifier for IHTMLElementAppliedStyles
     * @type {Guid}
     */
    static IID := Guid("{305104bd-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElementAppliedStyles interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        msGetRulesApplied             : IntPtr
        msGetRulesAppliedWithAncestor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElementAppliedStyles.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IRulesAppliedCollection} 
     */
    msGetRulesApplied() {
        result := ComCall(7, this, "ptr*", &ppRulesAppliedCollection := 0, "HRESULT")
        return IRulesAppliedCollection(ppRulesAppliedCollection)
    }

    /**
     * 
     * @param {VARIANT} varContext 
     * @returns {IRulesAppliedCollection} 
     */
    msGetRulesAppliedWithAncestor(varContext) {
        result := ComCall(8, this, VARIANT, varContext, "ptr*", &ppRulesAppliedCollection := 0, "HRESULT")
        return IRulesAppliedCollection(ppRulesAppliedCollection)
    }

    Query(iid) {
        if (IHTMLElementAppliedStyles.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.msGetRulesApplied := CallbackCreate(GetMethod(implObj, "msGetRulesApplied"), flags, 2)
        this.vtbl.msGetRulesAppliedWithAncestor := CallbackCreate(GetMethod(implObj, "msGetRulesAppliedWithAncestor"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.msGetRulesApplied)
        CallbackFree(this.vtbl.msGetRulesAppliedWithAncestor)
    }
}

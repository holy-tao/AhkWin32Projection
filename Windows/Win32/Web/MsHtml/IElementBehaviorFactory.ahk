#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IElementBehaviorSite.ahk" { IElementBehaviorSite }
#Import ".\IElementBehavior.ahk" { IElementBehavior }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehaviorFactory extends IUnknown {
    /**
     * The interface identifier for IElementBehaviorFactory
     * @type {Guid}
     */
    static IID := Guid("{3050f429-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehaviorFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindBehavior : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehaviorFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrBehavior 
     * @param {BSTR} bstrBehaviorUrl 
     * @param {IElementBehaviorSite} pSite 
     * @returns {IElementBehavior} 
     */
    FindBehavior(bstrBehavior, bstrBehaviorUrl, pSite) {
        bstrBehavior := bstrBehavior is String ? BSTR.Alloc(bstrBehavior).Value : bstrBehavior
        bstrBehaviorUrl := bstrBehaviorUrl is String ? BSTR.Alloc(bstrBehaviorUrl).Value : bstrBehaviorUrl

        result := ComCall(3, this, BSTR, bstrBehavior, BSTR, bstrBehaviorUrl, "ptr", pSite, "ptr*", &ppBehavior := 0, "HRESULT")
        return IElementBehavior(ppBehavior)
    }

    Query(iid) {
        if (IElementBehaviorFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindBehavior := CallbackCreate(GetMethod(implObj, "FindBehavior"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindBehavior)
    }
}

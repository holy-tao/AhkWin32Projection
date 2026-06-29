#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRawElementProviderWindowlessSite.ahk" { IRawElementProviderWindowlessSite }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the host container of a windowless rich edit control to obtain the Microsoft UI Automation provider for the parent of the control.
 * @see https://learn.microsoft.com/windows/win32/api/textserv/nn-textserv-iricheditwindowlessaccessibility
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRicheditWindowlessAccessibility extends IUnknown {
    /**
     * The interface identifier for IRicheditWindowlessAccessibility
     * @type {Guid}
     */
    static IID := Guid("{983e572d-20cd-460b-9104-83111592dd10}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRicheditWindowlessAccessibility interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRicheditWindowlessAccessibility.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Obtains a Microsoft UI Automation provider object for the parent of a windowless rich edit control.
     * @param {IRawElementProviderWindowlessSite} pSite Type: <b>IRawElementProviderWindowlessSite*</b>
     * 
     * The ActiveX control site that hosts the windowless rich edit control.
     * @returns {IRawElementProviderSimple} Type: <b>IRawElementProviderSimple**</b>
     * 
     * The UI Automation provider for the windowless rich edit control's parent.
     * @see https://learn.microsoft.com/windows/win32/api/textserv/nf-textserv-iricheditwindowlessaccessibility-createprovider
     */
    CreateProvider(pSite) {
        result := ComCall(3, this, "ptr", pSite, "ptr*", &ppProvider := 0, "HRESULT")
        return IRawElementProviderSimple(ppProvider)
    }

    Query(iid) {
        if (IRicheditWindowlessAccessibility.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateProvider := CallbackCreate(GetMethod(implObj, "CreateProvider"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateProvider)
    }
}

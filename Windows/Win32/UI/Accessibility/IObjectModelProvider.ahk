#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the underlying object model implemented by a control or application. (IObjectModelProvider)
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iobjectmodelprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IObjectModelProvider extends IUnknown {
    /**
     * The interface identifier for IObjectModelProvider
     * @type {Guid}
     */
    static IID := Guid("{3ad86ebd-f5ef-483d-bb18-b1042a475d64}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectModelProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUnderlyingObjectModel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectModelProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an interface used to access the underlying object model of the provider. (IObjectModelProvider.GetUnderlyingObjectModel)
     * @remarks
     * Client applications can use the object model to directly access the content of the control or application.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives an interface for accessing the underlying object model.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iobjectmodelprovider-getunderlyingobjectmodel
     */
    GetUnderlyingObjectModel() {
        result := ComCall(3, this, "ptr*", &ppUnknown := 0, "HRESULT")
        return IUnknown(ppUnknown)
    }

    Query(iid) {
        if (IObjectModelProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUnderlyingObjectModel := CallbackCreate(GetMethod(implObj, "GetUnderlyingObjectModel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUnderlyingObjectModel)
    }
}

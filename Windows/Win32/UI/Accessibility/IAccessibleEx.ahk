#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IAccessible.ahk" { IAccessible }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes methods that are called by Microsoft UI Automation to retrieve extra information about a control that supports Microsoft Active Accessibility.
 * @remarks
 * This interface can be implemented on custom controls that also implement the [IAccessible](/windows/desktop/api/oleacc/nn-oleacc-iaccessible) interface, to provide added support for UI Automation without the cost of a full UI Automation provider implementation.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iaccessibleex
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IAccessibleEx extends IUnknown {
    /**
     * The interface identifier for IAccessibleEx
     * @type {Guid}
     */
    static IID := Guid("{f8b80ada-2c44-48d0-89be-5ff23c9cd875}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccessibleEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetObjectForChild      : IntPtr
        GetIAccessiblePair     : IntPtr
        GetRuntimeId           : IntPtr
        ConvertReturnedElement : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccessibleEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an IAccessibleEx interface representing the specified child of this element.
     * @remarks
     * <i>pRetVal</i> returns <b>NULL</b> if this implementation does not use child IDs, or cannot provide an <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> interface for the specified child, or itself represents a child element.
     * 
     * <i>idChild</i> must represent an actual MSAA child element, not an object that has its own <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
     * @param {Integer} idChild Type: <b>long</b>
     * 
     * The identifier of the child element.
     * @returns {IAccessibleEx} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-getobjectforchild
     */
    GetObjectForChild(idChild) {
        result := ComCall(3, this, "int", idChild, "ptr*", &pRetVal := 0, "HRESULT")
        return IAccessibleEx(pRetVal)
    }

    /**
     * Retrieves the IAccessible interface and child ID for this item.
     * @param {Pointer<IAccessible>} ppAcc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface for this object, or the parent object if this is a child element.
     * @param {Pointer<Integer>} pidChild Type: <b>long*</b>
     * 
     * Receives the child ID, or CHILDID_SELF if this is not a child element.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-getiaccessiblepair
     */
    GetIAccessiblePair(ppAcc, pidChild) {
        pidChildMarshal := pidChild is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, IAccessible.Ptr, ppAcc, pidChildMarshal, pidChild, "HRESULT")
        return result
    }

    /**
     * Retrieves the runtime identifier of this element.
     * @remarks
     * The runtime identifier is a provider-defined array of integers, the first item of which must be <b>UiaAppendRuntimeId</b>. The runtime identifier must be unique within the parent window.
     * 
     * The MSAA-to-UIA Proxy uses the runtime identifier (together with the window handle) to determine if two interface instances refer to the same underlying element. If <b>IAccessibleEx::GetRuntimeId</b> is not implemented, the proxy performs field-by-field comparisons on the two <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> objects to determine if they are equivalent, which is less efficient.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the runtime identifier.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-getruntimeid
     */
    GetRuntimeId() {
        result := ComCall(5, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the IAccessibleEx interface of an element returned as a property value.
     * @remarks
     * This method is implemented by the bridge between Microsoft UI Automation and Microsoft Active Accessibility. Most other implementations should return E_NOTIMPL after setting <i>ppRetValOut</i> to <b>NULL</b>.
     * @param {IRawElementProviderSimple} pIn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interface that was retrieved as a property.
     * @returns {IAccessibleEx} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iaccessibleex">IAccessibleEx</a>  interface of the element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iaccessibleex-convertreturnedelement
     */
    ConvertReturnedElement(pIn) {
        result := ComCall(6, this, "ptr", pIn, "ptr*", &ppRetValOut := 0, "HRESULT")
        return IAccessibleEx(ppRetValOut)
    }

    Query(iid) {
        if (IAccessibleEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObjectForChild := CallbackCreate(GetMethod(implObj, "GetObjectForChild"), flags, 3)
        this.vtbl.GetIAccessiblePair := CallbackCreate(GetMethod(implObj, "GetIAccessiblePair"), flags, 3)
        this.vtbl.GetRuntimeId := CallbackCreate(GetMethod(implObj, "GetRuntimeId"), flags, 2)
        this.vtbl.ConvertReturnedElement := CallbackCreate(GetMethod(implObj, "ConvertReturnedElement"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObjectForChild)
        CallbackFree(this.vtbl.GetIAccessiblePair)
        CallbackFree(this.vtbl.GetRuntimeId)
        CallbackFree(this.vtbl.ConvertReturnedElement)
    }
}

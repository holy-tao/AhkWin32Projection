#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes properties and methods of an object that creates a Microsoft UI Automation provider for UI elements that do not have native support for UI Automation. This interface is implemented by proxies.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactory
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationProxyFactory extends IUnknown {
    /**
     * The interface identifier for IUIAutomationProxyFactory
     * @type {Guid}
     */
    static IID := Guid("{85b94ecd-849d-42b6-b94d-d6db23fdf5a4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationProxyFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateProvider     : IntPtr
        get_ProxyFactoryId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationProxyFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ProxyFactoryId {
        get => this.get_ProxyFactoryId()
    }

    /**
     * Creates a proxy object that provides Microsoft UI Automation support for a UI element.
     * @remarks
     * The <i>idObject</i> parameter is normally <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">OBJID_CLIENT</a>, and <i>idChild</i> is normally CHILDID_SELF. However, when the method is called in response to a registered WinEvent, these values are from the event, specifying the subelement that raised the event.
     * @param {HWND} _hwnd Type: <b>UIA_HWND</b>
     * 
     * The window handle of the UI element.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The object ID. See Remarks.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The child ID. See Remarks.
     * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * Receives a pointer to the proxy object.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactory-createprovider
     */
    CreateProvider(_hwnd, idObject, idChild) {
        result := ComCall(3, this, HWND, _hwnd, "int", idObject, "int", idChild, "ptr*", &provider := 0, "HRESULT")
        return IRawElementProviderSimple(provider)
    }

    /**
     * Retrieves the identifier of the proxy factory.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactory-get_proxyfactoryid
     */
    get_ProxyFactoryId() {
        factoryId := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, factoryId, "HRESULT")
        return factoryId
    }

    Query(iid) {
        if (IUIAutomationProxyFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateProvider := CallbackCreate(GetMethod(implObj, "CreateProvider"), flags, 5)
        this.vtbl.get_ProxyFactoryId := CallbackCreate(GetMethod(implObj, "get_ProxyFactoryId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateProvider)
        CallbackFree(this.vtbl.get_ProxyFactoryId)
    }
}

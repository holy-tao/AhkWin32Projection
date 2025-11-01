#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes properties and methods of an object that creates a Microsoft UI Automation provider for UI elements that do not have native support for UI Automation. This interface is implemented by proxies.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactory
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationProxyFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationProxyFactory
     * @type {Guid}
     */
    static IID => Guid("{85b94ecd-849d-42b6-b94d-d6db23fdf5a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProvider", "get_ProxyFactoryId"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<IRawElementProviderSimple>} provider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactory-createprovider
     */
    CreateProvider(hwnd, idObject, idChild, provider) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "int", idObject, "int", idChild, "ptr*", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} factoryId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationproxyfactory-get_proxyfactoryid
     */
    get_ProxyFactoryId(factoryId) {
        result := ComCall(4, this, "ptr", factoryId, "HRESULT")
        return result
    }
}

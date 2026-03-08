#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enables repositioning of window-based elements within the fragment's UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementproviderhwndoverride
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderHwndOverride extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderHwndOverride
     * @type {Guid}
     */
    static IID => Guid("{1d5df27c-8947-4425-b8d9-79787bb460b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOverrideProviderForHwnd"]

    /**
     * Gets a UI Automation provider for the specified element.
     * @remarks
     * This method is implemented by fragment roots that contain window-based child elements. 
     * 			By default, controls hosted in windows are served by default providers in addition to any custom providers. 
     * 			The default providers treat all windows within a parent window as siblings. If you want to restructure the UI Automation 
     * 			tree so that one window-based control is seen as a child of another, you must override the default provider by implementing 
     * 			this method on the fragment root. The returned provider can supply additional properties or override properties of the 
     * 			specified component.
     * 
     * The returned provider must be part of the fragment tree. It can supply additional properties or 
     * 			override properties of the specified component.
     * 
     * If the returned provider implements <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>, 
     * 			the provider should be part of the fragment's tree and be reachable by navigating from the fragment's root.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The window handle of the element.
     * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * Receives a pointer to the new provider for the specified window, or <b>NULL</b> if the provider is not being overridden. 
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderhwndoverride-getoverrideproviderforhwnd
     */
    GetOverrideProviderForHwnd(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }
}

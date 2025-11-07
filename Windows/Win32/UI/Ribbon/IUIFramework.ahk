#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIFramework interface is implemented by the Windows Ribbon framework and defines the methods that provide the core functionality for the framework.
 * @remarks
 * 
  * This interface is used to initialize and dismantle the Ribbon framework.
  * 
  * Ribbon framework UI functionality is differentiated by Views, which are essentially 
  * 				built-in core controls, such as the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-ribbon">Ribbon</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextpopup">ContextPopup</a>.
  * 
  * To get an interface pointer to the implementation of IUIFramework, use <a href="https://docs.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>to 
  * 			create a COM object with the class identifier (CLSID) of CLSID_UIRibbonFramework.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuiframework
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIFramework extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIFramework
     * @type {Guid}
     */
    static IID => Guid("{f4f0385d-6872-43a8-ad09-4c339cb3f5c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Destroy", "LoadUI", "GetView", "GetUICommandProperty", "SetUICommandProperty", "InvalidateUICommand", "FlushPendingInvalidations", "SetModes"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {HWND} frameWnd 
     * @param {IUIApplication} application 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(frameWnd, application) {
        frameWnd := frameWnd is Win32Handle ? NumGet(frameWnd, "ptr") : frameWnd

        result := ComCall(3, this, "ptr", frameWnd, "ptr", application, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-destroy
     */
    Destroy() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HINSTANCE} instance 
     * @param {PWSTR} resourceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-loadui
     */
    LoadUI(instance, resourceName) {
        instance := instance is Win32Handle ? NumGet(instance, "ptr") : instance
        resourceName := resourceName is String ? StrPtr(resourceName) : resourceName

        result := ComCall(5, this, "ptr", instance, "ptr", resourceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} viewId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-getview
     */
    GetView(viewId, riid) {
        result := ComCall(6, this, "uint", viewId, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} commandId 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-getuicommandproperty
     */
    GetUICommandProperty(commandId, key) {
        value := PROPVARIANT()
        result := ComCall(7, this, "uint", commandId, "ptr", key, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {Integer} commandId 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-setuicommandproperty
     */
    SetUICommandProperty(commandId, key, value) {
        result := ComCall(8, this, "uint", commandId, "ptr", key, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commandId 
     * @param {Integer} flags 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-invalidateuicommand
     */
    InvalidateUICommand(commandId, flags, key) {
        result := ComCall(9, this, "uint", commandId, "int", flags, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-flushpendinginvalidations
     */
    FlushPendingInvalidations() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iModes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiframework-setmodes
     */
    SetModes(iModes) {
        result := ComCall(11, this, "int", iModes, "HRESULT")
        return result
    }
}

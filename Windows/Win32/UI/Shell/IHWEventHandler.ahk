#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by AutoPlay to implement the handling of registered media types.
 * @remarks
 * 
 * Developers supporting this interface must expose it in a Component Object Model (COM) server.
 * 
 * All applications registered as AutoPlay media handlers must implement this interface. Handlers that implement this interface should return quickly from calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler-handleevent">IHWEventHandler::HandleEvent</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler2-handleeventwithhwnd">IHWEventHandler2::HandleEventWithHWND</a> so they won't block the AutoPlay dialog from closing. Additionally, if a local server must be launched for the creation of this handler, it should not block the CreateInstance call; it should return as soon as possible.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ihweventhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHWEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHWEventHandler
     * @type {Guid}
     */
    static IID => Guid("{c1fb73d0-ec3a-4ba2-b512-8cdb9187b6d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "HandleEvent", "HandleEventWithContent"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszParams 
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
    Initialize(pszParams) {
        pszParams := pszParams is String ? StrPtr(pszParams) : pszParams

        result := ComCall(3, this, "ptr", pszParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDeviceID 
     * @param {PWSTR} pszAltDeviceID 
     * @param {PWSTR} pszEventType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ihweventhandler-handleevent
     */
    HandleEvent(pszDeviceID, pszAltDeviceID, pszEventType) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID
        pszAltDeviceID := pszAltDeviceID is String ? StrPtr(pszAltDeviceID) : pszAltDeviceID
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(4, this, "ptr", pszDeviceID, "ptr", pszAltDeviceID, "ptr", pszEventType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDeviceID 
     * @param {PWSTR} pszAltDeviceID 
     * @param {PWSTR} pszEventType 
     * @param {PWSTR} pszContentTypeHandler 
     * @param {IDataObject} pdataobject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ihweventhandler-handleeventwithcontent
     */
    HandleEventWithContent(pszDeviceID, pszAltDeviceID, pszEventType, pszContentTypeHandler, pdataobject) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID
        pszAltDeviceID := pszAltDeviceID is String ? StrPtr(pszAltDeviceID) : pszAltDeviceID
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType
        pszContentTypeHandler := pszContentTypeHandler is String ? StrPtr(pszContentTypeHandler) : pszContentTypeHandler

        result := ComCall(5, this, "ptr", pszDeviceID, "ptr", pszAltDeviceID, "ptr", pszEventType, "ptr", pszContentTypeHandler, "ptr", pdataobject, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by AutoPlay to implement the handling of registered media types.
 * @remarks
 * Developers supporting this interface must expose it in a Component Object Model (COM) server.
 * 
 * All applications registered as AutoPlay media handlers must implement this interface. Handlers that implement this interface should return quickly from calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler-handleevent">IHWEventHandler::HandleEvent</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler2-handleeventwithhwnd">IHWEventHandler2::HandleEventWithHWND</a> so they won't block the AutoPlay dialog from closing. Additionally, if a local server must be launched for the creation of this handler, it should not block the CreateInstance call; it should return as soon as possible.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nn-shobjidl-ihweventhandler
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
     * Initializes an object that contains an implementation of the IHWEventHandler interface.
     * @remarks
     * This method receives the registry string stored in the InitCmdLine value under the
     *         
     * <b>AutoPlayHandlers</b>&#92;<b>Handlers</b>&#92;<i>HandlerName</i> key. Applications that have registered with AutoPlay as event handlers place this string into the registry as part of the registration process.
     * @param {PWSTR} pszParams Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string buffer that contains the string from the following registry value.
     *           
     * 
     * 
     * <pre><b>HKEY_LOCAL_MACHINE</b>
     *    <b>Software</b>
     *       <b>Microsoft</b>
     *          <b>Windows</b>
     *             <b>CurrentVersion</b>
     *                <b>Explorer</b>
     *                   <b>AutoPlayHandlers</b>
     *                      <b>Handlers</b>
     *                         <i>HandlerName</i>
     *                            <b>InitCmdLine</b> = string</pre>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-ihweventhandler-initialize
     */
    Initialize(pszParams) {
        pszParams := pszParams is String ? StrPtr(pszParams) : pszParams

        result := ComCall(3, this, "ptr", pszParams, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Handles AutoPlay device events for which there is no content of the type the application is registered to handle.
     * @remarks
     * The event types are not C/C++ language constants; they are literal text strings.
     * @param {PWSTR} pszDeviceID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string buffer that contains the device ID.
     * @param {PWSTR} pszAltDeviceID Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string buffer that contains the alternate device ID. The alternate device ID is more human-readable than the primary device ID.
     * @param {PWSTR} pszEventType Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string buffer that contains the event type. The event types include DeviceArrival, DeviceRemoval, MediaArrival, and MediaRemoval.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-ihweventhandler-handleevent
     */
    HandleEvent(pszDeviceID, pszAltDeviceID, pszEventType) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID
        pszAltDeviceID := pszAltDeviceID is String ? StrPtr(pszAltDeviceID) : pszAltDeviceID
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(4, this, "ptr", pszDeviceID, "ptr", pszAltDeviceID, "ptr", pszEventType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Not implemented. (IHWEventHandler.HandleEventWithContent)
     * @param {PWSTR} pszDeviceID This parameter is unused.
     * @param {PWSTR} pszAltDeviceID This parameter is unused.
     * @param {PWSTR} pszEventType This parameter is unused.
     * @param {PWSTR} pszContentTypeHandler This parameter is unused.
     * @param {IDataObject} pdataobject This parameter is unused.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-ihweventhandler-handleeventwithcontent
     */
    HandleEventWithContent(pszDeviceID, pszAltDeviceID, pszEventType, pszContentTypeHandler, pdataobject) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID
        pszAltDeviceID := pszAltDeviceID is String ? StrPtr(pszAltDeviceID) : pszAltDeviceID
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType
        pszContentTypeHandler := pszContentTypeHandler is String ? StrPtr(pszContentTypeHandler) : pszContentTypeHandler

        result := ComCall(5, this, "ptr", pszDeviceID, "ptr", pszAltDeviceID, "ptr", pszEventType, "ptr", pszContentTypeHandler, "ptr", pdataobject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

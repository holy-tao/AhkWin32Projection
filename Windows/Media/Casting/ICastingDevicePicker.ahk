#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CastingDevicePickerFilter.ahk
#Include ..\..\Devices\Enumeration\DevicePickerAppearance.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class ICastingDevicePicker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingDevicePicker
     * @type {Guid}
     */
    static IID => Guid("{dcd39924-0591-49be-aacb-4b82ee756a95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Filter", "get_Appearance", "add_CastingDeviceSelected", "remove_CastingDeviceSelected", "add_CastingDevicePickerDismissed", "remove_CastingDevicePickerDismissed", "Show", "ShowWithPlacement", "Hide"]

    /**
     * @type {CastingDevicePickerFilter} 
     */
    Filter {
        get => this.get_Filter()
    }

    /**
     * @type {DevicePickerAppearance} 
     */
    Appearance {
        get => this.get_Appearance()
    }

    /**
     * 
     * @returns {CastingDevicePickerFilter} 
     */
    get_Filter() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CastingDevicePickerFilter(value)
    }

    /**
     * 
     * @returns {DevicePickerAppearance} 
     */
    get_Appearance() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DevicePickerAppearance(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CastingDevicePicker, CastingDeviceSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CastingDeviceSelected(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CastingDeviceSelected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CastingDevicePicker, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CastingDevicePickerDismissed(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CastingDevicePickerDismissed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Makes the caret visible on the screen at the caret's current position. When the caret becomes visible, it begins flashing automatically.
     * @remarks
     * <b>ShowCaret</b> shows the caret only if the specified window owns the caret, the caret has a shape, and the caret has not been hidden two or more times in a row. If one or more of these conditions is not met, <b>ShowCaret</b> does nothing and returns <b>FALSE</b>. 
     * 
     * Hiding is cumulative. If your application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-hidecaret">HideCaret</a> five times in a row, it must also call <b>ShowCaret</b> five times before the caret reappears. 
     * 
     * The system provides one caret per queue. A window should create a caret only when it has the keyboard focus or is active. The window should destroy the caret before losing the keyboard focus or becoming inactive.
     * @param {RECT} selection 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-showcaret
     */
    Show(selection) {
        result := ComCall(12, this, "ptr", selection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Makes the caret visible on the screen at the caret's current position. When the caret becomes visible, it begins flashing automatically.
     * @remarks
     * <b>ShowCaret</b> shows the caret only if the specified window owns the caret, the caret has a shape, and the caret has not been hidden two or more times in a row. If one or more of these conditions is not met, <b>ShowCaret</b> does nothing and returns <b>FALSE</b>. 
     * 
     * Hiding is cumulative. If your application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-hidecaret">HideCaret</a> five times in a row, it must also call <b>ShowCaret</b> five times before the caret reappears. 
     * 
     * The system provides one caret per queue. A window should create a caret only when it has the keyboard focus or is active. The window should destroy the caret before losing the keyboard focus or becoming inactive.
     * @param {RECT} selection 
     * @param {Integer} preferredPlacement 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-showcaret
     */
    ShowWithPlacement(selection, preferredPlacement) {
        result := ComCall(13, this, "ptr", selection, "int", preferredPlacement, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This article provides a detailed overview of the hide meeting update option property with additional remarks.
     * @remarks
     * To provide any of the store functionality, the store provider must implement [IMAPIProp : IUnknown](imapipropiunknown.md) and return a valid property tag for any of these properties passed to an [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md) call. When the property tag for any of these properties is passed to [IMAPIProp::GetProps](imapiprop-getprops.md), the store provider must also return the correct property value. Store providers can call [HrGetOneProp](hrgetoneprop.md) and [HrSetOneProp](hrsetoneprop.md) to get or set these properties. 
     *   
     * To retrieve the value of this property, the client should first use [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md) to obtain the property tag, and then specify this property tag in [IMAPIProp::GetProps](imapiprop-getprops.md) to get the value. When calling [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md), specify the following values for the [MAPINAMEID](mapinameid.md) structure pointed at by the input parameter  _lppPropNames_:
     *   
     * |Property |Value |
     * |:-----|:-----|
     * |lpGuid:  <br/> |PS_PUBLIC_STRINGS  <br/> |
     * |ulKind:  <br/> |MNID_STRING  <br/> |
     * |Kind.lpwstrName:  <br/> |L"urn:schemas-microsoft-com:office:outlook#allornonemtgupdatedlg"  <br/> |
     *    
     * A store provider that uses a server to send meeting updates can modify the **Send Update to Attendees** dialog box. This functionality is useful because when the server sends a meeting update, the server does not know which attendees have been added or deleted by the user since the initial meeting request. When this property is **true**, the **Send update only to added or deleted attendees** option is not displayed in the **Send Update to Attendees** dialog box. 
     *   
     * This property is ignored if the version of Outlook is earlier than Microsoft Office Outlook 2003 Service Pack 1, or if its value is **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/hide-meeting-update-option-property
     */
    Hide() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DevicePickerFilter.ahk
#Include .\DevicePickerAppearance.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDevicePicker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePicker
     * @type {Guid}
     */
    static IID => Guid("{84997aa2-034a-4440-8813-7d0bd479bf5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Filter", "get_Appearance", "get_RequestedProperties", "add_DeviceSelected", "remove_DeviceSelected", "add_DisconnectButtonClicked", "remove_DisconnectButtonClicked", "add_DevicePickerDismissed", "remove_DevicePickerDismissed", "Show", "ShowWithPlacement", "PickSingleDeviceAsync", "PickSingleDeviceAsyncWithPlacement", "Hide", "SetDisplayStatus"]

    /**
     * @type {DevicePickerFilter} 
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
     * @type {IVector<HSTRING>} 
     */
    RequestedProperties {
        get => this.get_RequestedProperties()
    }

    /**
     * 
     * @returns {DevicePickerFilter} 
     */
    get_Filter() {
        result := ComCall(6, this, "ptr*", &filter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DevicePickerFilter(filter)
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
     * @returns {IVector<HSTRING>} 
     */
    get_RequestedProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePicker, DeviceSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceSelected(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_DeviceSelected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePicker, DeviceDisconnectButtonClickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DisconnectButtonClicked(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_DisconnectButtonClicked(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DevicePicker, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DevicePickerDismissed(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_DevicePickerDismissed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
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
        result := ComCall(15, this, "ptr", selection, "int")
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
     * @param {Integer} placement_ 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-showcaret
     */
    ShowWithPlacement(selection, placement_) {
        result := ComCall(16, this, "ptr", selection, "int", placement_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RECT} selection 
     * @returns {IAsyncOperation<DeviceInformation>} 
     */
    PickSingleDeviceAsync(selection) {
        result := ComCall(17, this, "ptr", selection, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformation, operation)
    }

    /**
     * 
     * @param {RECT} selection 
     * @param {Integer} placement_ 
     * @returns {IAsyncOperation<DeviceInformation>} 
     */
    PickSingleDeviceAsyncWithPlacement(selection, placement_) {
        result := ComCall(18, this, "ptr", selection, "int", placement_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformation, operation)
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
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DeviceInformation} device 
     * @param {HSTRING} status_ 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetDisplayStatus(device, status_, options) {
        if(status_ is String) {
            pin := HSTRING.Create(status_)
            status_ := pin.Value
        }
        status_ := status_ is Win32Handle ? NumGet(status_, "ptr") : status_

        result := ComCall(20, this, "ptr", device, "ptr", status_, "uint", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

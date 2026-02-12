#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DataTemplate.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Input\ICommand.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentDialog extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentDialog
     * @type {Guid}
     */
    static IID => Guid("{38dc4404-d24e-40d8-9415-349464c1afdc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "put_Title", "get_TitleTemplate", "put_TitleTemplate", "get_FullSizeDesired", "put_FullSizeDesired", "get_PrimaryButtonText", "put_PrimaryButtonText", "get_SecondaryButtonText", "put_SecondaryButtonText", "get_PrimaryButtonCommand", "put_PrimaryButtonCommand", "get_SecondaryButtonCommand", "put_SecondaryButtonCommand", "get_PrimaryButtonCommandParameter", "put_PrimaryButtonCommandParameter", "get_SecondaryButtonCommandParameter", "put_SecondaryButtonCommandParameter", "get_IsPrimaryButtonEnabled", "put_IsPrimaryButtonEnabled", "get_IsSecondaryButtonEnabled", "put_IsSecondaryButtonEnabled", "add_Closing", "remove_Closing", "add_Closed", "remove_Closed", "add_Opened", "remove_Opened", "add_PrimaryButtonClick", "remove_PrimaryButtonClick", "add_SecondaryButtonClick", "remove_SecondaryButtonClick", "Hide", "ShowAsync"]

    /**
     * @type {IInspectable} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {DataTemplate} 
     */
    TitleTemplate {
        get => this.get_TitleTemplate()
        set => this.put_TitleTemplate(value)
    }

    /**
     * @type {Boolean} 
     */
    FullSizeDesired {
        get => this.get_FullSizeDesired()
        set => this.put_FullSizeDesired(value)
    }

    /**
     * @type {HSTRING} 
     */
    PrimaryButtonText {
        get => this.get_PrimaryButtonText()
        set => this.put_PrimaryButtonText(value)
    }

    /**
     * @type {HSTRING} 
     */
    SecondaryButtonText {
        get => this.get_SecondaryButtonText()
        set => this.put_SecondaryButtonText(value)
    }

    /**
     * @type {ICommand} 
     */
    PrimaryButtonCommand {
        get => this.get_PrimaryButtonCommand()
        set => this.put_PrimaryButtonCommand(value)
    }

    /**
     * @type {ICommand} 
     */
    SecondaryButtonCommand {
        get => this.get_SecondaryButtonCommand()
        set => this.put_SecondaryButtonCommand(value)
    }

    /**
     * @type {IInspectable} 
     */
    PrimaryButtonCommandParameter {
        get => this.get_PrimaryButtonCommandParameter()
        set => this.put_PrimaryButtonCommandParameter(value)
    }

    /**
     * @type {IInspectable} 
     */
    SecondaryButtonCommandParameter {
        get => this.get_SecondaryButtonCommandParameter()
        set => this.put_SecondaryButtonCommandParameter(value)
    }

    /**
     * @type {Boolean} 
     */
    IsPrimaryButtonEnabled {
        get => this.get_IsPrimaryButtonEnabled()
        set => this.put_IsPrimaryButtonEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsSecondaryButtonEnabled {
        get => this.get_IsSecondaryButtonEnabled()
        set => this.put_IsSecondaryButtonEnabled(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Title() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_TitleTemplate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTemplate(value)
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_TitleTemplate(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FullSizeDesired() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_FullSizeDesired(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrimaryButtonText() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecondaryButtonText() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_PrimaryButtonCommand() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICommand(value)
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonCommand(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_SecondaryButtonCommand() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICommand(value)
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonCommand(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_PrimaryButtonCommandParameter() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonCommandParameter(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SecondaryButtonCommandParameter() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonCommandParameter(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrimaryButtonEnabled() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPrimaryButtonEnabled(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSecondaryButtonEnabled() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSecondaryButtonEnabled(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        token := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", token, "int")
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
    remove_Closing(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(29, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        token := EventRegistrationToken()
        result := ComCall(30, this, "ptr", handler, "ptr", token, "int")
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
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(31, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        token := EventRegistrationToken()
        result := ComCall(32, this, "ptr", handler, "ptr", token, "int")
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
    remove_Opened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(33, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrimaryButtonClick(handler) {
        token := EventRegistrationToken()
        result := ComCall(34, this, "ptr", handler, "ptr", token, "int")
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
    remove_PrimaryButtonClick(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(35, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SecondaryButtonClick(handler) {
        token := EventRegistrationToken()
        result := ComCall(36, this, "ptr", handler, "ptr", token, "int")
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
    remove_SecondaryButtonClick(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(37, this, "ptr", token, "int")
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
        result := ComCall(38, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    ShowAsync() {
        result := ComCall(39, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}

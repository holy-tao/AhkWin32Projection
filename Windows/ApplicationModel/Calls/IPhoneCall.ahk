#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneCallInfo.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCall extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCall
     * @type {Guid}
     */
    static IID => Guid("{c14ed0f8-c17d-59d2-9628-66e545b6cd21}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_StatusChanged", "remove_StatusChanged", "add_AudioDeviceChanged", "remove_AudioDeviceChanged", "add_IsMutedChanged", "remove_IsMutedChanged", "get_CallId", "get_IsMuted", "get_Status", "get_AudioDevice", "GetPhoneCallInfo", "GetPhoneCallInfoAsync", "End", "EndAsync", "SendDtmfKey", "SendDtmfKeyAsync", "AcceptIncoming", "AcceptIncomingAsync", "Hold", "HoldAsync", "ResumeFromHold", "ResumeFromHoldAsync", "Mute", "MuteAsync", "Unmute", "UnmuteAsync", "RejectIncoming", "RejectIncomingAsync", "ChangeAudioDevice", "ChangeAudioDeviceAsync"]

    /**
     * @type {HSTRING} 
     */
    CallId {
        get => this.get_CallId()
    }

    /**
     * @type {Boolean} 
     */
    IsMuted {
        get => this.get_IsMuted()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    AudioDevice {
        get => this.get_AudioDevice()
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneCall, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_StatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneCall, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioDeviceChanged(handler) {
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
    remove_AudioDeviceChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneCall, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsMutedChanged(handler) {
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
    remove_IsMutedChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMuted() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioDevice() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhoneCallInfo} 
     */
    GetPhoneCallInfo() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCallInfo(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<PhoneCallInfo>} 
     */
    GetPhoneCallInfoAsync() {
        result := ComCall(17, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneCallInfo, operation)
    }

    /**
     * Indicates whether a line has an arrowhead or other line end format at its last vertex.
     * @remarks
     * You can also set this value in the **Line** dialog box (on the **Home** tab, in the **Shape** group, click **Line**, point to **Arrows**, and then click **More Arrows**). The size of the arrowhead is set in the EndArrowSize cell.
     *   
     * You can specify a custom line end using the USE function in this cell. 
     *   
     * To get a reference to the EndArrow cell by name from another formula, or from a program using the **CellsU** property, use: 
     *   
     * ||Value |
     * |:-----|:-----|
     * |**Cell name:**  <br/> |EndArrow  <br/> |
     *    
     * To get a reference to the EndArrow cell by index from a program, use the **CellsSRC** property with the following arguments: 
     *   
     * ||Value |
     * |:-----|:-----|
     * |**Section index:**  <br/> |**visSectionObject** <br/> |
     * |**Row index:**  <br/> |**visRowLine** <br/> |
     * |**Cell index:**  <br/> |**visLineEndArrow** <br/> |
     * @returns {Integer} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/endarrow-cell-line-format-section
     */
    End() {
        result := ComCall(18, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    EndAsync() {
        result := ComCall(19, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Integer} key 
     * @param {Integer} dtmfToneAudioPlayback_ 
     * @returns {Integer} 
     */
    SendDtmfKey(key, dtmfToneAudioPlayback_) {
        result := ComCall(20, this, "int", key, "int", dtmfToneAudioPlayback_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} key 
     * @param {Integer} dtmfToneAudioPlayback_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    SendDtmfKeyAsync(key, dtmfToneAudioPlayback_) {
        result := ComCall(21, this, "int", key, "int", dtmfToneAudioPlayback_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    AcceptIncoming() {
        result := ComCall(22, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    AcceptIncomingAsync() {
        result := ComCall(23, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * The IADsHold interface provides methods for an ADSI client to access the Hold attribute.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadshold
     */
    Hold() {
        result := ComCall(24, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    HoldAsync() {
        result := ComCall(25, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    ResumeFromHold() {
        result := ComCall(26, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    ResumeFromHoldAsync() {
        result := ComCall(27, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * The Mute property turns the audio stream output on or off.
     * @remarks
     * This property is read/write with a default value of false.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/mute-property
     */
    Mute() {
        result := ComCall(28, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    MuteAsync() {
        result := ComCall(29, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    Unmute() {
        result := ComCall(30, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    UnmuteAsync() {
        result := ComCall(31, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    RejectIncoming() {
        result := ComCall(32, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RejectIncomingAsync() {
        result := ComCall(33, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @returns {Integer} 
     */
    ChangeAudioDevice(endpoint) {
        result := ComCall(34, this, "int", endpoint, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} endpoint 
     * @returns {IAsyncOperation<Integer>} 
     */
    ChangeAudioDeviceAsync(endpoint) {
        result := ComCall(35, this, "int", endpoint, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}

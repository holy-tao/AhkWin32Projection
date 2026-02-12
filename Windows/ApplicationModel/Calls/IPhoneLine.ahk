#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneVoicemail.ahk
#Include .\PhoneLineCellularDetails.ahk
#Include .\PhoneCallVideoCapabilities.ahk
#Include .\PhoneLineConfiguration.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLine extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLine
     * @type {Guid}
     */
    static IID => Guid("{27c66f30-6a69-34ca-a2ba-65302530c311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_LineChanged", "remove_LineChanged", "get_Id", "get_DisplayColor", "get_NetworkState", "get_DisplayName", "get_Voicemail", "get_NetworkName", "get_CellularDetails", "get_Transport", "get_CanDial", "get_SupportsTile", "get_VideoCallingCapabilities", "get_LineConfiguration", "IsImmediateDialNumberAsync", "Dial", "DialWithOptions"]

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Color} 
     */
    DisplayColor {
        get => this.get_DisplayColor()
    }

    /**
     * @type {Integer} 
     */
    NetworkState {
        get => this.get_NetworkState()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {PhoneVoicemail} 
     */
    Voicemail {
        get => this.get_Voicemail()
    }

    /**
     * @type {HSTRING} 
     */
    NetworkName {
        get => this.get_NetworkName()
    }

    /**
     * @type {PhoneLineCellularDetails} 
     */
    CellularDetails {
        get => this.get_CellularDetails()
    }

    /**
     * @type {Integer} 
     */
    Transport {
        get => this.get_Transport()
    }

    /**
     * @type {Boolean} 
     */
    CanDial {
        get => this.get_CanDial()
    }

    /**
     * @type {Boolean} 
     */
    SupportsTile {
        get => this.get_SupportsTile()
    }

    /**
     * @type {PhoneCallVideoCapabilities} 
     */
    VideoCallingCapabilities {
        get => this.get_VideoCallingCapabilities()
    }

    /**
     * @type {PhoneLineConfiguration} 
     */
    LineConfiguration {
        get => this.get_LineConfiguration()
    }

    /**
     * 
     * @param {TypedEventHandler<PhoneLine, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LineChanged(handler) {
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
    remove_LineChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DisplayColor() {
        value := Color()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkState() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhoneVoicemail} 
     */
    get_Voicemail() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneVoicemail(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkName() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhoneLineCellularDetails} 
     */
    get_CellularDetails() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneLineCellularDetails(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Transport() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDial() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsTile() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhoneCallVideoCapabilities} 
     */
    get_VideoCallingCapabilities() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCallVideoCapabilities(value)
    }

    /**
     * 
     * @returns {PhoneLineConfiguration} 
     */
    get_LineConfiguration() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneLineConfiguration(value)
    }

    /**
     * 
     * @param {HSTRING} number_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsImmediateDialNumberAsync(number_) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_

        result := ComCall(20, this, "ptr", number_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * Gets the current status of the application on the remote device.
     * @param {HSTRING} number_ 
     * @param {HSTRING} displayName 
     * @returns {HRESULT} The app status, a value from [DialAppStateDetails](dialappstatedetails.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialapp.getappstateasync
     */
    Dial(number_, displayName) {
        if(number_ is String) {
            pin := HSTRING.Create(number_)
            number_ := pin.Value
        }
        number_ := number_ is Win32Handle ? NumGet(number_, "ptr") : number_
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(21, this, "ptr", number_, "ptr", displayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PhoneDialOptions} options 
     * @returns {HRESULT} 
     */
    DialWithOptions(options) {
        result := ComCall(22, this, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

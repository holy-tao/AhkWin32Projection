#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SetDefaultSpatialAudioFormatResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class ISpatialAudioDeviceConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAudioDeviceConfiguration
     * @type {Guid}
     */
    static IID => Guid("{ee830034-61cf-5749-9da4-10f0fe028199}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_IsSpatialAudioSupported", "IsSpatialAudioFormatSupported", "get_ActiveSpatialAudioFormat", "get_DefaultSpatialAudioFormat", "SetDefaultSpatialAudioFormatAsync", "add_ConfigurationChanged", "remove_ConfigurationChanged"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Boolean} 
     */
    IsSpatialAudioSupported {
        get => this.get_IsSpatialAudioSupported()
    }

    /**
     * @type {HSTRING} 
     */
    ActiveSpatialAudioFormat {
        get => this.get_ActiveSpatialAudioFormat()
    }

    /**
     * @type {HSTRING} 
     */
    DefaultSpatialAudioFormat {
        get => this.get_DefaultSpatialAudioFormat()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSpatialAudioSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} subtype 
     * @returns {Boolean} 
     */
    IsSpatialAudioFormatSupported(subtype) {
        if(subtype is String) {
            pin := HSTRING.Create(subtype)
            subtype := pin.Value
        }
        subtype := subtype is Win32Handle ? NumGet(subtype, "ptr") : subtype

        result := ComCall(8, this, "ptr", subtype, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActiveSpatialAudioFormat() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DefaultSpatialAudioFormat() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} subtype 
     * @returns {IAsyncOperation<SetDefaultSpatialAudioFormatResult>} 
     */
    SetDefaultSpatialAudioFormatAsync(subtype) {
        if(subtype is String) {
            pin := HSTRING.Create(subtype)
            subtype := pin.Value
        }
        subtype := subtype is Win32Handle ? NumGet(subtype, "ptr") : subtype

        result := ComCall(11, this, "ptr", subtype, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SetDefaultSpatialAudioFormatResult, operation)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialAudioDeviceConfiguration, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConfigurationChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_ConfigurationChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

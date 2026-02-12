#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RcsTransportConfiguration.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IRcsTransport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRcsTransport
     * @type {Guid}
     */
    static IID => Guid("{fea34759-f37c-4319-8546-ec84d21d30ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExtendedProperties", "get_IsActive", "get_TransportFriendlyName", "get_TransportId", "get_Configuration", "IsStoreAndForwardEnabled", "IsServiceKindSupported", "add_ServiceKindSupportedChanged", "remove_ServiceKindSupportedChanged"]

    /**
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {HSTRING} 
     */
    TransportFriendlyName {
        get => this.get_TransportFriendlyName()
    }

    /**
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
    }

    /**
     * @type {RcsTransportConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_ExtendedProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportFriendlyName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RcsTransportConfiguration} 
     */
    get_Configuration() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RcsTransportConfiguration(result_)
    }

    /**
     * 
     * @param {Integer} serviceKind 
     * @returns {Boolean} 
     */
    IsStoreAndForwardEnabled(serviceKind) {
        result := ComCall(11, this, "int", serviceKind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} serviceKind 
     * @returns {Boolean} 
     */
    IsServiceKindSupported(serviceKind) {
        result := ComCall(12, this, "int", serviceKind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TypedEventHandler<RcsTransport, RcsServiceKindSupportedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServiceKindSupportedChanged(handler) {
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
    remove_ServiceKindSupportedChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

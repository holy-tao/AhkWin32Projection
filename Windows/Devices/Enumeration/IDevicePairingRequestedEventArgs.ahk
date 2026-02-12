#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDevicePairingRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePairingRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{f717fc56-de6b-487f-8376-0180aca69963}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceInformation", "get_PairingKind", "get_Pin", "Accept", "AcceptWithPin", "GetDeferral"]

    /**
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * @type {Integer} 
     */
    PairingKind {
        get => this.get_PairingKind()
    }

    /**
     * @type {HSTRING} 
     */
    Pin {
        get => this.get_Pin()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PairingKind() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pin() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Creates a default instance of [AcceptedVoipPhoneCallOptions](./acceptedvoipphonecalloptions.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.#ctor
     */
    Accept() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a default instance of [AcceptedVoipPhoneCallOptions](./acceptedvoipphonecalloptions.md).
     * @param {HSTRING} pin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.#ctor
     */
    AcceptWithPin(pin) {
        if(pin is String) {
            pin := HSTRING.Create(pin)
            pin := pin.Value
        }
        pin := pin is Win32Handle ? NumGet(pin, "ptr") : pin

        result := ComCall(10, this, "ptr", pin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}

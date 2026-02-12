#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\LineDisplayCapabilities.ahk
#Include .\LineDisplayWindow.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedLineDisplay extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedLineDisplay
     * @type {Guid}
     */
    static IID => Guid("{120ac970-9a75-4acf-aae7-09972bcf8794}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_Capabilities", "get_PhysicalDeviceName", "get_PhysicalDeviceDescription", "get_DeviceControlDescription", "get_DeviceControlVersion", "get_DeviceServiceVersion", "get_DefaultWindow", "RetainDevice", "add_ReleaseDeviceRequested", "remove_ReleaseDeviceRequested"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {LineDisplayCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * @type {HSTRING} 
     */
    PhysicalDeviceName {
        get => this.get_PhysicalDeviceName()
    }

    /**
     * @type {HSTRING} 
     */
    PhysicalDeviceDescription {
        get => this.get_PhysicalDeviceDescription()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceControlDescription {
        get => this.get_DeviceControlDescription()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceControlVersion {
        get => this.get_DeviceControlVersion()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceServiceVersion {
        get => this.get_DeviceServiceVersion()
    }

    /**
     * @type {LineDisplayWindow} 
     */
    DefaultWindow {
        get => this.get_DefaultWindow()
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
     * @returns {LineDisplayCapabilities} 
     */
    get_Capabilities() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayCapabilities(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhysicalDeviceName() {
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
    get_PhysicalDeviceDescription() {
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
    get_DeviceControlDescription() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceControlVersion() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceServiceVersion() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {LineDisplayWindow} 
     */
    get_DefaultWindow() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayWindow(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RetainDevice() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedLineDisplay, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_ReleaseDeviceRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class ILegacyGipGameControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILegacyGipGameControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{2da3ed52-ffd9-43e2-825c-1d2790e04d14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BatteryChargingState", "get_BatteryKind", "get_BatteryLevel", "GetDeviceFirmwareCorruptionState", "get_IsFirmwareCorrupted", "IsInterfaceSupported", "get_IsSyntheticDevice", "get_PreferredTypes", "ExecuteCommand", "SetHomeLedIntensity", "GetExtendedDeviceInfo", "SetHeadsetOperation", "GetHeadsetOperation", "get_AppCompatVersion", "SetStandardControllerButtonRemapping", "GetStandardControllerButtonRemapping"]

    /**
     * @type {Integer} 
     */
    BatteryChargingState {
        get => this.get_BatteryChargingState()
    }

    /**
     * @type {Integer} 
     */
    BatteryKind {
        get => this.get_BatteryKind()
    }

    /**
     * @type {Integer} 
     */
    BatteryLevel {
        get => this.get_BatteryLevel()
    }

    /**
     * @type {Boolean} 
     */
    IsFirmwareCorrupted {
        get => this.get_IsFirmwareCorrupted()
    }

    /**
     * @type {Boolean} 
     */
    IsSyntheticDevice {
        get => this.get_IsSyntheticDevice()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    PreferredTypes {
        get => this.get_PreferredTypes()
    }

    /**
     * @type {Integer} 
     */
    AppCompatVersion {
        get => this.get_AppCompatVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatteryChargingState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatteryKind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatteryLevel() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDeviceFirmwareCorruptionState() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFirmwareCorrupted() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} interfaceId 
     * @returns {Boolean} 
     */
    IsInterfaceSupported(interfaceId) {
        result := ComCall(11, this, "ptr", interfaceId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyntheticDevice() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PreferredTypes() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {Integer} command 
     * @returns {HRESULT} 
     */
    ExecuteCommand(command) {
        result := ComCall(14, this, "int", command, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} intensity 
     * @returns {HRESULT} 
     */
    SetHomeLedIntensity(intensity) {
        result := ComCall(15, this, "char", intensity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} buffer_ 
     * @returns {HRESULT} 
     */
    GetExtendedDeviceInfo(buffer_) {
        result := ComCall(16, this, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer 
     * @returns {HRESULT} 
     */
    SetHeadsetOperation(operation, buffer_length, buffer) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, "int", operation, "uint", buffer_length, bufferMarshal, buffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} operation 
     * @param {Pointer<Pointer>} buffer_ 
     * @returns {HRESULT} 
     */
    GetHeadsetOperation(operation, buffer_) {
        result := ComCall(18, this, "int", operation, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppCompatVersion() {
        result := ComCall(19, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Boolean} previous 
     * @param {IMapView<Integer, IInspectable>} remapping 
     * @returns {HRESULT} 
     */
    SetStandardControllerButtonRemapping(user_, previous, remapping) {
        result := ComCall(20, this, "ptr", user_, "int", previous, "ptr", remapping, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Boolean} previous 
     * @returns {IMapView<Integer, IInspectable>} 
     */
    GetStandardControllerButtonRemapping(user_, previous) {
        result := ComCall(21, this, "ptr", user_, "int", previous, "ptr*", &remapping := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetInt32(), IInspectable, remapping)
    }
}

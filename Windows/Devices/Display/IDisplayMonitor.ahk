#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Graphics\DisplayAdapterId.ahk
#Include ..\..\Graphics\SizeInt32.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayMonitor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayMonitor
     * @type {Guid}
     */
    static IID => Guid("{1f6b15d4-1d01-4c51-87e2-6f954a772b59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_DisplayName", "get_ConnectionKind", "get_PhysicalConnector", "get_DisplayAdapterDeviceId", "get_DisplayAdapterId", "get_DisplayAdapterTargetId", "get_UsageKind", "get_NativeResolutionInRawPixels", "get_PhysicalSizeInInches", "get_RawDpiX", "get_RawDpiY", "get_RedPrimary", "get_GreenPrimary", "get_BluePrimary", "get_WhitePoint", "get_MaxLuminanceInNits", "get_MinLuminanceInNits", "get_MaxAverageFullFrameLuminanceInNits", "GetDescriptor"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {Integer} 
     */
    ConnectionKind {
        get => this.get_ConnectionKind()
    }

    /**
     * @type {Integer} 
     */
    PhysicalConnector {
        get => this.get_PhysicalConnector()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayAdapterDeviceId {
        get => this.get_DisplayAdapterDeviceId()
    }

    /**
     * @type {DisplayAdapterId} 
     */
    DisplayAdapterId {
        get => this.get_DisplayAdapterId()
    }

    /**
     * @type {Integer} 
     */
    DisplayAdapterTargetId {
        get => this.get_DisplayAdapterTargetId()
    }

    /**
     * @type {Integer} 
     */
    UsageKind {
        get => this.get_UsageKind()
    }

    /**
     * @type {SizeInt32} 
     */
    NativeResolutionInRawPixels {
        get => this.get_NativeResolutionInRawPixels()
    }

    /**
     * @type {IReference<SIZE>} 
     */
    PhysicalSizeInInches {
        get => this.get_PhysicalSizeInInches()
    }

    /**
     * @type {Float} 
     */
    RawDpiX {
        get => this.get_RawDpiX()
    }

    /**
     * @type {Float} 
     */
    RawDpiY {
        get => this.get_RawDpiY()
    }

    /**
     * @type {POINT} 
     */
    RedPrimary {
        get => this.get_RedPrimary()
    }

    /**
     * @type {POINT} 
     */
    GreenPrimary {
        get => this.get_GreenPrimary()
    }

    /**
     * @type {POINT} 
     */
    BluePrimary {
        get => this.get_BluePrimary()
    }

    /**
     * @type {POINT} 
     */
    WhitePoint {
        get => this.get_WhitePoint()
    }

    /**
     * @type {Float} 
     */
    MaxLuminanceInNits {
        get => this.get_MaxLuminanceInNits()
    }

    /**
     * @type {Float} 
     */
    MinLuminanceInNits {
        get => this.get_MinLuminanceInNits()
    }

    /**
     * @type {Float} 
     */
    MaxAverageFullFrameLuminanceInNits {
        get => this.get_MaxAverageFullFrameLuminanceInNits()
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
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionKind() {
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
    get_PhysicalConnector() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayAdapterDeviceId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_DisplayAdapterId() {
        value := DisplayAdapterId()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayAdapterTargetId() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageKind() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_NativeResolutionInRawPixels() {
        value := SizeInt32()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<SIZE>} 
     */
    get_PhysicalSizeInInches() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSIZE(), value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiX() {
        result := ComCall(16, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiY() {
        result := ComCall(17, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RedPrimary() {
        value := POINT()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_GreenPrimary() {
        value := POINT()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BluePrimary() {
        value := POINT()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_WhitePoint() {
        value := POINT()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxLuminanceInNits() {
        result := ComCall(22, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinLuminanceInNits() {
        result := ComCall(23, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAverageFullFrameLuminanceInNits() {
        result := ComCall(24, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} descriptorKind 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetDescriptor(descriptorKind, result_) {
        result := ComCall(25, this, "int", descriptorKind, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

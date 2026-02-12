#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LowLagPhotoSequenceControl.ahk
#Include .\LowLagPhotoControl.ahk
#Include .\SceneModeControl.ahk
#Include .\TorchControl.ahk
#Include .\FlashControl.ahk
#Include .\WhiteBalanceControl.ahk
#Include .\ExposureControl.ahk
#Include .\FocusControl.ahk
#Include .\ExposureCompensationControl.ahk
#Include .\IsoSpeedControl.ahk
#Include .\RegionsOfInterestControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController2
     * @type {Guid}
     */
    static IID => Guid("{8bb94f8f-f11a-43db-b402-11930b80ae56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LowLagPhotoSequence", "get_LowLagPhoto", "get_SceneModeControl", "get_TorchControl", "get_FlashControl", "get_WhiteBalanceControl", "get_ExposureControl", "get_FocusControl", "get_ExposureCompensationControl", "get_IsoSpeedControl", "get_RegionsOfInterestControl", "get_PrimaryUse", "put_PrimaryUse"]

    /**
     * @type {LowLagPhotoSequenceControl} 
     */
    LowLagPhotoSequence {
        get => this.get_LowLagPhotoSequence()
    }

    /**
     * @type {LowLagPhotoControl} 
     */
    LowLagPhoto {
        get => this.get_LowLagPhoto()
    }

    /**
     * @type {SceneModeControl} 
     */
    SceneModeControl {
        get => this.get_SceneModeControl()
    }

    /**
     * @type {TorchControl} 
     */
    TorchControl {
        get => this.get_TorchControl()
    }

    /**
     * @type {FlashControl} 
     */
    FlashControl {
        get => this.get_FlashControl()
    }

    /**
     * @type {WhiteBalanceControl} 
     */
    WhiteBalanceControl {
        get => this.get_WhiteBalanceControl()
    }

    /**
     * @type {ExposureControl} 
     */
    ExposureControl {
        get => this.get_ExposureControl()
    }

    /**
     * @type {FocusControl} 
     */
    FocusControl {
        get => this.get_FocusControl()
    }

    /**
     * @type {ExposureCompensationControl} 
     */
    ExposureCompensationControl {
        get => this.get_ExposureCompensationControl()
    }

    /**
     * @type {IsoSpeedControl} 
     */
    IsoSpeedControl {
        get => this.get_IsoSpeedControl()
    }

    /**
     * @type {RegionsOfInterestControl} 
     */
    RegionsOfInterestControl {
        get => this.get_RegionsOfInterestControl()
    }

    /**
     * @type {Integer} 
     */
    PrimaryUse {
        get => this.get_PrimaryUse()
        set => this.put_PrimaryUse(value)
    }

    /**
     * 
     * @returns {LowLagPhotoSequenceControl} 
     */
    get_LowLagPhotoSequence() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LowLagPhotoSequenceControl(value)
    }

    /**
     * 
     * @returns {LowLagPhotoControl} 
     */
    get_LowLagPhoto() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LowLagPhotoControl(value)
    }

    /**
     * 
     * @returns {SceneModeControl} 
     */
    get_SceneModeControl() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneModeControl(value)
    }

    /**
     * 
     * @returns {TorchControl} 
     */
    get_TorchControl() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TorchControl(value)
    }

    /**
     * 
     * @returns {FlashControl} 
     */
    get_FlashControl() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FlashControl(value)
    }

    /**
     * 
     * @returns {WhiteBalanceControl} 
     */
    get_WhiteBalanceControl() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WhiteBalanceControl(value)
    }

    /**
     * 
     * @returns {ExposureControl} 
     */
    get_ExposureControl() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExposureControl(value)
    }

    /**
     * 
     * @returns {FocusControl} 
     */
    get_FocusControl() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FocusControl(value)
    }

    /**
     * 
     * @returns {ExposureCompensationControl} 
     */
    get_ExposureCompensationControl() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExposureCompensationControl(value)
    }

    /**
     * 
     * @returns {IsoSpeedControl} 
     */
    get_IsoSpeedControl() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IsoSpeedControl(value)
    }

    /**
     * 
     * @returns {RegionsOfInterestControl} 
     */
    get_RegionsOfInterestControl() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RegionsOfInterestControl(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrimaryUse() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrimaryUse(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

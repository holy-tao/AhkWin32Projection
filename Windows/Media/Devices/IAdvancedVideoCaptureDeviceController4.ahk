#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ExposurePriorityVideoControl.ahk
#Include .\HdrVideoControl.ahk
#Include .\OpticalImageStabilizationControl.ahk
#Include .\AdvancedPhotoControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController4
     * @type {Guid}
     */
    static IID => Guid("{ea9fbfaf-d371-41c3-9a17-824a87ebdfd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExposurePriorityVideoControl", "get_DesiredOptimization", "put_DesiredOptimization", "get_HdrVideoControl", "get_OpticalImageStabilizationControl", "get_AdvancedPhotoControl"]

    /**
     * @type {ExposurePriorityVideoControl} 
     */
    ExposurePriorityVideoControl {
        get => this.get_ExposurePriorityVideoControl()
    }

    /**
     * @type {Integer} 
     */
    DesiredOptimization {
        get => this.get_DesiredOptimization()
        set => this.put_DesiredOptimization(value)
    }

    /**
     * @type {HdrVideoControl} 
     */
    HdrVideoControl {
        get => this.get_HdrVideoControl()
    }

    /**
     * @type {OpticalImageStabilizationControl} 
     */
    OpticalImageStabilizationControl {
        get => this.get_OpticalImageStabilizationControl()
    }

    /**
     * @type {AdvancedPhotoControl} 
     */
    AdvancedPhotoControl {
        get => this.get_AdvancedPhotoControl()
    }

    /**
     * 
     * @returns {ExposurePriorityVideoControl} 
     */
    get_ExposurePriorityVideoControl() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExposurePriorityVideoControl(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredOptimization() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_DesiredOptimization(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HdrVideoControl} 
     */
    get_HdrVideoControl() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HdrVideoControl(value)
    }

    /**
     * 
     * @returns {OpticalImageStabilizationControl} 
     */
    get_OpticalImageStabilizationControl() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OpticalImageStabilizationControl(value)
    }

    /**
     * 
     * @returns {AdvancedPhotoControl} 
     */
    get_AdvancedPhotoControl() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdvancedPhotoControl(value)
    }
}

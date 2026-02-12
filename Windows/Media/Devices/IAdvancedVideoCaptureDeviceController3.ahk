#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include Core\VariablePhotoSequenceController.ahk
#Include .\PhotoConfirmationControl.ahk
#Include .\ZoomControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAdvancedVideoCaptureDeviceController3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedVideoCaptureDeviceController3
     * @type {Guid}
     */
    static IID => Guid("{a98b8f34-ee0d-470c-b9f0-4229c4bbd089}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VariablePhotoSequenceController", "get_PhotoConfirmationControl", "get_ZoomControl"]

    /**
     * @type {VariablePhotoSequenceController} 
     */
    VariablePhotoSequenceController {
        get => this.get_VariablePhotoSequenceController()
    }

    /**
     * @type {PhotoConfirmationControl} 
     */
    PhotoConfirmationControl {
        get => this.get_PhotoConfirmationControl()
    }

    /**
     * @type {ZoomControl} 
     */
    ZoomControl {
        get => this.get_ZoomControl()
    }

    /**
     * 
     * @returns {VariablePhotoSequenceController} 
     */
    get_VariablePhotoSequenceController() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VariablePhotoSequenceController(value)
    }

    /**
     * 
     * @returns {PhotoConfirmationControl} 
     */
    get_PhotoConfirmationControl() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoConfirmationControl(value)
    }

    /**
     * 
     * @returns {ZoomControl} 
     */
    get_ZoomControl() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ZoomControl(value)
    }
}

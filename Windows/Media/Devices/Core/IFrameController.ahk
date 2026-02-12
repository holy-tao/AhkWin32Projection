#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FrameExposureControl.ahk
#Include .\FrameExposureCompensationControl.ahk
#Include .\FrameIsoSpeedControl.ahk
#Include .\FrameFocusControl.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class IFrameController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameController
     * @type {Guid}
     */
    static IID => Guid("{c16459d9-baef-4052-9177-48aff2af7522}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExposureControl", "get_ExposureCompensationControl", "get_IsoSpeedControl", "get_FocusControl", "get_PhotoConfirmationEnabled", "put_PhotoConfirmationEnabled"]

    /**
     * @type {FrameExposureControl} 
     */
    ExposureControl {
        get => this.get_ExposureControl()
    }

    /**
     * @type {FrameExposureCompensationControl} 
     */
    ExposureCompensationControl {
        get => this.get_ExposureCompensationControl()
    }

    /**
     * @type {FrameIsoSpeedControl} 
     */
    IsoSpeedControl {
        get => this.get_IsoSpeedControl()
    }

    /**
     * @type {FrameFocusControl} 
     */
    FocusControl {
        get => this.get_FocusControl()
    }

    /**
     * @type {IReference<Boolean>} 
     */
    PhotoConfirmationEnabled {
        get => this.get_PhotoConfirmationEnabled()
        set => this.put_PhotoConfirmationEnabled(value)
    }

    /**
     * 
     * @returns {FrameExposureControl} 
     */
    get_ExposureControl() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameExposureControl(value)
    }

    /**
     * 
     * @returns {FrameExposureCompensationControl} 
     */
    get_ExposureCompensationControl() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameExposureCompensationControl(value)
    }

    /**
     * 
     * @returns {FrameIsoSpeedControl} 
     */
    get_IsoSpeedControl() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameIsoSpeedControl(value)
    }

    /**
     * 
     * @returns {FrameFocusControl} 
     */
    get_FocusControl() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameFocusControl(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_PhotoConfirmationEnabled() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_PhotoConfirmationEnabled(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

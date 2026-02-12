#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FrameExposureCapabilities.ahk
#Include .\FrameExposureCompensationCapabilities.ahk
#Include .\FrameIsoSpeedCapabilities.ahk
#Include .\FrameFocusCapabilities.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class IFrameControlCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameControlCapabilities
     * @type {Guid}
     */
    static IID => Guid("{a8ffae60-4e9e-4377-a789-e24c4ae7e544}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Exposure", "get_ExposureCompensation", "get_IsoSpeed", "get_Focus", "get_PhotoConfirmationSupported"]

    /**
     * @type {FrameExposureCapabilities} 
     */
    Exposure {
        get => this.get_Exposure()
    }

    /**
     * @type {FrameExposureCompensationCapabilities} 
     */
    ExposureCompensation {
        get => this.get_ExposureCompensation()
    }

    /**
     * @type {FrameIsoSpeedCapabilities} 
     */
    IsoSpeed {
        get => this.get_IsoSpeed()
    }

    /**
     * @type {FrameFocusCapabilities} 
     */
    Focus {
        get => this.get_Focus()
    }

    /**
     * @type {Boolean} 
     */
    PhotoConfirmationSupported {
        get => this.get_PhotoConfirmationSupported()
    }

    /**
     * 
     * @returns {FrameExposureCapabilities} 
     */
    get_Exposure() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameExposureCapabilities(value)
    }

    /**
     * 
     * @returns {FrameExposureCompensationCapabilities} 
     */
    get_ExposureCompensation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameExposureCompensationCapabilities(value)
    }

    /**
     * 
     * @returns {FrameIsoSpeedCapabilities} 
     */
    get_IsoSpeed() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameIsoSpeedCapabilities(value)
    }

    /**
     * 
     * @returns {FrameFocusCapabilities} 
     */
    get_Focus() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameFocusCapabilities(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PhotoConfirmationSupported() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

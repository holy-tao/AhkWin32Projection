#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaDeviceControl.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IVideoDeviceController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoDeviceController
     * @type {Guid}
     */
    static IID => Guid("{99555575-2e2e-40b8-b6c7-f82d10013210}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Brightness", "get_Contrast", "get_Hue", "get_WhiteBalance", "get_BacklightCompensation", "get_Pan", "get_Tilt", "get_Zoom", "get_Roll", "get_Exposure", "get_Focus", "TrySetPowerlineFrequency", "TryGetPowerlineFrequency"]

    /**
     * @type {MediaDeviceControl} 
     */
    Brightness {
        get => this.get_Brightness()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Contrast {
        get => this.get_Contrast()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Hue {
        get => this.get_Hue()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    WhiteBalance {
        get => this.get_WhiteBalance()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    BacklightCompensation {
        get => this.get_BacklightCompensation()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Pan {
        get => this.get_Pan()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Tilt {
        get => this.get_Tilt()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Zoom {
        get => this.get_Zoom()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Roll {
        get => this.get_Roll()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Exposure {
        get => this.get_Exposure()
    }

    /**
     * @type {MediaDeviceControl} 
     */
    Focus {
        get => this.get_Focus()
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Brightness() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Contrast() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Hue() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_WhiteBalance() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_BacklightCompensation() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Pan() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Tilt() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Zoom() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Roll() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Exposure() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @returns {MediaDeviceControl} 
     */
    get_Focus() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControl(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    TrySetPowerlineFrequency(value) {
        result := ComCall(17, this, "int", value, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {Boolean} 
     */
    TryGetPowerlineFrequency(value) {
        result := ComCall(18, this, "ptr", value, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }
}

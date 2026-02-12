#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaDeviceControlCapabilities.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Controls device settings on a video camera or microphone.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.imediadevicecontroller
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IMediaDeviceControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaDeviceControl
     * @type {Guid}
     */
    static IID => Guid("{efa8dfa9-6f75-4863-ba0b-583f3036b4de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capabilities", "TryGetValue", "TrySetValue", "TryGetAuto", "TrySetAuto"]

    /**
     * @type {MediaDeviceControlCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * 
     * @returns {MediaDeviceControlCapabilities} 
     */
    get_Capabilities() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaDeviceControlCapabilities(value)
    }

    /**
     * 
     * @param {Pointer<Double>} value 
     * @returns {Boolean} 
     */
    TryGetValue(value) {
        result := ComCall(7, this, "ptr", value, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }

    /**
     * 
     * @param {Float} value 
     * @returns {Boolean} 
     */
    TrySetValue(value) {
        result := ComCall(8, this, "double", value, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }

    /**
     * 
     * @param {Pointer<Boolean>} value 
     * @returns {Boolean} 
     */
    TryGetAuto(value) {
        result := ComCall(9, this, "ptr", value, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {Boolean} 
     */
    TrySetAuto(value) {
        result := ComCall(10, this, "int", value, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }
}

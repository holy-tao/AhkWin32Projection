#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureSettings
     * @type {Guid}
     */
    static IID => Guid("{1d83aafe-6d45-4477-8dc4-ac5bc01c4091}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioDeviceId", "get_VideoDeviceId", "get_StreamingCaptureMode", "get_PhotoCaptureSource", "get_VideoDeviceCharacteristic"]

    /**
     * @type {HSTRING} 
     */
    AudioDeviceId {
        get => this.get_AudioDeviceId()
    }

    /**
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
    }

    /**
     * @type {Integer} 
     */
    StreamingCaptureMode {
        get => this.get_StreamingCaptureMode()
    }

    /**
     * @type {Integer} 
     */
    PhotoCaptureSource {
        get => this.get_PhotoCaptureSource()
    }

    /**
     * @type {Integer} 
     */
    VideoDeviceCharacteristic {
        get => this.get_VideoDeviceCharacteristic()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioDeviceId() {
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
    get_VideoDeviceId() {
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
    get_StreamingCaptureMode() {
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
    get_PhotoCaptureSource() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoDeviceCharacteristic() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

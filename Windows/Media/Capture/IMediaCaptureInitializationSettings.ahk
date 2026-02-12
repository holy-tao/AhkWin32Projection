#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureInitializationSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureInitializationSettings
     * @type {Guid}
     */
    static IID => Guid("{9782ba70-ea65-4900-9356-8ca887726884}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AudioDeviceId", "get_AudioDeviceId", "put_VideoDeviceId", "get_VideoDeviceId", "put_StreamingCaptureMode", "get_StreamingCaptureMode", "put_PhotoCaptureSource", "get_PhotoCaptureSource"]

    /**
     * @type {HSTRING} 
     */
    AudioDeviceId {
        get => this.get_AudioDeviceId()
        set => this.put_AudioDeviceId(value)
    }

    /**
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
        set => this.put_VideoDeviceId(value)
    }

    /**
     * @type {Integer} 
     */
    StreamingCaptureMode {
        get => this.get_StreamingCaptureMode()
        set => this.put_StreamingCaptureMode(value)
    }

    /**
     * @type {Integer} 
     */
    PhotoCaptureSource {
        get => this.get_PhotoCaptureSource()
        set => this.put_PhotoCaptureSource(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AudioDeviceId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioDeviceId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_VideoDeviceId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VideoDeviceId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
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
    put_StreamingCaptureMode(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamingCaptureMode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_PhotoCaptureSource(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotoCaptureSource() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaCaptureVideoProfile.ahk
#Include .\MediaCaptureVideoProfileMediaDescription.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureInitializationSettings4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureInitializationSettings4
     * @type {Guid}
     */
    static IID => Guid("{f502a537-4cb7-4d28-95ed-4f9f012e0518}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoProfile", "put_VideoProfile", "get_PreviewMediaDescription", "put_PreviewMediaDescription", "get_RecordMediaDescription", "put_RecordMediaDescription", "get_PhotoMediaDescription", "put_PhotoMediaDescription"]

    /**
     * @type {MediaCaptureVideoProfile} 
     */
    VideoProfile {
        get => this.get_VideoProfile()
        set => this.put_VideoProfile(value)
    }

    /**
     * @type {MediaCaptureVideoProfileMediaDescription} 
     */
    PreviewMediaDescription {
        get => this.get_PreviewMediaDescription()
        set => this.put_PreviewMediaDescription(value)
    }

    /**
     * @type {MediaCaptureVideoProfileMediaDescription} 
     */
    RecordMediaDescription {
        get => this.get_RecordMediaDescription()
        set => this.put_RecordMediaDescription(value)
    }

    /**
     * @type {MediaCaptureVideoProfileMediaDescription} 
     */
    PhotoMediaDescription {
        get => this.get_PhotoMediaDescription()
        set => this.put_PhotoMediaDescription(value)
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfile} 
     */
    get_VideoProfile() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaCaptureVideoProfile(value)
    }

    /**
     * 
     * @param {MediaCaptureVideoProfile} value 
     * @returns {HRESULT} 
     */
    put_VideoProfile(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfileMediaDescription} 
     */
    get_PreviewMediaDescription() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaCaptureVideoProfileMediaDescription(value)
    }

    /**
     * 
     * @param {MediaCaptureVideoProfileMediaDescription} value 
     * @returns {HRESULT} 
     */
    put_PreviewMediaDescription(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfileMediaDescription} 
     */
    get_RecordMediaDescription() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaCaptureVideoProfileMediaDescription(value)
    }

    /**
     * 
     * @param {MediaCaptureVideoProfileMediaDescription} value 
     * @returns {HRESULT} 
     */
    put_RecordMediaDescription(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaCaptureVideoProfileMediaDescription} 
     */
    get_PhotoMediaDescription() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaCaptureVideoProfileMediaDescription(value)
    }

    /**
     * 
     * @param {MediaCaptureVideoProfileMediaDescription} value 
     * @returns {HRESULT} 
     */
    put_PhotoMediaDescription(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

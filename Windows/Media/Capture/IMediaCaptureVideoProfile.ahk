#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MediaCaptureVideoProfileMediaDescription.ahk
#Include .\MediaCaptureVideoProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureVideoProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureVideoProfile
     * @type {Guid}
     */
    static IID => Guid("{21a073bf-a3ee-4ecf-9ef6-50b0bc4e1305}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_VideoDeviceId", "get_SupportedPreviewMediaDescription", "get_SupportedRecordMediaDescription", "get_SupportedPhotoMediaDescription", "GetConcurrency"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    VideoDeviceId {
        get => this.get_VideoDeviceId()
    }

    /**
     * @type {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    SupportedPreviewMediaDescription {
        get => this.get_SupportedPreviewMediaDescription()
    }

    /**
     * @type {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    SupportedRecordMediaDescription {
        get => this.get_SupportedRecordMediaDescription()
    }

    /**
     * @type {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    SupportedPhotoMediaDescription {
        get => this.get_SupportedPhotoMediaDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
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
     * @returns {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    get_SupportedPreviewMediaDescription() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaCaptureVideoProfileMediaDescription, value)
    }

    /**
     * 
     * @returns {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    get_SupportedRecordMediaDescription() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaCaptureVideoProfileMediaDescription, value)
    }

    /**
     * 
     * @returns {IVectorView<MediaCaptureVideoProfileMediaDescription>} 
     */
    get_SupportedPhotoMediaDescription() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaCaptureVideoProfileMediaDescription, value)
    }

    /**
     * 
     * @returns {IVectorView<MediaCaptureVideoProfile>} 
     */
    GetConcurrency() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MediaCaptureVideoProfile, value)
    }
}

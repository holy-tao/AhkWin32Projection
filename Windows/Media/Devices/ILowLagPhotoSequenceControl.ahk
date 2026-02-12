#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\MediaProperties\MediaRatio.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ILowLagPhotoSequenceControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLagPhotoSequenceControl
     * @type {Guid}
     */
    static IID => Guid("{3dcf909d-6d16-409c-bafe-b9a594c6fde6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_MaxPastPhotos", "get_MaxPhotosPerSecond", "get_PastPhotoLimit", "put_PastPhotoLimit", "get_PhotosPerSecondLimit", "put_PhotosPerSecondLimit", "GetHighestConcurrentFrameRate", "GetCurrentFrameRate", "get_ThumbnailEnabled", "put_ThumbnailEnabled", "get_ThumbnailFormat", "put_ThumbnailFormat", "get_DesiredThumbnailSize", "put_DesiredThumbnailSize", "get_HardwareAcceleratedThumbnailSupported"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {Integer} 
     */
    MaxPastPhotos {
        get => this.get_MaxPastPhotos()
    }

    /**
     * @type {Float} 
     */
    MaxPhotosPerSecond {
        get => this.get_MaxPhotosPerSecond()
    }

    /**
     * @type {Integer} 
     */
    PastPhotoLimit {
        get => this.get_PastPhotoLimit()
        set => this.put_PastPhotoLimit(value)
    }

    /**
     * @type {Float} 
     */
    PhotosPerSecondLimit {
        get => this.get_PhotosPerSecondLimit()
        set => this.put_PhotosPerSecondLimit(value)
    }

    /**
     * @type {Boolean} 
     */
    ThumbnailEnabled {
        get => this.get_ThumbnailEnabled()
        set => this.put_ThumbnailEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    ThumbnailFormat {
        get => this.get_ThumbnailFormat()
        set => this.put_ThumbnailFormat(value)
    }

    /**
     * @type {Integer} 
     */
    DesiredThumbnailSize {
        get => this.get_DesiredThumbnailSize()
        set => this.put_DesiredThumbnailSize(value)
    }

    /**
     * @type {Integer} 
     */
    HardwareAcceleratedThumbnailSupported {
        get => this.get_HardwareAcceleratedThumbnailSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPastPhotos() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxPhotosPerSecond() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PastPhotoLimit() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
    put_PastPhotoLimit(value) {
        result := ComCall(10, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PhotosPerSecondLimit() {
        result := ComCall(11, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PhotosPerSecondLimit(value) {
        result := ComCall(12, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IMediaEncodingProperties} captureProperties 
     * @returns {MediaRatio} 
     */
    GetHighestConcurrentFrameRate(captureProperties) {
        result := ComCall(13, this, "ptr", captureProperties, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaRatio(value)
    }

    /**
     * 
     * @returns {MediaRatio} 
     */
    GetCurrentFrameRate() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaRatio(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ThumbnailEnabled() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ThumbnailEnabled(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThumbnailFormat() {
        result := ComCall(17, this, "int*", &value := 0, "int")
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
    put_ThumbnailFormat(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredThumbnailSize() {
        result := ComCall(19, this, "uint*", &value := 0, "int")
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
    put_DesiredThumbnailSize(value) {
        result := ComCall(20, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareAcceleratedThumbnailSupported() {
        result := ComCall(21, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

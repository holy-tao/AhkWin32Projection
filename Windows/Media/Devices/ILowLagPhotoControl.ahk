#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\MediaProperties\MediaRatio.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ILowLagPhotoControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLagPhotoControl
     * @type {Guid}
     */
    static IID => Guid("{6d5c4dd0-fadf-415d-aee6-3baa529300c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHighestConcurrentFrameRate", "GetCurrentFrameRate", "get_ThumbnailEnabled", "put_ThumbnailEnabled", "get_ThumbnailFormat", "put_ThumbnailFormat", "get_DesiredThumbnailSize", "put_DesiredThumbnailSize", "get_HardwareAcceleratedThumbnailSupported"]

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
     * @param {IMediaEncodingProperties} captureProperties 
     * @returns {MediaRatio} 
     */
    GetHighestConcurrentFrameRate(captureProperties) {
        result := ComCall(6, this, "ptr", captureProperties, "ptr*", &value := 0, "int")
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
        result := ComCall(7, this, "ptr*", &value := 0, "int")
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
        result := ComCall(8, this, "int*", &value := 0, "int")
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
        result := ComCall(9, this, "int", value, "int")
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
        result := ComCall(10, this, "int*", &value := 0, "int")
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
        result := ComCall(11, this, "int", value, "int")
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
        result := ComCall(12, this, "uint*", &value := 0, "int")
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
        result := ComCall(13, this, "uint", value, "int")
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
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

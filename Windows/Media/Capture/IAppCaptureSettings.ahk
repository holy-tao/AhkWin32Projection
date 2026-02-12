#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\StorageFolder.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureSettings
     * @type {Guid}
     */
    static IID => Guid("{14683a86-8807-48d3-883a-970ee4532a39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AppCaptureDestinationFolder", "get_AppCaptureDestinationFolder", "put_AudioEncodingBitrate", "get_AudioEncodingBitrate", "put_IsAudioCaptureEnabled", "get_IsAudioCaptureEnabled", "put_CustomVideoEncodingBitrate", "get_CustomVideoEncodingBitrate", "put_CustomVideoEncodingHeight", "get_CustomVideoEncodingHeight", "put_CustomVideoEncodingWidth", "get_CustomVideoEncodingWidth", "put_HistoricalBufferLength", "get_HistoricalBufferLength", "put_HistoricalBufferLengthUnit", "get_HistoricalBufferLengthUnit", "put_IsHistoricalCaptureEnabled", "get_IsHistoricalCaptureEnabled", "put_IsHistoricalCaptureOnBatteryAllowed", "get_IsHistoricalCaptureOnBatteryAllowed", "put_IsHistoricalCaptureOnWirelessDisplayAllowed", "get_IsHistoricalCaptureOnWirelessDisplayAllowed", "put_MaximumRecordLength", "get_MaximumRecordLength", "put_ScreenshotDestinationFolder", "get_ScreenshotDestinationFolder", "put_VideoEncodingBitrateMode", "get_VideoEncodingBitrateMode", "put_VideoEncodingResolutionMode", "get_VideoEncodingResolutionMode", "put_IsAppCaptureEnabled", "get_IsAppCaptureEnabled", "get_IsCpuConstrained", "get_IsDisabledByPolicy", "get_IsMemoryConstrained", "get_HasHardwareEncoder"]

    /**
     * @type {StorageFolder} 
     */
    AppCaptureDestinationFolder {
        get => this.get_AppCaptureDestinationFolder()
        set => this.put_AppCaptureDestinationFolder(value)
    }

    /**
     * @type {Integer} 
     */
    AudioEncodingBitrate {
        get => this.get_AudioEncodingBitrate()
        set => this.put_AudioEncodingBitrate(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAudioCaptureEnabled {
        get => this.get_IsAudioCaptureEnabled()
        set => this.put_IsAudioCaptureEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    CustomVideoEncodingBitrate {
        get => this.get_CustomVideoEncodingBitrate()
        set => this.put_CustomVideoEncodingBitrate(value)
    }

    /**
     * @type {Integer} 
     */
    CustomVideoEncodingHeight {
        get => this.get_CustomVideoEncodingHeight()
        set => this.put_CustomVideoEncodingHeight(value)
    }

    /**
     * @type {Integer} 
     */
    CustomVideoEncodingWidth {
        get => this.get_CustomVideoEncodingWidth()
        set => this.put_CustomVideoEncodingWidth(value)
    }

    /**
     * @type {Integer} 
     */
    HistoricalBufferLength {
        get => this.get_HistoricalBufferLength()
        set => this.put_HistoricalBufferLength(value)
    }

    /**
     * @type {Integer} 
     */
    HistoricalBufferLengthUnit {
        get => this.get_HistoricalBufferLengthUnit()
        set => this.put_HistoricalBufferLengthUnit(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHistoricalCaptureEnabled {
        get => this.get_IsHistoricalCaptureEnabled()
        set => this.put_IsHistoricalCaptureEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHistoricalCaptureOnBatteryAllowed {
        get => this.get_IsHistoricalCaptureOnBatteryAllowed()
        set => this.put_IsHistoricalCaptureOnBatteryAllowed(value)
    }

    /**
     * @type {Boolean} 
     */
    IsHistoricalCaptureOnWirelessDisplayAllowed {
        get => this.get_IsHistoricalCaptureOnWirelessDisplayAllowed()
        set => this.put_IsHistoricalCaptureOnWirelessDisplayAllowed(value)
    }

    /**
     * @type {TimeSpan} 
     */
    MaximumRecordLength {
        get => this.get_MaximumRecordLength()
        set => this.put_MaximumRecordLength(value)
    }

    /**
     * @type {StorageFolder} 
     */
    ScreenshotDestinationFolder {
        get => this.get_ScreenshotDestinationFolder()
        set => this.put_ScreenshotDestinationFolder(value)
    }

    /**
     * @type {Integer} 
     */
    VideoEncodingBitrateMode {
        get => this.get_VideoEncodingBitrateMode()
        set => this.put_VideoEncodingBitrateMode(value)
    }

    /**
     * @type {Integer} 
     */
    VideoEncodingResolutionMode {
        get => this.get_VideoEncodingResolutionMode()
        set => this.put_VideoEncodingResolutionMode(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAppCaptureEnabled {
        get => this.get_IsAppCaptureEnabled()
        set => this.put_IsAppCaptureEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCpuConstrained {
        get => this.get_IsCpuConstrained()
    }

    /**
     * @type {Boolean} 
     */
    IsDisabledByPolicy {
        get => this.get_IsDisabledByPolicy()
    }

    /**
     * @type {Boolean} 
     */
    IsMemoryConstrained {
        get => this.get_IsMemoryConstrained()
    }

    /**
     * @type {Boolean} 
     */
    HasHardwareEncoder {
        get => this.get_HasHardwareEncoder()
    }

    /**
     * 
     * @param {StorageFolder} value 
     * @returns {HRESULT} 
     */
    put_AppCaptureDestinationFolder(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_AppCaptureDestinationFolder() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioEncodingBitrate(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioEncodingBitrate() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
    put_IsAudioCaptureEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAudioCaptureEnabled() {
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
    put_CustomVideoEncodingBitrate(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingBitrate() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
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
    put_CustomVideoEncodingHeight(value) {
        result := ComCall(14, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingHeight() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
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
    put_CustomVideoEncodingWidth(value) {
        result := ComCall(16, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingWidth() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
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
    put_HistoricalBufferLength(value) {
        result := ComCall(18, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HistoricalBufferLength() {
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
    put_HistoricalBufferLengthUnit(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HistoricalBufferLengthUnit() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_IsHistoricalCaptureEnabled(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureEnabled() {
        result := ComCall(23, this, "int*", &value := 0, "int")
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
    put_IsHistoricalCaptureOnBatteryAllowed(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureOnBatteryAllowed() {
        result := ComCall(25, this, "int*", &value := 0, "int")
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
    put_IsHistoricalCaptureOnWirelessDisplayAllowed(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHistoricalCaptureOnWirelessDisplayAllowed() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_MaximumRecordLength(value) {
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaximumRecordLength() {
        value := TimeSpan()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {StorageFolder} value 
     * @returns {HRESULT} 
     */
    put_ScreenshotDestinationFolder(value) {
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_ScreenshotDestinationFolder() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoEncodingBitrateMode(value) {
        result := ComCall(32, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingBitrateMode() {
        result := ComCall(33, this, "int*", &value := 0, "int")
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
    put_VideoEncodingResolutionMode(value) {
        result := ComCall(34, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingResolutionMode() {
        result := ComCall(35, this, "int*", &value := 0, "int")
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
    put_IsAppCaptureEnabled(value) {
        result := ComCall(36, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAppCaptureEnabled() {
        result := ComCall(37, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCpuConstrained() {
        result := ComCall(38, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledByPolicy() {
        result := ComCall(39, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMemoryConstrained() {
        result := ComCall(40, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasHardwareEncoder() {
        result := ComCall(41, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

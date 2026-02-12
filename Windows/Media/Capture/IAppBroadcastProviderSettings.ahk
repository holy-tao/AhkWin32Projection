#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastProviderSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastProviderSettings
     * @type {Guid}
     */
    static IID => Guid("{c30bdf62-9948-458f-ad50-aa06ec03da08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_DefaultBroadcastTitle", "get_DefaultBroadcastTitle", "put_AudioEncodingBitrate", "get_AudioEncodingBitrate", "put_CustomVideoEncodingBitrate", "get_CustomVideoEncodingBitrate", "put_CustomVideoEncodingHeight", "get_CustomVideoEncodingHeight", "put_CustomVideoEncodingWidth", "get_CustomVideoEncodingWidth", "put_VideoEncodingBitrateMode", "get_VideoEncodingBitrateMode", "put_VideoEncodingResolutionMode", "get_VideoEncodingResolutionMode"]

    /**
     * @type {HSTRING} 
     */
    DefaultBroadcastTitle {
        get => this.get_DefaultBroadcastTitle()
        set => this.put_DefaultBroadcastTitle(value)
    }

    /**
     * @type {Integer} 
     */
    AudioEncodingBitrate {
        get => this.get_AudioEncodingBitrate()
        set => this.put_AudioEncodingBitrate(value)
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
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DefaultBroadcastTitle(value) {
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
    get_DefaultBroadcastTitle() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
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
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomVideoEncodingBitrate(value) {
        result := ComCall(10, this, "uint", value, "int")
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
        result := ComCall(11, this, "uint*", &value := 0, "int")
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
    get_CustomVideoEncodingHeight() {
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
    put_CustomVideoEncodingWidth(value) {
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
    get_CustomVideoEncodingWidth() {
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
    put_VideoEncodingBitrateMode(value) {
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
    get_VideoEncodingBitrateMode() {
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
    put_VideoEncodingResolutionMode(value) {
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
    get_VideoEncodingResolutionMode() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

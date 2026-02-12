#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlaybackItem3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlaybackItem3
     * @type {Guid}
     */
    static IID => Guid("{0d328220-b80a-4d09-9ff8-f87094a1c831}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDisabledInPlaybackList", "put_IsDisabledInPlaybackList", "get_TotalDownloadProgress", "get_AutoLoadedDisplayProperties", "put_AutoLoadedDisplayProperties"]

    /**
     * @type {Boolean} 
     */
    IsDisabledInPlaybackList {
        get => this.get_IsDisabledInPlaybackList()
        set => this.put_IsDisabledInPlaybackList(value)
    }

    /**
     * @type {Float} 
     */
    TotalDownloadProgress {
        get => this.get_TotalDownloadProgress()
    }

    /**
     * @type {Integer} 
     */
    AutoLoadedDisplayProperties {
        get => this.get_AutoLoadedDisplayProperties()
        set => this.put_AutoLoadedDisplayProperties(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledInPlaybackList() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsDisabledInPlaybackList(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TotalDownloadProgress() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoLoadedDisplayProperties() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_AutoLoadedDisplayProperties(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

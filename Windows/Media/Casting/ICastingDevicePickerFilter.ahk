#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\CastingSource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class ICastingDevicePickerFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingDevicePickerFilter
     * @type {Guid}
     */
    static IID => Guid("{be8c619c-b563-4354-ae33-9fdaad8c6291}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportsAudio", "put_SupportsAudio", "get_SupportsVideo", "put_SupportsVideo", "get_SupportsPictures", "put_SupportsPictures", "get_SupportedCastingSources"]

    /**
     * @type {Boolean} 
     */
    SupportsAudio {
        get => this.get_SupportsAudio()
        set => this.put_SupportsAudio(value)
    }

    /**
     * @type {Boolean} 
     */
    SupportsVideo {
        get => this.get_SupportsVideo()
        set => this.put_SupportsVideo(value)
    }

    /**
     * @type {Boolean} 
     */
    SupportsPictures {
        get => this.get_SupportsPictures()
        set => this.put_SupportsPictures(value)
    }

    /**
     * @type {IVector<CastingSource>} 
     */
    SupportedCastingSources {
        get => this.get_SupportedCastingSources()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsAudio() {
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
    put_SupportsAudio(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsVideo() {
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
    put_SupportsVideo(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsPictures() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_SupportsPictures(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<CastingSource>} 
     */
    get_SupportedCastingSources() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(CastingSource, value)
    }
}

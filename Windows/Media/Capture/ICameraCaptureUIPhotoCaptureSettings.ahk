#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICameraCaptureUIPhotoCaptureSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraCaptureUIPhotoCaptureSettings
     * @type {Guid}
     */
    static IID => Guid("{b9f5be97-3472-46a8-8a9e-04ce42ccc97d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "put_Format", "get_MaxResolution", "put_MaxResolution", "get_CroppedSizeInPixels", "put_CroppedSizeInPixels", "get_CroppedAspectRatio", "put_CroppedAspectRatio", "get_AllowCropping", "put_AllowCropping"]

    /**
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * @type {Integer} 
     */
    MaxResolution {
        get => this.get_MaxResolution()
        set => this.put_MaxResolution(value)
    }

    /**
     * @type {SIZE} 
     */
    CroppedSizeInPixels {
        get => this.get_CroppedSizeInPixels()
        set => this.put_CroppedSizeInPixels(value)
    }

    /**
     * @type {SIZE} 
     */
    CroppedAspectRatio {
        get => this.get_CroppedAspectRatio()
        set => this.put_CroppedAspectRatio(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowCropping {
        get => this.get_AllowCropping()
        set => this.put_AllowCropping(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_Format(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResolution() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_MaxResolution(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CroppedSizeInPixels() {
        value := SIZE()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_CroppedSizeInPixels(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CroppedAspectRatio() {
        value := SIZE()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_CroppedAspectRatio(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCropping() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_AllowCropping(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

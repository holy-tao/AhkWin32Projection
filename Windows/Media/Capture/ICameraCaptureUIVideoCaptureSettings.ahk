#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICameraCaptureUIVideoCaptureSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraCaptureUIVideoCaptureSettings
     * @type {Guid}
     */
    static IID => Guid("{64e92d1f-a28d-425a-b84f-e568335ff24e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "put_Format", "get_MaxResolution", "put_MaxResolution", "get_MaxDurationInSeconds", "put_MaxDurationInSeconds", "get_AllowTrimming", "put_AllowTrimming"]

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
     * @type {Float} 
     */
    MaxDurationInSeconds {
        get => this.get_MaxDurationInSeconds()
        set => this.put_MaxDurationInSeconds(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowTrimming {
        get => this.get_AllowTrimming()
        set => this.put_AllowTrimming(value)
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
     * @returns {Float} 
     */
    get_MaxDurationInSeconds() {
        result := ComCall(10, this, "float*", &value := 0, "int")
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
    put_MaxDurationInSeconds(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowTrimming() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_AllowTrimming(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

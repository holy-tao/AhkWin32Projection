#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IRegionOfInterest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegionOfInterest
     * @type {Guid}
     */
    static IID => Guid("{e5ecc834-ce66-4e05-a78f-cf391a5ec2d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutoFocusEnabled", "put_AutoFocusEnabled", "get_AutoWhiteBalanceEnabled", "put_AutoWhiteBalanceEnabled", "get_AutoExposureEnabled", "put_AutoExposureEnabled", "get_Bounds", "put_Bounds"]

    /**
     * @type {Boolean} 
     */
    AutoFocusEnabled {
        get => this.get_AutoFocusEnabled()
        set => this.put_AutoFocusEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    AutoWhiteBalanceEnabled {
        get => this.get_AutoWhiteBalanceEnabled()
        set => this.put_AutoWhiteBalanceEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    AutoExposureEnabled {
        get => this.get_AutoExposureEnabled()
        set => this.put_AutoExposureEnabled(value)
    }

    /**
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
        set => this.put_Bounds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoFocusEnabled() {
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
    put_AutoFocusEnabled(value) {
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
    get_AutoWhiteBalanceEnabled() {
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
    put_AutoWhiteBalanceEnabled(value) {
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
    get_AutoExposureEnabled() {
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
    put_AutoExposureEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        value := RECT()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Bounds(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

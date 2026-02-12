#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IAdvancedColorInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdvancedColorInfo
     * @type {Guid}
     */
    static IID => Guid("{8797dcfb-b229-4081-ae9a-2cc85e34ad6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentAdvancedColorKind", "get_RedPrimary", "get_GreenPrimary", "get_BluePrimary", "get_WhitePoint", "get_MaxLuminanceInNits", "get_MinLuminanceInNits", "get_MaxAverageFullFrameLuminanceInNits", "get_SdrWhiteLevelInNits", "IsHdrMetadataFormatCurrentlySupported", "IsAdvancedColorKindAvailable"]

    /**
     * @type {Integer} 
     */
    CurrentAdvancedColorKind {
        get => this.get_CurrentAdvancedColorKind()
    }

    /**
     * @type {POINT} 
     */
    RedPrimary {
        get => this.get_RedPrimary()
    }

    /**
     * @type {POINT} 
     */
    GreenPrimary {
        get => this.get_GreenPrimary()
    }

    /**
     * @type {POINT} 
     */
    BluePrimary {
        get => this.get_BluePrimary()
    }

    /**
     * @type {POINT} 
     */
    WhitePoint {
        get => this.get_WhitePoint()
    }

    /**
     * @type {Float} 
     */
    MaxLuminanceInNits {
        get => this.get_MaxLuminanceInNits()
    }

    /**
     * @type {Float} 
     */
    MinLuminanceInNits {
        get => this.get_MinLuminanceInNits()
    }

    /**
     * @type {Float} 
     */
    MaxAverageFullFrameLuminanceInNits {
        get => this.get_MaxAverageFullFrameLuminanceInNits()
    }

    /**
     * @type {Float} 
     */
    SdrWhiteLevelInNits {
        get => this.get_SdrWhiteLevelInNits()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentAdvancedColorKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_RedPrimary() {
        value := POINT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_GreenPrimary() {
        value := POINT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_BluePrimary() {
        value := POINT()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_WhitePoint() {
        value := POINT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxLuminanceInNits() {
        result := ComCall(11, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinLuminanceInNits() {
        result := ComCall(12, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAverageFullFrameLuminanceInNits() {
        result := ComCall(13, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SdrWhiteLevelInNits() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} format 
     * @returns {Boolean} 
     */
    IsHdrMetadataFormatCurrentlySupported(format) {
        result := ComCall(15, this, "int", format, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {Boolean} 
     */
    IsAdvancedColorKindAvailable(kind) {
        result := ComCall(16, this, "int", kind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

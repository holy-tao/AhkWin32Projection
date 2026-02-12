#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextConstantsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextConstantsStatics
     * @type {Guid}
     */
    static IID => Guid("{779e7c33-189d-4bfa-97c8-10db135d976e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutoColor", "get_MinUnitCount", "get_MaxUnitCount", "get_UndefinedColor", "get_UndefinedFloatValue", "get_UndefinedInt32Value", "get_UndefinedFontStretch", "get_UndefinedFontStyle"]

    /**
     * @type {Color} 
     */
    AutoColor {
        get => this.get_AutoColor()
    }

    /**
     * @type {Integer} 
     */
    MinUnitCount {
        get => this.get_MinUnitCount()
    }

    /**
     * @type {Integer} 
     */
    MaxUnitCount {
        get => this.get_MaxUnitCount()
    }

    /**
     * @type {Color} 
     */
    UndefinedColor {
        get => this.get_UndefinedColor()
    }

    /**
     * @type {Float} 
     */
    UndefinedFloatValue {
        get => this.get_UndefinedFloatValue()
    }

    /**
     * @type {Integer} 
     */
    UndefinedInt32Value {
        get => this.get_UndefinedInt32Value()
    }

    /**
     * @type {Integer} 
     */
    UndefinedFontStretch {
        get => this.get_UndefinedFontStretch()
    }

    /**
     * @type {Integer} 
     */
    UndefinedFontStyle {
        get => this.get_UndefinedFontStyle()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_AutoColor() {
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinUnitCount() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxUnitCount() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_UndefinedColor() {
        value := Color()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UndefinedFloatValue() {
        result := ComCall(10, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UndefinedInt32Value() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UndefinedFontStretch() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UndefinedFontStyle() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

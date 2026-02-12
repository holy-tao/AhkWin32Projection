#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\FontWeight.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class IFontWeightsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFontWeightsStatics
     * @type {Guid}
     */
    static IID => Guid("{b3b579d5-1ba9-48eb-9dad-c095e8c23ba3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Black", "get_Bold", "get_ExtraBlack", "get_ExtraBold", "get_ExtraLight", "get_Light", "get_Medium", "get_Normal", "get_SemiBold", "get_SemiLight", "get_Thin"]

    /**
     * @type {FontWeight} 
     */
    Black {
        get => this.get_Black()
    }

    /**
     * @type {FontWeight} 
     */
    Bold {
        get => this.get_Bold()
    }

    /**
     * @type {FontWeight} 
     */
    ExtraBlack {
        get => this.get_ExtraBlack()
    }

    /**
     * @type {FontWeight} 
     */
    ExtraBold {
        get => this.get_ExtraBold()
    }

    /**
     * @type {FontWeight} 
     */
    ExtraLight {
        get => this.get_ExtraLight()
    }

    /**
     * @type {FontWeight} 
     */
    Light {
        get => this.get_Light()
    }

    /**
     * @type {FontWeight} 
     */
    Medium {
        get => this.get_Medium()
    }

    /**
     * @type {FontWeight} 
     */
    Normal {
        get => this.get_Normal()
    }

    /**
     * @type {FontWeight} 
     */
    SemiBold {
        get => this.get_SemiBold()
    }

    /**
     * @type {FontWeight} 
     */
    SemiLight {
        get => this.get_SemiLight()
    }

    /**
     * @type {FontWeight} 
     */
    Thin {
        get => this.get_Thin()
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_Black() {
        value := FontWeight()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_Bold() {
        value := FontWeight()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_ExtraBlack() {
        value := FontWeight()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_ExtraBold() {
        value := FontWeight()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_ExtraLight() {
        value := FontWeight()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_Light() {
        value := FontWeight()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_Medium() {
        value := FontWeight()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_Normal() {
        value := FontWeight()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_SemiBold() {
        value := FontWeight()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_SemiLight() {
        value := FontWeight()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_Thin() {
        value := FontWeight()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

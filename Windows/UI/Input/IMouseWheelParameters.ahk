#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IMouseWheelParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMouseWheelParameters
     * @type {Guid}
     */
    static IID => Guid("{ead0ca44-9ded-4037-8149-5e4cc2564468}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CharTranslation", "put_CharTranslation", "get_DeltaScale", "put_DeltaScale", "get_DeltaRotationAngle", "put_DeltaRotationAngle", "get_PageTranslation", "put_PageTranslation"]

    /**
     * @type {POINT} 
     */
    CharTranslation {
        get => this.get_CharTranslation()
        set => this.put_CharTranslation(value)
    }

    /**
     * @type {Float} 
     */
    DeltaScale {
        get => this.get_DeltaScale()
        set => this.put_DeltaScale(value)
    }

    /**
     * @type {Float} 
     */
    DeltaRotationAngle {
        get => this.get_DeltaRotationAngle()
        set => this.put_DeltaRotationAngle(value)
    }

    /**
     * @type {POINT} 
     */
    PageTranslation {
        get => this.get_PageTranslation()
        set => this.put_PageTranslation(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_CharTranslation() {
        value := POINT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_CharTranslation(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DeltaScale() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_DeltaScale(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DeltaRotationAngle() {
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
    put_DeltaRotationAngle(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PageTranslation() {
        value := POINT()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_PageTranslation(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

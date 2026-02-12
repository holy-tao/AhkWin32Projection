#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GridLength.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IGridLengthHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGridLengthHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{9d457b9b-019f-4266-8872-215f198f6a9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Auto", "FromPixels", "FromValueAndType", "GetIsAbsolute", "GetIsAuto", "GetIsStar", "Equals"]

    /**
     * @type {GridLength} 
     */
    Auto {
        get => this.get_Auto()
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Auto() {
        value := GridLength()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} pixels 
     * @returns {GridLength} 
     */
    FromPixels(pixels) {
        result_ := GridLength()
        result := ComCall(7, this, "double", pixels, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Float} value 
     * @param {Integer} type 
     * @returns {GridLength} 
     */
    FromValueAndType(value, type) {
        result_ := GridLength()
        result := ComCall(8, this, "double", value, "int", type, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {GridLength} target 
     * @returns {Boolean} 
     */
    GetIsAbsolute(target) {
        result := ComCall(9, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {GridLength} target 
     * @returns {Boolean} 
     */
    GetIsAuto(target) {
        result := ComCall(10, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {GridLength} target 
     * @returns {Boolean} 
     */
    GetIsStar(target) {
        result := ComCall(11, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {GridLength} target 
     * @param {GridLength} value 
     * @returns {Boolean} 
     */
    Equals(target, value) {
        result := ComCall(12, this, "ptr", target, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

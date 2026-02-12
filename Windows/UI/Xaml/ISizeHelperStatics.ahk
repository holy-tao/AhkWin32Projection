#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ISizeHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISizeHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{6286c5b2-cf78-4915-aa40-76004a165f5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Empty", "FromDimensions", "GetIsEmpty", "Equals"]

    /**
     * @type {SIZE} 
     */
    Empty {
        get => this.get_Empty()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Empty() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {SIZE} 
     */
    FromDimensions(width, height) {
        result_ := SIZE()
        result := ComCall(7, this, "float", width, "float", height, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {SIZE} target 
     * @returns {Boolean} 
     */
    GetIsEmpty(target) {
        result := ComCall(8, this, "ptr", target, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {SIZE} target 
     * @param {SIZE} value 
     * @returns {Boolean} 
     */
    Equals(target, value) {
        result := ComCall(9, this, "ptr", target, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

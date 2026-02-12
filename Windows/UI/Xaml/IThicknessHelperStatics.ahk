#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Thickness.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IThicknessHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThicknessHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{c0991a7c-070c-4da6-8784-01ca800eb73a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromLengths", "FromUniformLength"]

    /**
     * 
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @returns {Thickness} 
     */
    FromLengths(left, top, right, bottom) {
        result_ := Thickness()
        result := ComCall(6, this, "double", left, "double", top, "double", right, "double", bottom, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Float} uniformLength 
     * @returns {Thickness} 
     */
    FromUniformLength(uniformLength) {
        result_ := Thickness()
        result := ComCall(7, this, "double", uniformLength, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

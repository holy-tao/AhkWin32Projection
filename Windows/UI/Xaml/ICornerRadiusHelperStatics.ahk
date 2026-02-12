#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CornerRadius.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ICornerRadiusHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICornerRadiusHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{f4a1f659-d4d4-451f-a387-d6bf4b2451d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromRadii", "FromUniformRadius"]

    /**
     * 
     * @param {Float} topLeft 
     * @param {Float} topRight 
     * @param {Float} bottomRight 
     * @param {Float} bottomLeft 
     * @returns {CornerRadius} 
     */
    FromRadii(topLeft, topRight, bottomRight, bottomLeft) {
        result_ := CornerRadius()
        result := ComCall(6, this, "double", topLeft, "double", topRight, "double", bottomRight, "double", bottomLeft, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Float} uniformRadius 
     * @returns {CornerRadius} 
     */
    FromUniformRadius(uniformRadius) {
        result_ := CornerRadius()
        result := ComCall(7, this, "double", uniformRadius, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

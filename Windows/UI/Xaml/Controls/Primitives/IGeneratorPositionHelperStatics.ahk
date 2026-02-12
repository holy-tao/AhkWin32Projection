#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\GeneratorPosition.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IGeneratorPositionHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeneratorPositionHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{ad4095cd-60ec-4588-8d60-39d29097a4df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIndexAndOffset"]

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} offset 
     * @returns {GeneratorPosition} 
     */
    FromIndexAndOffset(index, offset) {
        result_ := GeneratorPosition()
        result := ComCall(6, this, "int", index, "int", offset, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

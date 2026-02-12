#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionGradientBrush2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGradientBrush2
     * @type {Guid}
     */
    static IID => Guid("{899dd5a1-b4c7-4b33-a1b6-264addc26d10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MappingMode", "put_MappingMode"]

    /**
     * @type {Integer} 
     */
    MappingMode {
        get => this.get_MappingMode()
        set => this.put_MappingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MappingMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MappingMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

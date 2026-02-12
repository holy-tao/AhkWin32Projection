#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkDrawingAttributesPencilProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDrawingAttributesPencilProperties
     * @type {Guid}
     */
    static IID => Guid("{4f2534cb-2d86-41bb-b0e8-e4c2a0253c52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Opacity", "put_Opacity"]

    /**
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        result := ComCall(6, this, "double*", &value := 0, "int")
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
    put_Opacity(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

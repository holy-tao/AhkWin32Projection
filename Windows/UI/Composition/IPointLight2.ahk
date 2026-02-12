#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IPointLight2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPointLight2
     * @type {Guid}
     */
    static IID => Guid("{efe98f2c-0678-4f69-b164-a810d995bcb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Intensity", "put_Intensity"]

    /**
     * @type {Float} 
     */
    Intensity {
        get => this.get_Intensity()
        set => this.put_Intensity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Intensity() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_Intensity(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

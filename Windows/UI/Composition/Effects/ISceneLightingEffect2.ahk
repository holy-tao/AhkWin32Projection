#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Effects
 * @version WindowsRuntime 1.4
 */
class ISceneLightingEffect2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneLightingEffect2
     * @type {Guid}
     */
    static IID => Guid("{9e270e81-72f0-4c5c-95f8-8a6e0024f409}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReflectanceModel", "put_ReflectanceModel"]

    /**
     * @type {Integer} 
     */
    ReflectanceModel {
        get => this.get_ReflectanceModel()
        set => this.put_ReflectanceModel(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReflectanceModel() {
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
    put_ReflectanceModel(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionEffectBrush.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ILayerVisual extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILayerVisual
     * @type {Guid}
     */
    static IID => Guid("{af843985-0444-4887-8e83-b40b253f822c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Effect", "put_Effect"]

    /**
     * @type {CompositionEffectBrush} 
     */
    Effect {
        get => this.get_Effect()
        set => this.put_Effect(value)
    }

    /**
     * 
     * @returns {CompositionEffectBrush} 
     */
    get_Effect() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionEffectBrush(value)
    }

    /**
     * 
     * @param {CompositionEffectBrush} value 
     * @returns {HRESULT} 
     */
    put_Effect(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

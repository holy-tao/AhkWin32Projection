#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionBrush.ahk
#Include .\Visual.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionProjectedShadowCaster extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionProjectedShadowCaster
     * @type {Guid}
     */
    static IID => Guid("{b1d7d426-1e36-5a62-be56-a16112fdd148}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Brush", "put_Brush", "get_CastingVisual", "put_CastingVisual"]

    /**
     * @type {CompositionBrush} 
     */
    Brush {
        get => this.get_Brush()
        set => this.put_Brush(value)
    }

    /**
     * @type {Visual} 
     */
    CastingVisual {
        get => this.get_CastingVisual()
        set => this.put_CastingVisual(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Brush() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBrush(value)
    }

    /**
     * 
     * @param {CompositionBrush} value 
     * @returns {HRESULT} 
     */
    put_Brush(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_CastingVisual() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(value)
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_CastingVisual(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

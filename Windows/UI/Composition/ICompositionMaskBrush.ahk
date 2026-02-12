#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionBrush.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionMaskBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionMaskBrush
     * @type {Guid}
     */
    static IID => Guid("{522cf09e-be6b-4f41-be49-f9226d471b4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Mask", "put_Mask", "get_Source", "put_Source"]

    /**
     * @type {CompositionBrush} 
     */
    Mask {
        get => this.get_Mask()
        set => this.put_Mask(value)
    }

    /**
     * @type {CompositionBrush} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Mask() {
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
    put_Mask(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionBrush} 
     */
    get_Source() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_Source(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

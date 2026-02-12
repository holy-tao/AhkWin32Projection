#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionShadow.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ISpriteVisual2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpriteVisual2
     * @type {Guid}
     */
    static IID => Guid("{588c9664-997a-4850-91fe-53cb58f81ce9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Shadow", "put_Shadow"]

    /**
     * @type {CompositionShadow} 
     */
    Shadow {
        get => this.get_Shadow()
        set => this.put_Shadow(value)
    }

    /**
     * 
     * @returns {CompositionShadow} 
     */
    get_Shadow() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionShadow(value)
    }

    /**
     * 
     * @param {CompositionShadow} value 
     * @returns {HRESULT} 
     */
    put_Shadow(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

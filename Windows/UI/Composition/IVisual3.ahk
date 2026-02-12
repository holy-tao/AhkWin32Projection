#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVisual3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisual3
     * @type {Guid}
     */
    static IID => Guid("{30be580d-f4b6-4ab7-80dd-3738cbac9f2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsHitTestVisible", "put_IsHitTestVisible"]

    /**
     * @type {Boolean} 
     */
    IsHitTestVisible {
        get => this.get_IsHitTestVisible()
        set => this.put_IsHitTestVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHitTestVisible() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHitTestVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

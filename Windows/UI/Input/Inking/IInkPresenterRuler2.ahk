#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPresenterRuler2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPresenterRuler2
     * @type {Guid}
     */
    static IID => Guid("{45130dc1-bc61-44d4-a423-54712ae671c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreTickMarksVisible", "put_AreTickMarksVisible", "get_IsCompassVisible", "put_IsCompassVisible"]

    /**
     * @type {Boolean} 
     */
    AreTickMarksVisible {
        get => this.get_AreTickMarksVisible()
        set => this.put_AreTickMarksVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCompassVisible {
        get => this.get_IsCompassVisible()
        set => this.put_IsCompassVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreTickMarksVisible() {
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
    put_AreTickMarksVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompassVisible() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsCompassVisible(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ISlideNavigationTransitionInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISlideNavigationTransitionInfo2
     * @type {Guid}
     */
    static IID => Guid("{90e2d9c0-5c81-5001-8013-4fbfea4bf139}")

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
     * @type {Integer} 
     */
    Effect {
        get => this.get_Effect()
        set => this.put_Effect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Effect() {
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
    put_Effect(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

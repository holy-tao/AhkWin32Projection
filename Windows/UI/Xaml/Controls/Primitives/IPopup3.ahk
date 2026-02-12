#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IPopup3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPopup3
     * @type {Guid}
     */
    static IID => Guid("{f9c46915-a65c-5f68-9f54-310a1b51095f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShouldConstrainToRootBounds", "put_ShouldConstrainToRootBounds", "get_IsConstrainedToRootBounds"]

    /**
     * @type {Boolean} 
     */
    ShouldConstrainToRootBounds {
        get => this.get_ShouldConstrainToRootBounds()
        set => this.put_ShouldConstrainToRootBounds(value)
    }

    /**
     * @type {Boolean} 
     */
    IsConstrainedToRootBounds {
        get => this.get_IsConstrainedToRootBounds()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldConstrainToRootBounds() {
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
    put_ShouldConstrainToRootBounds(value) {
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
    get_IsConstrainedToRootBounds() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\XamlRoot.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBase6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBase6
     * @type {Guid}
     */
    static IID => Guid("{5399de8c-06cc-5b52-b65a-ff9322d1c940}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShouldConstrainToRootBounds", "put_ShouldConstrainToRootBounds", "get_IsConstrainedToRootBounds", "get_XamlRoot", "put_XamlRoot"]

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
     * @type {XamlRoot} 
     */
    XamlRoot {
        get => this.get_XamlRoot()
        set => this.put_XamlRoot(value)
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

    /**
     * 
     * @returns {XamlRoot} 
     */
    get_XamlRoot() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XamlRoot(value)
    }

    /**
     * 
     * @param {XamlRoot} value 
     * @returns {HRESULT} 
     */
    put_XamlRoot(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

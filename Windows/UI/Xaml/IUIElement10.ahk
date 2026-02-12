#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include .\XamlRoot.ahk
#Include ..\UIContext.ahk
#Include Media\Shadow.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElement10 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElement10
     * @type {Guid}
     */
    static IID => Guid("{d531c629-ad2c-5f6b-adcf-fb87287d18d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActualOffset", "get_ActualSize", "get_XamlRoot", "put_XamlRoot", "get_UIContext", "get_Shadow", "put_Shadow"]

    /**
     * @type {Vector3} 
     */
    ActualOffset {
        get => this.get_ActualOffset()
    }

    /**
     * @type {Vector2} 
     */
    ActualSize {
        get => this.get_ActualSize()
    }

    /**
     * @type {XamlRoot} 
     */
    XamlRoot {
        get => this.get_XamlRoot()
        set => this.put_XamlRoot(value)
    }

    /**
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * @type {Shadow} 
     */
    Shadow {
        get => this.get_Shadow()
        set => this.put_Shadow(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_ActualOffset() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_ActualSize() {
        value := Vector2()
        result := ComCall(7, this, "ptr", value, "int")
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
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIContext(value)
    }

    /**
     * 
     * @returns {Shadow} 
     */
    get_Shadow() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Shadow(value)
    }

    /**
     * 
     * @param {Shadow} value 
     * @returns {HRESULT} 
     */
    put_Shadow(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

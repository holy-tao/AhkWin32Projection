#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFindNextElementOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFindNextElementOptions
     * @type {Guid}
     */
    static IID => Guid("{d88ae22b-46c2-41fc-897e-b5961977b89d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SearchRoot", "put_SearchRoot", "get_ExclusionRect", "put_ExclusionRect", "get_HintRect", "put_HintRect", "get_XYFocusNavigationStrategyOverride", "put_XYFocusNavigationStrategyOverride"]

    /**
     * @type {DependencyObject} 
     */
    SearchRoot {
        get => this.get_SearchRoot()
        set => this.put_SearchRoot(value)
    }

    /**
     * @type {RECT} 
     */
    ExclusionRect {
        get => this.get_ExclusionRect()
        set => this.put_ExclusionRect(value)
    }

    /**
     * @type {RECT} 
     */
    HintRect {
        get => this.get_HintRect()
        set => this.put_HintRect(value)
    }

    /**
     * @type {Integer} 
     */
    XYFocusNavigationStrategyOverride {
        get => this.get_XYFocusNavigationStrategyOverride()
        set => this.put_XYFocusNavigationStrategyOverride(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_SearchRoot() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(value)
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_SearchRoot(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ExclusionRect() {
        value := RECT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_ExclusionRect(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_HintRect() {
        value := RECT()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_HintRect(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_XYFocusNavigationStrategyOverride() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_XYFocusNavigationStrategyOverride(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

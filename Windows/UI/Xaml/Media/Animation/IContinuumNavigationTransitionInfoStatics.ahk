#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IContinuumNavigationTransitionInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContinuumNavigationTransitionInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{3e25dd53-b18f-4bf1-b3bc-92f516f29903}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExitElementProperty", "get_IsEntranceElementProperty", "GetIsEntranceElement", "SetIsEntranceElement", "get_IsExitElementProperty", "GetIsExitElement", "SetIsExitElement", "get_ExitElementContainerProperty", "GetExitElementContainer", "SetExitElementContainer"]

    /**
     * @type {DependencyProperty} 
     */
    ExitElementProperty {
        get => this.get_ExitElementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsEntranceElementProperty {
        get => this.get_IsEntranceElementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsExitElementProperty {
        get => this.get_IsExitElementProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExitElementContainerProperty {
        get => this.get_ExitElementContainerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ExitElementProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsEntranceElementProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetIsEntranceElement(element) {
        result := ComCall(8, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetIsEntranceElement(element, value) {
        result := ComCall(9, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsExitElementProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {Boolean} 
     */
    GetIsExitElement(element) {
        result := ComCall(11, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetIsExitElement(element, value) {
        result := ComCall(12, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ExitElementContainerProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {ListViewBase} element 
     * @returns {Boolean} 
     */
    GetExitElementContainer(element) {
        result := ComCall(14, this, "ptr", element, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {ListViewBase} element 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetExitElementContainer(element, value) {
        result := ComCall(15, this, "ptr", element, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

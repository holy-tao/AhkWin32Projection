#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IPopupStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPopupStatics
     * @type {Guid}
     */
    static IID => Guid("{5ae3bf1a-6e34-40d6-8a7f-ca822aaf59e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChildProperty", "get_IsOpenProperty", "get_HorizontalOffsetProperty", "get_VerticalOffsetProperty", "get_ChildTransitionsProperty", "get_IsLightDismissEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ChildProperty {
        get => this.get_ChildProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsOpenProperty {
        get => this.get_IsOpenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalOffsetProperty {
        get => this.get_HorizontalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VerticalOffsetProperty {
        get => this.get_VerticalOffsetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ChildTransitionsProperty {
        get => this.get_ChildTransitionsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsLightDismissEnabledProperty {
        get => this.get_IsLightDismissEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ChildProperty() {
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
    get_IsOpenProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalOffsetProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VerticalOffsetProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ChildTransitionsProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsLightDismissEnabledProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

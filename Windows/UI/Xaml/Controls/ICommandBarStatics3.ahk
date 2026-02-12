#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ICommandBarStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarStatics3
     * @type {Guid}
     */
    static IID => Guid("{b45a24a4-8af1-4843-b319-e03fc45ab726}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultLabelPositionProperty", "get_OverflowButtonVisibilityProperty", "get_IsDynamicOverflowEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DefaultLabelPositionProperty {
        get => this.get_DefaultLabelPositionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OverflowButtonVisibilityProperty {
        get => this.get_OverflowButtonVisibilityProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsDynamicOverflowEnabledProperty {
        get => this.get_IsDynamicOverflowEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DefaultLabelPositionProperty() {
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
    get_OverflowButtonVisibilityProperty() {
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
    get_IsDynamicOverflowEnabledProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

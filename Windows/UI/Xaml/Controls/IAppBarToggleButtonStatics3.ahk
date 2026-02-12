#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarToggleButtonStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarToggleButtonStatics3
     * @type {Guid}
     */
    static IID => Guid("{bd4c65bf-2edd-44d1-acd5-35c00e2f21bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LabelPositionProperty", "get_IsInOverflowProperty", "get_DynamicOverflowOrderProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LabelPositionProperty {
        get => this.get_LabelPositionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsInOverflowProperty {
        get => this.get_IsInOverflowProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DynamicOverflowOrderProperty {
        get => this.get_DynamicOverflowOrderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LabelPositionProperty() {
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
    get_IsInOverflowProperty() {
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
    get_DynamicOverflowOrderProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementStatics3
     * @type {Guid}
     */
    static IID => Guid("{d1f87ade-eca1-4561-a32b-64601b4e0597}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Transform3DProperty", "get_CanDragProperty", "TryStartDirectManipulation"]

    /**
     * @type {DependencyProperty} 
     */
    Transform3DProperty {
        get => this.get_Transform3DProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanDragProperty {
        get => this.get_CanDragProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Transform3DProperty() {
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
    get_CanDragProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {Pointer} value 
     * @returns {Boolean} 
     */
    TryStartDirectManipulation(value) {
        result := ComCall(8, this, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

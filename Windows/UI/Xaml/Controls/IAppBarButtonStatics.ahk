#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{7ccd13e6-5301-407f-874e-dc9160aa07af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LabelProperty", "get_IconProperty", "get_IsCompactProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LabelProperty {
        get => this.get_LabelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IconProperty {
        get => this.get_IconProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsCompactProperty {
        get => this.get_IsCompactProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LabelProperty() {
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
    get_IconProperty() {
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
    get_IsCompactProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

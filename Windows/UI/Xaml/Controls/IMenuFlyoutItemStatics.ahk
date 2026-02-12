#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMenuFlyoutItemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuFlyoutItemStatics
     * @type {Guid}
     */
    static IID => Guid("{4950b424-a43a-41f7-aa3a-9ce9619747d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextProperty", "get_CommandProperty", "get_CommandParameterProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TextProperty {
        get => this.get_TextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CommandProperty {
        get => this.get_CommandProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CommandParameterProperty {
        get => this.get_CommandParameterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextProperty() {
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
    get_CommandProperty() {
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
    get_CommandParameterProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IColumnDefinitionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColumnDefinitionStatics
     * @type {Guid}
     */
    static IID => Guid("{06b0d728-d044-40c6-942e-ae60eac74851}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WidthProperty", "get_MaxWidthProperty", "get_MinWidthProperty"]

    /**
     * @type {DependencyProperty} 
     */
    WidthProperty {
        get => this.get_WidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MaxWidthProperty {
        get => this.get_MaxWidthProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MinWidthProperty {
        get => this.get_MinWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_WidthProperty() {
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
    get_MaxWidthProperty() {
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
    get_MinWidthProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

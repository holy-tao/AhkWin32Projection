#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewBaseStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewBaseStatics3
     * @type {Guid}
     */
    static IID => Guid("{3b539091-31c6-4d0c-90af-5dc1d6ae9c05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReorderModeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ReorderModeProperty {
        get => this.get_ReorderModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ReorderModeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

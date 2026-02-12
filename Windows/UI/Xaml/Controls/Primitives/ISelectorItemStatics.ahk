#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ISelectorItemStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectorItemStatics
     * @type {Guid}
     */
    static IID => Guid("{2a353ab8-cbe9-4303-92e7-c8906e218392}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSelectedProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsSelectedProperty {
        get => this.get_IsSelectedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSelectedProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

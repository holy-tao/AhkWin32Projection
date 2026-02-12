#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwipeItemsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwipeItemsStatics
     * @type {Guid}
     */
    static IID => Guid("{376250df-48db-43e3-b0e9-089e5da9a114}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ModeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ModeProperty {
        get => this.get_ModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ModeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

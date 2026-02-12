#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IStackPanelStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStackPanelStatics5
     * @type {Guid}
     */
    static IID => Guid("{87287490-bff2-5347-8787-fb5aec942878}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundSizingProperty"]

    /**
     * @type {DependencyProperty} 
     */
    BackgroundSizingProperty {
        get => this.get_BackgroundSizingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BackgroundSizingProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

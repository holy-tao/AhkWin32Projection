#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBaseStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBaseStatics3
     * @type {Guid}
     */
    static IID => Guid("{7ba92e4f-dd16-4be4-99db-bd9d4406c0f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverlayInputPassThroughElementProperty"]

    /**
     * @type {DependencyProperty} 
     */
    OverlayInputPassThroughElementProperty {
        get => this.get_OverlayInputPassThroughElementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OverlayInputPassThroughElementProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

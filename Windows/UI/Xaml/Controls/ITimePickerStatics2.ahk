#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITimePickerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimePickerStatics2
     * @type {Guid}
     */
    static IID => Guid("{36d8abcd-4e10-451a-b93b-1a731ea7ee3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LightDismissOverlayModeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    LightDismissOverlayModeProperty {
        get => this.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LightDismissOverlayModeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

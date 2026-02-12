#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IStackPanelStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStackPanelStatics4
     * @type {Guid}
     */
    static IID => Guid("{279cdd71-067b-459f-815f-ecd85c5e4843}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SpacingProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SpacingProperty {
        get => this.get_SpacingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SpacingProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

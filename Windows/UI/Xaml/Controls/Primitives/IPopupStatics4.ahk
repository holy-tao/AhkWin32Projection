#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IPopupStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPopupStatics4
     * @type {Guid}
     */
    static IID => Guid("{d1a42c06-8bfa-5164-8554-48bfe6bd4cc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlacementTargetProperty", "get_DesiredPlacementProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PlacementTargetProperty {
        get => this.get_PlacementTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DesiredPlacementProperty {
        get => this.get_DesiredPlacementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PlacementTargetProperty() {
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
    get_DesiredPlacementProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

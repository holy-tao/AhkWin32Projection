#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RoutedEvent.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementStatics8 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementStatics8
     * @type {Guid}
     */
    static IID => Guid("{17be3487-4875-4915-b0b1-a4c0f851df3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BringIntoViewRequestedEvent", "get_ContextRequestedEvent", "get_KeyTipTargetProperty", "get_KeyboardAcceleratorPlacementTargetProperty", "get_KeyboardAcceleratorPlacementModeProperty", "RegisterAsScrollPort"]

    /**
     * @type {RoutedEvent} 
     */
    BringIntoViewRequestedEvent {
        get => this.get_BringIntoViewRequestedEvent()
    }

    /**
     * @type {RoutedEvent} 
     */
    ContextRequestedEvent {
        get => this.get_ContextRequestedEvent()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyTipTargetProperty {
        get => this.get_KeyTipTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyboardAcceleratorPlacementTargetProperty {
        get => this.get_KeyboardAcceleratorPlacementTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    KeyboardAcceleratorPlacementModeProperty {
        get => this.get_KeyboardAcceleratorPlacementModeProperty()
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_BringIntoViewRequestedEvent() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {RoutedEvent} 
     */
    get_ContextRequestedEvent() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutedEvent(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeyTipTargetProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeyboardAcceleratorPlacementTargetProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_KeyboardAcceleratorPlacementModeProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {HRESULT} 
     */
    RegisterAsScrollPort(element) {
        result := ComCall(11, this, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

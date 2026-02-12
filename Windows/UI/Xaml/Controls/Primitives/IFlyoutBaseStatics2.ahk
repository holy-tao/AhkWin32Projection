#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IFlyoutBaseStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFlyoutBaseStatics2
     * @type {Guid}
     */
    static IID => Guid("{a8e913fe-2d60-4307-aad9-56b450121b58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowFocusOnInteractionProperty", "get_LightDismissOverlayModeProperty", "get_AllowFocusWhenDisabledProperty", "get_ElementSoundModeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    AllowFocusOnInteractionProperty {
        get => this.get_AllowFocusOnInteractionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LightDismissOverlayModeProperty {
        get => this.get_LightDismissOverlayModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AllowFocusWhenDisabledProperty {
        get => this.get_AllowFocusWhenDisabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ElementSoundModeProperty {
        get => this.get_ElementSoundModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AllowFocusOnInteractionProperty() {
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
    get_LightDismissOverlayModeProperty() {
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
    get_AllowFocusWhenDisabledProperty() {
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
    get_ElementSoundModeProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

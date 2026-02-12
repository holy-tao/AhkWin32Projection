#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwapChainPanelStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwapChainPanelStatics
     * @type {Guid}
     */
    static IID => Guid("{f89c0297-eea8-498c-99c4-257e3660df7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CompositionScaleXProperty", "get_CompositionScaleYProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CompositionScaleXProperty {
        get => this.get_CompositionScaleXProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CompositionScaleYProperty {
        get => this.get_CompositionScaleYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CompositionScaleXProperty() {
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
    get_CompositionScaleYProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHandwritingViewStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandwritingViewStatics2
     * @type {Guid}
     */
    static IID => Guid("{2cd052e4-d703-5183-a1be-7e285df978d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSwitchToKeyboardEnabledProperty", "get_IsCommandBarOpenProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsSwitchToKeyboardEnabledProperty {
        get => this.get_IsSwitchToKeyboardEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsCommandBarOpenProperty {
        get => this.get_IsCommandBarOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsSwitchToKeyboardEnabledProperty() {
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
    get_IsCommandBarOpenProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

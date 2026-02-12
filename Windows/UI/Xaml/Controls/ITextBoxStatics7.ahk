#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBoxStatics7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBoxStatics7
     * @type {Guid}
     */
    static IID => Guid("{cd6c6f47-147e-46f8-a4e8-749c49847a3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HandwritingViewProperty", "get_IsHandwritingViewEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HandwritingViewProperty {
        get => this.get_HandwritingViewProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsHandwritingViewEnabledProperty {
        get => this.get_IsHandwritingViewEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HandwritingViewProperty() {
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
    get_IsHandwritingViewEnabledProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

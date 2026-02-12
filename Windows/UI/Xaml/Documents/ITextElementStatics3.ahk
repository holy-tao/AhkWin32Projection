#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextElementStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextElementStatics3
     * @type {Guid}
     */
    static IID => Guid("{cfefcfaf-0fa1-45ec-9a4e-9b33664dc8b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowFocusOnInteractionProperty", "get_AccessKeyProperty", "get_ExitDisplayModeOnAccessKeyInvokedProperty"]

    /**
     * @type {DependencyProperty} 
     */
    AllowFocusOnInteractionProperty {
        get => this.get_AllowFocusOnInteractionProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AccessKeyProperty {
        get => this.get_AccessKeyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ExitDisplayModeOnAccessKeyInvokedProperty {
        get => this.get_ExitDisplayModeOnAccessKeyInvokedProperty()
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
    get_AccessKeyProperty() {
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
    get_ExitDisplayModeOnAccessKeyInvokedProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewStatics2
     * @type {Guid}
     */
    static IID => Guid("{322f8780-e812-466b-9e50-8e9fec24018a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanGoBackProperty", "get_CanGoForwardProperty", "get_DocumentTitleProperty", "get_DefaultBackgroundColorProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CanGoBackProperty {
        get => this.get_CanGoBackProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CanGoForwardProperty {
        get => this.get_CanGoForwardProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DocumentTitleProperty {
        get => this.get_DocumentTitleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DefaultBackgroundColorProperty {
        get => this.get_DefaultBackgroundColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CanGoBackProperty() {
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
    get_CanGoForwardProperty() {
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
    get_DocumentTitleProperty() {
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
    get_DefaultBackgroundColorProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

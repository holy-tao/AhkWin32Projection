#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBoxStatics7 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBoxStatics7
     * @type {Guid}
     */
    static IID => Guid("{59fa898f-f861-43da-a7ce-4b9c21d835f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentLinkForegroundColorProperty", "get_ContentLinkBackgroundColorProperty", "get_ContentLinkProvidersProperty", "get_HandwritingViewProperty", "get_IsHandwritingViewEnabledProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ContentLinkForegroundColorProperty {
        get => this.get_ContentLinkForegroundColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentLinkBackgroundColorProperty {
        get => this.get_ContentLinkBackgroundColorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentLinkProvidersProperty {
        get => this.get_ContentLinkProvidersProperty()
    }

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
    get_ContentLinkForegroundColorProperty() {
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
    get_ContentLinkBackgroundColorProperty() {
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
    get_ContentLinkProvidersProperty() {
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
    get_HandwritingViewProperty() {
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
    get_IsHandwritingViewEnabledProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

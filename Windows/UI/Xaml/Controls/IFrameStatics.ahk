#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFrameStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameStatics
     * @type {Guid}
     */
    static IID => Guid("{d5acf0e9-d967-471b-8459-c8af4341511b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CacheSizeProperty", "get_CanGoBackProperty", "get_CanGoForwardProperty", "get_CurrentSourcePageTypeProperty", "get_SourcePageTypeProperty", "get_BackStackDepthProperty"]

    /**
     * @type {DependencyProperty} 
     */
    CacheSizeProperty {
        get => this.get_CacheSizeProperty()
    }

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
    CurrentSourcePageTypeProperty {
        get => this.get_CurrentSourcePageTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SourcePageTypeProperty {
        get => this.get_SourcePageTypeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BackStackDepthProperty {
        get => this.get_BackStackDepthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CacheSizeProperty() {
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
    get_CanGoBackProperty() {
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
    get_CanGoForwardProperty() {
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
    get_CurrentSourcePageTypeProperty() {
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
    get_SourcePageTypeProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BackStackDepthProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

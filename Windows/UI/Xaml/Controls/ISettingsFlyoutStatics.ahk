#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISettingsFlyoutStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsFlyoutStatics
     * @type {Guid}
     */
    static IID => Guid("{d0e3b535-9157-4be4-a42a-f591698846ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TitleProperty", "get_HeaderBackgroundProperty", "get_HeaderForegroundProperty", "get_IconSourceProperty"]

    /**
     * @type {DependencyProperty} 
     */
    TitleProperty {
        get => this.get_TitleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderBackgroundProperty {
        get => this.get_HeaderBackgroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeaderForegroundProperty {
        get => this.get_HeaderForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IconSourceProperty {
        get => this.get_IconSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TitleProperty() {
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
    get_HeaderBackgroundProperty() {
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
    get_HeaderForegroundProperty() {
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
    get_IconSourceProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

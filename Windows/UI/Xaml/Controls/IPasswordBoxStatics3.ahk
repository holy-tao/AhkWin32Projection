#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPasswordBoxStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPasswordBoxStatics3
     * @type {Guid}
     */
    static IID => Guid("{a2cdd319-ad6a-4352-b590-f696ffcb8e3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PasswordRevealModeProperty", "get_TextReadingOrderProperty", "get_InputScopeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    PasswordRevealModeProperty {
        get => this.get_PasswordRevealModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextReadingOrderProperty {
        get => this.get_TextReadingOrderProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    InputScopeProperty {
        get => this.get_InputScopeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PasswordRevealModeProperty() {
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
    get_TextReadingOrderProperty() {
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
    get_InputScopeProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

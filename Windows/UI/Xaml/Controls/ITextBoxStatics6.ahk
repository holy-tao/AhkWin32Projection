#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBoxStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBoxStatics6
     * @type {Guid}
     */
    static IID => Guid("{dc0d97e7-1cb7-433e-aa4f-9c64c98cdee5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalTextAlignmentProperty", "get_CharacterCasingProperty", "get_PlaceholderForegroundProperty"]

    /**
     * @type {DependencyProperty} 
     */
    HorizontalTextAlignmentProperty {
        get => this.get_HorizontalTextAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CharacterCasingProperty {
        get => this.get_CharacterCasingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PlaceholderForegroundProperty {
        get => this.get_PlaceholderForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HorizontalTextAlignmentProperty() {
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
    get_CharacterCasingProperty() {
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
    get_PlaceholderForegroundProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBoxStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBoxStatics6
     * @type {Guid}
     */
    static IID => Guid("{fe40e287-82ed-4f7e-92ba-66f67bc1ff44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HorizontalTextAlignmentProperty", "get_CharacterCasingProperty", "get_DisabledFormattingAcceleratorsProperty"]

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
    DisabledFormattingAcceleratorsProperty {
        get => this.get_DisabledFormattingAcceleratorsProperty()
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
    get_DisabledFormattingAcceleratorsProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

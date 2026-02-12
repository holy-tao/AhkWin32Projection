#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlockStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlockStatics5
     * @type {Guid}
     */
    static IID => Guid("{ac9283a1-4f25-4280-8868-3eeee82821e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTextTrimmedProperty", "get_HorizontalTextAlignmentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsTextTrimmedProperty {
        get => this.get_IsTextTrimmedProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HorizontalTextAlignmentProperty {
        get => this.get_HorizontalTextAlignmentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTextTrimmedProperty() {
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
    get_HorizontalTextAlignmentProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

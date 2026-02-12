#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlockOverflowStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlockOverflowStatics
     * @type {Guid}
     */
    static IID => Guid("{041ac2f7-4f2b-43c3-a122-3fea9ca9dc87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverflowContentTargetProperty", "get_PaddingProperty", "get_HasOverflowContentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    OverflowContentTargetProperty {
        get => this.get_OverflowContentTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaddingProperty {
        get => this.get_PaddingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HasOverflowContentProperty {
        get => this.get_HasOverflowContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OverflowContentTargetProperty() {
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
    get_PaddingProperty() {
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
    get_HasOverflowContentProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

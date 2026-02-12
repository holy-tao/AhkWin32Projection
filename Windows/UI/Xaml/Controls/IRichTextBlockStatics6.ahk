#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlockStatics6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlockStatics6
     * @type {Guid}
     */
    static IID => Guid("{073057e7-91c5-5857-be7c-e72621239786}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionFlyoutProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SelectionFlyoutProperty {
        get => this.get_SelectionFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectionFlyoutProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

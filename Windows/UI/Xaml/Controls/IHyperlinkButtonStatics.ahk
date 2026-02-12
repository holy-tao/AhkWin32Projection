#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHyperlinkButtonStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHyperlinkButtonStatics
     * @type {Guid}
     */
    static IID => Guid("{fbaeb5c7-cdb7-4263-b7d6-3c0d2904ed98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NavigateUriProperty"]

    /**
     * @type {DependencyProperty} 
     */
    NavigateUriProperty {
        get => this.get_NavigateUriProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NavigateUriProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IHyperlinkStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHyperlinkStatics5
     * @type {Guid}
     */
    static IID => Guid("{59308cea-1e49-4921-bd88-a2878d07e30e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsTabStopProperty", "get_TabIndexProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsTabStopProperty {
        get => this.get_IsTabStopProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TabIndexProperty {
        get => this.get_TabIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTabStopProperty() {
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
    get_TabIndexProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

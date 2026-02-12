#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class IPageStackEntryStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPageStackEntryStatics
     * @type {Guid}
     */
    static IID => Guid("{aceff8e3-246c-4033-9f01-01cb0da5254e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourcePageTypeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    SourcePageTypeProperty {
        get => this.get_SourcePageTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SourcePageTypeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

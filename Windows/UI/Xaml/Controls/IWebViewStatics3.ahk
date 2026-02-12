#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebViewStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewStatics3
     * @type {Guid}
     */
    static IID => Guid("{129bef8a-4509-4374-b0d1-a7104d0c3a2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContainsFullScreenElementProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ContainsFullScreenElementProperty {
        get => this.get_ContainsFullScreenElementProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContainsFullScreenElementProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

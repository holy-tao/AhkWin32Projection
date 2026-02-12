#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DependencyProperty.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkElementStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkElementStatics2
     * @type {Guid}
     */
    static IID => Guid("{9695db02-c0d8-4fa2-b100-3fa2df8b9538}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestedThemeProperty"]

    /**
     * @type {DependencyProperty} 
     */
    RequestedThemeProperty {
        get => this.get_RequestedThemeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RequestedThemeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

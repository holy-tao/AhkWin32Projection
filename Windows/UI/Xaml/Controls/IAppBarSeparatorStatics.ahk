#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IAppBarSeparatorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarSeparatorStatics
     * @type {Guid}
     */
    static IID => Guid("{37f23484-5b35-4663-a75d-f2d50cb9c619}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCompactProperty"]

    /**
     * @type {DependencyProperty} 
     */
    IsCompactProperty {
        get => this.get_IsCompactProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsCompactProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

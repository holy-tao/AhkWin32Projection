#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlSourceFocusNavigationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlSourceFocusNavigationResult
     * @type {Guid}
     */
    static IID => Guid("{88d55a5f-9603-5d8f-9cc7-d1c4070d9801}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WasFocusMoved"]

    /**
     * @type {Boolean} 
     */
    WasFocusMoved {
        get => this.get_WasFocusMoved()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasFocusMoved() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

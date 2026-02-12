#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewDisplayModeChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewDisplayModeChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b7c1ad35-5544-40c1-9b33-acfe1d6c8094}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayMode"]

    /**
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

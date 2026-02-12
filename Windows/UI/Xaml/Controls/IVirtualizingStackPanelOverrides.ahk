#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IVirtualizingStackPanelOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualizingStackPanelOverrides
     * @type {Guid}
     */
    static IID => Guid("{cbe6f72c-2892-46d1-987f-58ca1081f040}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCleanUpVirtualizedItem"]

    /**
     * 
     * @param {CleanUpVirtualizedItemEventArgs} e 
     * @returns {HRESULT} 
     */
    OnCleanUpVirtualizedItem(e) {
        result := ComCall(6, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

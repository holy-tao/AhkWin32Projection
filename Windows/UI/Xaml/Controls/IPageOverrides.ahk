#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPageOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPageOverrides
     * @type {Guid}
     */
    static IID => Guid("{230b9cb8-3419-4306-aabe-4a8e680d3627}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNavigatedFrom", "OnNavigatedTo", "OnNavigatingFrom"]

    /**
     * 
     * @param {NavigationEventArgs} e 
     * @returns {HRESULT} 
     */
    OnNavigatedFrom(e) {
        result := ComCall(6, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {NavigationEventArgs} e 
     * @returns {HRESULT} 
     */
    OnNavigatedTo(e) {
        result := ComCall(7, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {NavigatingCancelEventArgs} e 
     * @returns {HRESULT} 
     */
    OnNavigatingFrom(e) {
        result := ComCall(8, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

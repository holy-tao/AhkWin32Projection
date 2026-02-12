#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IComboBoxOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComboBoxOverrides
     * @type {Guid}
     */
    static IID => Guid("{4f016541-bcfe-4a22-8932-c914981c2240}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDropDownClosed", "OnDropDownOpened"]

    /**
     * 
     * @param {IInspectable} e 
     * @returns {HRESULT} 
     */
    OnDropDownClosed(e) {
        result := ComCall(6, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} e 
     * @returns {HRESULT} 
     */
    OnDropDownOpened(e) {
        result := ComCall(7, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

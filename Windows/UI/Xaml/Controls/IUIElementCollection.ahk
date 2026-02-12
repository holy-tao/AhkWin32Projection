#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IUIElementCollection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementCollection
     * @type {Guid}
     */
    static IID => Guid("{d6602d54-88f6-43f6-85d8-a9d914a6dd3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Move"]

    /**
     * Move Method Example (VC++)
     * @param {Integer} oldIndex 
     * @param {Integer} newIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/move-method-example-vc
     */
    Move(oldIndex, newIndex) {
        result := ComCall(6, this, "uint", oldIndex, "uint", newIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

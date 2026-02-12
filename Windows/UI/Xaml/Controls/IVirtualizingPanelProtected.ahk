#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IVirtualizingPanelProtected extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualizingPanelProtected
     * @type {Guid}
     */
    static IID => Guid("{c9c9ab42-c232-479d-a7c9-5e7611196a45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddInternalChild", "InsertInternalChild", "RemoveInternalChildRange"]

    /**
     * 
     * @param {UIElement} child 
     * @returns {HRESULT} 
     */
    AddInternalChild(child) {
        result := ComCall(6, this, "ptr", child, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {UIElement} child 
     * @returns {HRESULT} 
     */
    InsertInternalChild(index, child) {
        result := ComCall(7, this, "int", index, "ptr", child, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} range 
     * @returns {HRESULT} 
     */
    RemoveInternalChildRange(index, range) {
        result := ComCall(8, this, "int", index, "int", range, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

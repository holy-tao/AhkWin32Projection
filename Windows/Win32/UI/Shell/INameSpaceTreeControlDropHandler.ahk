#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes handler methods for drag-and-drop.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-inamespacetreecontroldrophandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControlDropHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INameSpaceTreeControlDropHandler
     * @type {Guid}
     */
    static IID => Guid("{f9c665d6-c2f2-4c19-bf33-8322d7352f51}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDragEnter", "OnDragOver", "OnDragPosition", "OnDrop", "OnDropPosition", "OnDragLeave"]

    /**
     * 
     * @param {IShellItem} psiOver 
     * @param {IShellItemArray} psiaData 
     * @param {BOOL} fOutsideSource 
     * @param {Integer} grfKeyState 
     * @param {Pointer<Integer>} pdwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragenter
     */
    OnDragEnter(psiOver, psiaData, fOutsideSource, grfKeyState, pdwEffect) {
        result := ComCall(3, this, "ptr", psiOver, "ptr", psiaData, "int", fOutsideSource, "uint", grfKeyState, "uint*", pdwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiOver 
     * @param {IShellItemArray} psiaData 
     * @param {Integer} grfKeyState 
     * @param {Pointer<Integer>} pdwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragover
     */
    OnDragOver(psiOver, psiaData, grfKeyState, pdwEffect) {
        result := ComCall(4, this, "ptr", psiOver, "ptr", psiaData, "uint", grfKeyState, "uint*", pdwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiOver 
     * @param {IShellItemArray} psiaData 
     * @param {Integer} iNewPosition 
     * @param {Integer} iOldPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragposition
     */
    OnDragPosition(psiOver, psiaData, iNewPosition, iOldPosition) {
        result := ComCall(5, this, "ptr", psiOver, "ptr", psiaData, "int", iNewPosition, "int", iOldPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiOver 
     * @param {IShellItemArray} psiaData 
     * @param {Integer} iPosition 
     * @param {Integer} grfKeyState 
     * @param {Pointer<Integer>} pdwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondrop
     */
    OnDrop(psiOver, psiaData, iPosition, grfKeyState, pdwEffect) {
        result := ComCall(6, this, "ptr", psiOver, "ptr", psiaData, "int", iPosition, "uint", grfKeyState, "uint*", pdwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiOver 
     * @param {IShellItemArray} psiaData 
     * @param {Integer} iNewPosition 
     * @param {Integer} iOldPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondropposition
     */
    OnDropPosition(psiOver, psiaData, iNewPosition, iOldPosition) {
        result := ComCall(7, this, "ptr", psiOver, "ptr", psiaData, "int", iNewPosition, "int", iOldPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiOver 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragleave
     */
    OnDragLeave(psiOver) {
        result := ComCall(8, this, "ptr", psiOver, "HRESULT")
        return result
    }
}

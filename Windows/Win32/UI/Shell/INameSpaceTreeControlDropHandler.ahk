#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes handler methods for drag-and-drop.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nn-shobjidl-inamespacetreecontroldrophandler
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
     * Called on drag enter to set drag effect, as specified.
     * @remarks
     * Failing this method blocks the drag operation in the namespace tree control (NSTC).
     * @param {IShellItem} psiOver Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface representing the item underneath the mouse cursor. Optional.
     * @param {IShellItemArray} psiaData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> array containing the items being dragged.
     * @param {BOOL} fOutsideSource Type: <b>BOOL</b>
     * 
     * Specifies whether drag started outside target area.
     * @param {Integer} grfKeyState Type: <b>DWORD</b>
     * 
     * The current state of keyboard modifier keys.
     * @param {Pointer<Integer>} pdwEffect Type: <b>DWORD*</b>
     * 
     * On success, contains a pointer to the drag effect value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragenter
     */
    OnDragEnter(psiOver, psiaData, fOutsideSource, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", psiOver, "ptr", psiaData, "int", fOutsideSource, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called on drag over to set drag effect, as specified.
     * @remarks
     * Failing this method blocks the drag operation in the namespace tree control (NSTC).
     * @param {IShellItem} psiOver Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface representing the item underneath the mouse cursor. Optional.
     * @param {IShellItemArray} psiaData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> array containing the items being dragged.
     * @param {Integer} grfKeyState Type: <b>DWORD</b>
     * 
     * The current state of keyboard modifier keys.
     * @param {Pointer<Integer>} pdwEffect Type: <b>DWORD*</b>
     * 
     * On success, contains a pointer to the drag effect value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragover
     */
    OnDragOver(psiOver, psiaData, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", psiOver, "ptr", psiaData, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the item is being dragged within the same level (within the same parent folder) in the tree.
     * @remarks
     * Failing this method prevents the item rearrangement.
     * @param {IShellItem} psiOver Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface representing the item underneath the mouse cursor. Optional.
     * @param {IShellItemArray} psiaData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> array containing the items being dragged.
     * @param {Integer} iNewPosition Type: <b>int</b>
     * 
     * The index if the item being dragged is between items; otherwise, NSTCDHPOS_ONTOP (-1).
     * @param {Integer} iOldPosition Type: <b>int</b>
     * 
     * The old position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragposition
     */
    OnDragPosition(psiOver, psiaData, iNewPosition, iOldPosition) {
        result := ComCall(5, this, "ptr", psiOver, "ptr", psiaData, "int", iNewPosition, "int", iOldPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called on drop to set drop effect, as specified.
     * @remarks
     * <div class="alert"><b>Note</b>  To overwrite the default drop behavior, a client should fail this method; success proceeds with the default drop operation.</div>
     * <div> </div>
     * @param {IShellItem} psiOver Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface representing the item underneath the mouse cursor. Optional.
     * @param {IShellItemArray} psiaData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> array representing a data object.
     * @param {Integer} iPosition Type: <b>int</b>
     * 
     * Specifies drop position.
     * @param {Integer} grfKeyState Type: <b>DWORD</b>
     * 
     * The current state of keyboard modifier keys.
     * @param {Pointer<Integer>} pdwEffect Type: <b>DWORD*</b>
     * 
     * A pointer to the drop effect value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondrop
     */
    OnDrop(psiOver, psiaData, iPosition, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", psiOver, "ptr", psiaData, "int", iPosition, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called when the item is being dropped within the same level (within the same parent folder) in the tree.
     * @remarks
     * Failing this method prevents the item rearrangement from happening.
     * @param {IShellItem} psiOver Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface representing the item underneath the mouse cursor. Optional.
     * @param {IShellItemArray} psiaData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> array representing a data object.
     * @param {Integer} iNewPosition Type: <b>int</b>
     * 
     * The index if the item being dropped is between items; otherwise, NSTCDHPOS_ONTOP (-1).
     * @param {Integer} iOldPosition Type: <b>int</b>
     * 
     * Specifies old position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondropposition
     */
    OnDropPosition(psiOver, psiaData, iNewPosition, iOldPosition) {
        result := ComCall(7, this, "ptr", psiOver, "ptr", psiaData, "int", iNewPosition, "int", iOldPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called on drag leave for a specified item.
     * @param {IShellItem} psiOver Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> interface representing the item underneath the mouse cursor. Optional.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragleave
     */
    OnDragLeave(psiOver) {
        result := ComCall(8, this, "ptr", psiOver, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IShellItemArray.ahk" { IShellItemArray }

/**
 * Exposes handler methods for drag-and-drop.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontroldrophandler
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INameSpaceTreeControlDropHandler extends IUnknown {
    /**
     * The interface identifier for INameSpaceTreeControlDropHandler
     * @type {Guid}
     */
    static IID := Guid("{f9c665d6-c2f2-4c19-bf33-8322d7352f51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INameSpaceTreeControlDropHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDragEnter    : IntPtr
        OnDragOver     : IntPtr
        OnDragPosition : IntPtr
        OnDrop         : IntPtr
        OnDropPosition : IntPtr
        OnDragLeave    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INameSpaceTreeControlDropHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragenter
     */
    OnDragEnter(psiOver, psiaData, fOutsideSource, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", psiOver, "ptr", psiaData, BOOL, fOutsideSource, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragover
     */
    OnDragOver(psiOver, psiaData, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", psiOver, "ptr", psiaData, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragposition
     */
    OnDragPosition(psiOver, psiaData, iNewPosition, iOldPosition) {
        result := ComCall(5, this, "ptr", psiOver, "ptr", psiaData, "int", iNewPosition, "int", iOldPosition, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondrop
     */
    OnDrop(psiOver, psiaData, iPosition, grfKeyState, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", psiOver, "ptr", psiaData, "int", iPosition, "uint", grfKeyState, pdwEffectMarshal, pdwEffect, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondropposition
     */
    OnDropPosition(psiOver, psiaData, iNewPosition, iOldPosition) {
        result := ComCall(7, this, "ptr", psiOver, "ptr", psiaData, "int", iNewPosition, "int", iOldPosition, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-inamespacetreecontroldrophandler-ondragleave
     */
    OnDragLeave(psiOver) {
        result := ComCall(8, this, "ptr", psiOver, "HRESULT")
        return result
    }

    Query(iid) {
        if (INameSpaceTreeControlDropHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDragEnter := CallbackCreate(GetMethod(implObj, "OnDragEnter"), flags, 6)
        this.vtbl.OnDragOver := CallbackCreate(GetMethod(implObj, "OnDragOver"), flags, 5)
        this.vtbl.OnDragPosition := CallbackCreate(GetMethod(implObj, "OnDragPosition"), flags, 5)
        this.vtbl.OnDrop := CallbackCreate(GetMethod(implObj, "OnDrop"), flags, 6)
        this.vtbl.OnDropPosition := CallbackCreate(GetMethod(implObj, "OnDropPosition"), flags, 5)
        this.vtbl.OnDragLeave := CallbackCreate(GetMethod(implObj, "OnDragLeave"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDragEnter)
        CallbackFree(this.vtbl.OnDragOver)
        CallbackFree(this.vtbl.OnDragPosition)
        CallbackFree(this.vtbl.OnDrop)
        CallbackFree(this.vtbl.OnDropPosition)
        CallbackFree(this.vtbl.OnDragLeave)
    }
}

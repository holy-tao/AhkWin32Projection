#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleUndoUnit.ahk

/**
 * Enables undo units to contain child undo units.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ioleparentundounit
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleParentUndoUnit extends IOleUndoUnit{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleParentUndoUnit
     * @type {Guid}
     */
    static IID => Guid("{a1faf330-ef97-11ce-9bc9-00aa00608e01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "Add", "FindUnit", "GetParentState"]

    /**
     * Opens a new parent undo unit, which becomes part of the containing unit's undo stack.
     * @remarks
     * The specified parent unit is created and remains open. The undo manager then calls the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-add">IOleParentUndoUnit::Add</a> or <b>IOleParentUndoUnit::Open</b> methods on this parent unit to add new units to it. This parent unit receives any additional undo units until its <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-close">IOleParentUndoUnit::Close</a> method is called.
     * 
     * The parent unit specified by <i>pPUU</i> is not added to the undo stack until its <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-close">IOleParentUndoUnit::Close</a> method is called with the <i>fCommit</i> parameter set to <b>TRUE</b>.
     * 
     * The parent undo unit or undo manager must contain any undo unit given to it unless it is blocked. If it is blocked, it must return S_OK but should do nothing else.
     * @param {IOleParentUndoUnit} pPUU An <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleparentundounit">IOleParentUndoUnit</a> pointer to the parent undo unit to be opened.
     * @returns {HRESULT} This method returns S_OK if the parent undo unit was successfully opened or it is currently blocked.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleparentundounit-open
     */
    Open(pPUU) {
        result := ComCall(7, this, "ptr", pPUU, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the specified parent undo unit. (IOleParentUndoUnit.Close)
     * @remarks
     * A parent undo unit knows it is being closed when it returns S_FALSE from this method. At that time, it should terminate any communication with other objects which may be giving data to it through private interfaces.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * An error return indicates a fatal error condition.
     * 
     * The parent unit or undo manager must accept the undo unit if <i>fCommit</i> is <b>TRUE</b>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * To process a close request, a parent undo unit first checks to see if it has an open child unit. If it does not, it returns S_FALSE.
     * 
     * If it does have a child unit open, it calls the <b>IOleParentUndoUnit::Close</b> method on the child. If the child returns S_FALSE, then the parent undo unit verifies that <i>pPUU</i> points to the child unit, and closes that child undo unit. If the child returns S_OK then it handled the close internally and its parent should do nothing.
     * 
     * If the parent unit is blocked, it should check the <i>pPUU</i> parameter to determine the appropriate return code. If <i>pPUU</i> is pointing to itself, then it should return S_FALSE.
     * 
     * Otherwise, it should return S_OK; the <i>fCommit</i> parameter is ignored; and no action is taken.
     * 
     * If <i>pPUU</i> does not match the currently open parent undo unit, then implementations of this method should return E_INVALIDARG without changing any internal state. The only exception to this is if the unit is blocked.
     * @param {IOleParentUndoUnit} pPUU An <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleparentundounit">IOleParentUndoUnit</a> pointer to the currently open parent unit to be closed.
     * @param {BOOL} fCommit Indicates whether to keep or discard the unit. If <b>TRUE</b>, the unit is kept in the collection. If <b>FALSE</b>, the unit is discarded. This parameter is used to allow the client to discard an undo unit under construction if an error or a cancellation occurs.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parent undo unit did not have an open child and it was successfully closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If pPUU does not match the currently open parent undo unit, then implementations of this method should return E_INVALIDARG without changing any internal state unless the parent unit is blocked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleparentundounit-close
     */
    Close(pPUU, fCommit) {
        result := ComCall(8, this, "ptr", pPUU, "int", fCommit, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a simple undo unit to the collection.
     * @remarks
     * The parent undo unit or undo manager must accept any undo unit given to it, unless it is blocked. If it is blocked, it should do nothing but return S_OK.
     * @param {IOleUndoUnit} pUU An <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundounit">IOleUndoUnit</a> pointer to the undo unit to be added.
     * @returns {HRESULT} This method returns S_OK if the specified unit was successfully added or the parent unit was blocked.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleparentundounit-add
     */
    Add(pUU) {
        result := ComCall(9, this, "ptr", pUU, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether the specified unit is a child of this undo unit or one of its children, that is if the specified unit is part of the hierarchy in this parent unit.
     * @remarks
     * This is typically called by the undo manager in its implementation of its <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleundomanager-discardfrom">IOleUndoManager::DiscardFrom</a> method in the rare event that the unit being discarded is not a top-level unit. The parent unit should look in its own list first, then delegate to each child that is also a parent unit, as determined by doing a <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> for <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleparentundounit">IOleParentUndoUnit</a>.
     * @param {IOleUndoUnit} pUU An <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundounit">IOleUndoUnit</a> pointer to the undo unit to be found.
     * @returns {HRESULT} This method returns S_OK if the specified undo unit is in the hierarchy subordinate to this parent; otherwise, S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleparentundounit-findunit
     */
    FindUnit(pUU) {
        result := ComCall(10, this, "ptr", pUU, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves state information about the innermost open parent undo unit. (IOleParentUndoUnit.GetParentState)
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the unit has an open child, it should delegate this method to that child. If not, it should fill in <i>pdwState</i> values appropriately and return. Note that a parent unit must never be blocked while it has an open child. If this happened it could prevent the child unit from being closed, which would cause serious problems.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * When checking for a normal state, use the UAS_MASK value to mask unused bits in the <i>pdwState</i> parameter to this method for future compatibility.
     * @returns {Integer} A pointer to the state information. This information is a value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-uasflags">UASFLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleparentundounit-getparentstate
     */
    GetParentState() {
        result := ComCall(11, this, "uint*", &pdwState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwState
    }
}

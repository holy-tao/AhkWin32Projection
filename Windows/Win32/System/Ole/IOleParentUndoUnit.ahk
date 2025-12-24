#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleUndoUnit.ahk

/**
 * Enables undo units to contain child undo units.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ioleparentundounit
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
     * @param {IOleParentUndoUnit} pPUU An <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleparentundounit">IOleParentUndoUnit</a> pointer to the parent undo unit to be opened.
     * @returns {HRESULT} This method returns S_OK if the parent undo unit was successfully opened or it is currently blocked.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleparentundounit-open
     */
    Open(pPUU) {
        result := ComCall(7, this, "ptr", pPUU, "HRESULT")
        return result
    }

    /**
     * Closes the specified parent undo unit.
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
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleparentundounit-close
     */
    Close(pPUU, fCommit) {
        result := ComCall(8, this, "ptr", pPUU, "int", fCommit, "HRESULT")
        return result
    }

    /**
     * Adds a simple undo unit to the collection.
     * @param {IOleUndoUnit} pUU An <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundounit">IOleUndoUnit</a> pointer to the undo unit to be added.
     * @returns {HRESULT} This method returns S_OK if the specified unit was successfully added or the parent unit was blocked.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleparentundounit-add
     */
    Add(pUU) {
        result := ComCall(9, this, "ptr", pUU, "HRESULT")
        return result
    }

    /**
     * Indicates whether the specified unit is a child of this undo unit or one of its children, that is if the specified unit is part of the hierarchy in this parent unit.
     * @param {IOleUndoUnit} pUU An <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundounit">IOleUndoUnit</a> pointer to the undo unit to be found.
     * @returns {HRESULT} This method returns S_OK if the specified undo unit is in the hierarchy subordinate to this parent; otherwise, S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleparentundounit-findunit
     */
    FindUnit(pUU) {
        result := ComCall(10, this, "ptr", pUU, "HRESULT")
        return result
    }

    /**
     * Retrieves state information about the innermost open parent undo unit.
     * @returns {Integer} A pointer to the state information. This information is a value taken from the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ne-ocidl-uasflags">UASFLAGS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleparentundounit-getparentstate
     */
    GetParentState() {
        result := ComCall(11, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }
}

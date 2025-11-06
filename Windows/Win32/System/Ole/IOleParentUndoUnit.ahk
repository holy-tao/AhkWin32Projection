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
     * 
     * @param {IOleParentUndoUnit} pPUU 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleparentundounit-open
     */
    Open(pPUU) {
        result := ComCall(7, this, "ptr", pPUU, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOleParentUndoUnit} pPUU 
     * @param {BOOL} fCommit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleparentundounit-close
     */
    Close(pPUU, fCommit) {
        result := ComCall(8, this, "ptr", pPUU, "int", fCommit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOleUndoUnit} pUU 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleparentundounit-add
     */
    Add(pUU) {
        result := ComCall(9, this, "ptr", pUU, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOleUndoUnit} pUU 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleparentundounit-findunit
     */
    FindUnit(pUU) {
        result := ComCall(10, this, "ptr", pUU, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleparentundounit-getparentstate
     */
    GetParentState() {
        result := ComCall(11, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }
}

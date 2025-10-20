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
     * 
     * @param {Pointer<IOleParentUndoUnit>} pPUU 
     * @returns {HRESULT} 
     */
    Open(pPUU) {
        result := ComCall(7, this, "ptr", pPUU, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleParentUndoUnit>} pPUU 
     * @param {BOOL} fCommit 
     * @returns {HRESULT} 
     */
    Close(pPUU, fCommit) {
        result := ComCall(8, this, "ptr", pPUU, "int", fCommit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleUndoUnit>} pUU 
     * @returns {HRESULT} 
     */
    Add(pUU) {
        result := ComCall(9, this, "ptr", pUU, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleUndoUnit>} pUU 
     * @returns {HRESULT} 
     */
    FindUnit(pUU) {
        result := ComCall(10, this, "ptr", pUU, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwState 
     * @returns {HRESULT} 
     */
    GetParentState(pdwState) {
        result := ComCall(11, this, "uint*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

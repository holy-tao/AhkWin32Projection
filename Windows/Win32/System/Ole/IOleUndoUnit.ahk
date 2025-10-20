#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Serves as the main interface on an undo unit. An undo unit encapsulates the information necessary to undo or redo a single action.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ioleundounit
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleUndoUnit extends IUnknown{
    /**
     * The interface identifier for IOleUndoUnit
     * @type {Guid}
     */
    static IID => Guid("{894ad3b0-ef97-11ce-9bc9-00aa00608e01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOleUndoManager>} pUndoManager 
     * @returns {HRESULT} 
     */
    Do(pUndoManager) {
        result := ComCall(3, this, "ptr", pUndoManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstr 
     * @returns {HRESULT} 
     */
    GetDescription(pBstr) {
        result := ComCall(4, this, "ptr", pBstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pClsid 
     * @param {Pointer<Int32>} plID 
     * @returns {HRESULT} 
     */
    GetUnitType(pClsid, plID) {
        result := ComCall(5, this, "ptr", pClsid, "int*", plID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnNextAdd() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

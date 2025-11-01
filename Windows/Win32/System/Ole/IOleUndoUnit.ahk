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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Do", "GetDescription", "GetUnitType", "OnNextAdd"]

    /**
     * 
     * @param {IOleUndoManager} pUndoManager 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleundounit-do
     */
    Do(pUndoManager) {
        result := ComCall(3, this, "ptr", pUndoManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleundounit-getdescription
     */
    GetDescription(pBstr) {
        result := ComCall(4, this, "ptr", pBstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pClsid 
     * @param {Pointer<Integer>} plID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleundounit-getunittype
     */
    GetUnitType(pClsid, plID) {
        plIDMarshal := plID is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pClsid, plIDMarshal, plID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleundounit-onnextadd
     */
    OnNextAdd() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}

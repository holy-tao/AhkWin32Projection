#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * Instructs the undo unit to carry out its action. Note that if it contains child undo units, it must call their Do methods as well.
     * @param {IOleUndoManager} pUndoManager A pointer to the undo manager. See <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundomanager">IOleUndoManager</a>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleundounit-do
     */
    Do(pUndoManager) {
        result := ComCall(3, this, "ptr", pUndoManager, "HRESULT")
        return result
    }

    /**
     * Retrieves a description of the undo unit that can be used in the undo or redo user interface.
     * @returns {BSTR} A pointer to string that describes this undo unit.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleundounit-getdescription
     */
    GetDescription() {
        pBstr := BSTR()
        result := ComCall(4, this, "ptr", pBstr, "HRESULT")
        return pBstr
    }

    /**
     * Retrieves the CLSID and a type identifier for the undo unit.
     * @param {Pointer<Guid>} pClsid A pointer to CLSID for the undo unit.
     * @param {Pointer<Integer>} plID A pointer to the type identifier for the undo unit.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleundounit-getunittype
     */
    GetUnitType(pClsid, plID) {
        plIDMarshal := plID is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pClsid, plIDMarshal, plID, "HRESULT")
        return result
    }

    /**
     * Notifies the last undo unit in the collection that a new unit has been added.
     * @returns {HRESULT} Implementations of this method always return S_OK. The <b>HRESULT</b> return type is used only for remotability.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-ioleundounit-onnextadd
     */
    OnNextAdd() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}

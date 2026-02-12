#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Serves as the main interface on an undo unit. An undo unit encapsulates the information necessary to undo or redo a single action.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-ioleundounit
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
     * @remarks
     * The undo unit is responsible for carrying out its action. Performing its own undo action results in another action that can potentially be reversed. However, if <i>pUndoManager</i> is <b>NULL</b>, the undo unit should perform its undo action but should not attempt to put anything on the redo or undo stack.
     * 
     * If <i>pUndoManager</i> is not <b>NULL</b>, then the unit is required to put a corresponding unit on the redo or undo stack. As a result, this method either moves itself to the redo or undo stack, or it creates a new undo unit and adds it to the appropriate stack. After creating a new undo unit, this undo unit calls <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleundomanager-open">IOleUndoManager::Open</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleundomanager-add">IOleUndoManager::Add</a>. The undo manager will put the new undo unit on the undo or redo stack depending on its current state.
     * 
     * A parent unit must pass to its children the same undo manager, possibly <b>NULL</b>, that was given to the parent. It is permissible, but not necessary, when <i>pUndoManager</i> is <b>NULL</b> to open a parent unit on the redo or undo stack as long as it is not committed. A blocked parent unit ensures that nothing is added to the stack by child units.
     * 
     * If this undo unit is a parent unit, it should put itself on the redo or undo stack before calling the <b>Do</b> method on its children.
     * 
     * After calling this method, the undo manager must release the undo unit.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * See the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundomanager">IOleUndoManager</a> interface for error handling strategies for undo units. The error handling strategy affects the implementation of this method, particularly for parent units.
     * @param {IOleUndoManager} pUndoManager A pointer to the undo manager. See <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleundomanager">IOleUndoManager</a>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleundounit-do
     */
    Do(pUndoManager) {
        result := ComCall(3, this, "ptr", pUndoManager, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a description of the undo unit that can be used in the undo or redo user interface.
     * @remarks
     * All units are required to provide a user-readable description of themselves.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The <i>pbstr</i> parameter is allocated with the standard string allocator. The caller is responsible for freeing this string.
     * @returns {BSTR} A pointer to string that describes this undo unit.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleundounit-getdescription
     */
    GetDescription() {
        pBstr := BSTR()
        result := ComCall(4, this, "ptr", pBstr, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBstr
    }

    /**
     * Retrieves the CLSID and a type identifier for the undo unit.
     * @remarks
     * A parent undo unit can call this method on its child units to determine whether it can apply special handling to them. The CLSID returned can be the CLSID of the undo unit itself, of its creating object, or an arbitrary GUID. The undo unit has the option of returning CLSID_NULL, in which case the caller can make no assumptions about the type of this unit. The only requirement is that the CLSID and type identifier together uniquely identify this type of undo unit.
     * 
     * Note that the undo manager and parent undo units do not have the option of accepting or rejecting child units based on their type.
     * @param {Pointer<Guid>} pClsid A pointer to CLSID for the undo unit.
     * @param {Pointer<Integer>} plID A pointer to the type identifier for the undo unit.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleundounit-getunittype
     */
    GetUnitType(pClsid, plID) {
        plIDMarshal := plID is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pClsid, plIDMarshal, plID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the last undo unit in the collection that a new unit has been added.
     * @remarks
     * An object can create an undo unit for an action and add it to the undo manager but can continue inserting data into it through private interfaces. When the undo unit receives a call to this method, it communicates back to the creating object that the context has changed. Then, the creating object stops inserting data into the undo unit.
     * 
     * The parent undo unit calls this method on its most recently added child undo unit to notify the child unit that the context has changed and a new undo unit has been added.
     * 
     * For example, this method is used for supporting fuzzy actions, like typing, which do not have a clear point of termination but instead are terminated only when something else happens.
     * 
     * This method may not always be called if the undo manager or an open parent unit chooses to discard the unit by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> instead. Any connection which feeds data to the undo unit behind the scenes through private interfaces should not <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> the undo unit.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Note that parent units merely delegate this method to their most recently added child unit. A parent unit should terminate communication through any private interfaces when it is closed. A parent unit knows it is being closed when it receives S_FALSE from calling <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleparentundounit-close">IOleParentUndoUnit::Close</a>.
     * @returns {HRESULT} Implementations of this method always return S_OK. The <b>HRESULT</b> return type is used only for remotability.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-ioleundounit-onnextadd
     */
    OnNextAdd() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

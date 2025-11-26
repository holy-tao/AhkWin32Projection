#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables a container to control the running of its embedded objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irunnableobject
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRunnableObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRunnableObject
     * @type {Guid}
     */
    static IID => Guid("{00000126-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRunningClass", "Run", "IsRunning", "LockRunning", "SetContainedObject"]

    /**
     * Retrieves the CLSID of a running object.
     * @returns {Guid} A pointer to the object's class identifier.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunnableobject-getrunningclass
     */
    GetRunningClass() {
        lpClsid := Guid()
        result := ComCall(3, this, "ptr", lpClsid, "HRESULT")
        return lpClsid
    }

    /**
     * Forces an object to run.
     * @param {IBindCtx} pbc A pointer to the binding context of the run operation. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunnableobject-run
     */
    Run(pbc) {
        result := ComCall(4, this, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * Determines whether an object is currently in the running state.
     * @returns {BOOL} If the object is in the running state, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunnableobject-isrunning
     */
    IsRunning() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Locks an already running object into its running state or unlocks it from its running state.
     * @param {BOOL} fLock <b>TRUE</b> locks the object into its running state. <b>FALSE</b> unlocks the object from its running state.
     * @param {BOOL} fLastUnlockCloses <b>TRUE</b> specifies that if the connection being released is the last external lock on the object, the object should close. <b>FALSE</b> specifies that the object should remain open until closed by the user or another process.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunnableobject-lockrunning
     */
    LockRunning(fLock, fLastUnlockCloses) {
        result := ComCall(6, this, "int", fLock, "int", fLastUnlockCloses, "HRESULT")
        return result
    }

    /**
     * Notifies an object that it is embedded in an OLE container, which ensures that reference counting is done correctly for containers that support links to embedded objects.
     * @param {BOOL} fContained <b>TRUE</b> specifies that the object is contained in an OLE container. <b>FALSE</b> indicates that it is not.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irunnableobject-setcontainedobject
     */
    SetContainedObject(fContained) {
        result := ComCall(7, this, "int", fContained, "HRESULT")
        return result
    }
}

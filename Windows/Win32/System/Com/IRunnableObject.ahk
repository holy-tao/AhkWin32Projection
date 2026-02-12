#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables a container to control the running of its embedded objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-irunnableobject
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
     * @remarks
     * If an embedded document was created by an application that is not available on the user's computer, the document, by a call to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cotreatasclass">CoTreatAsClass</a>, may be able to display itself for editing by emulating a class that is supported on the user's machine. In this case, the CLSID returned by a call to <b>IRunnableObject::GetRunningClass</b> will be that of the class being emulated, rather than the document's native class.
     * @returns {Guid} A pointer to the object's class identifier.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irunnableobject-getrunningclass
     */
    GetRunningClass() {
        lpClsid := Guid()
        result := ComCall(3, this, "ptr", lpClsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpClsid
    }

    /**
     * Forces an object to run.
     * @remarks
     * Containers call <b>IRunnableObject::Run</b> to force their objects to enter the running state. If the object is not already running, calling <b>Run</b> can be an expensive operation, on the order of many seconds. If the object is already running, then this method has no effect on the object.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * When called on a linked object that has been converted to a new class since the link was last activated, <b>IRunnableObject::Run</b> may return OLE_E_CLASSDIFF. In this case, the client should call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindtosource">IOleLink::BindToSource</a>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olerun">OleRun</a> is a helper function that conveniently repackages the functionality offered by <b>IRunnableObject::Run</b>. With the release of OLE 2.01, the implementation of <b>OleRun</b> was changed so that it calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>, asks for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunnableobject">IRunnableObject</a>, and then calls <b>IRunnableObject::Run</b>. In other words, you can use the interface and the helper function interchangeably.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The object should register in the running object table if it has a moniker assigned. The object should not hold any strong locks on itself; instead, it should remain in the unstable, unlocked state. The object should be locked when the first external connection is made to the object.
     * 
     * An embedded object must hold a lock on its embedding container while it is in the running state. The default handler provided by OLE 2 takes care of locking the embedding container on behalf of objects implemented by an EXE object application. Objects implemented by a DLL object application must explicitly put a lock on their embedding containers, which they do by first calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleclientsite-getcontainer">IOleClientSite::GetContainer</a> to get a pointer to the container, then calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecontainer-lockcontainer">IOleContainer::LockContainer</a> to actually place the lock. This lock must be released when <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> is called.
     * @param {IBindCtx} pbc A pointer to the binding context of the run operation. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irunnableobject-run
     */
    Run(pbc) {
        result := ComCall(4, this, "ptr", pbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether an object is currently in the running state.
     * @remarks
     * A container application could call <b>IRunnableObject::IsRunning</b> when it needs to know if the server is immediately available. For example, a container's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a> method would return an error if the server is not running and the bindspeed parameter specifies BINDSPEED_IMMEDIATE.
     * 
     * An object handler could call <b>IRunnableObject::IsRunning</b> when it wants to avoid conflicts with a running server or when the running server might have more up-to-date information. For example, a handler's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getextent">IOleObject::GetExtent</a> would delegate to the object server if it is running, because the server's information might be more current than that in the handler's cache.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleisrunning">OleIsRunning</a> is a helper function that conveniently repackages the functionality offered by <b>IRunnableObject::IsRunning</b>. With the release of OLE 2.01, the implementation of <b>OleIsRunning</b> was changed so that it calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>, asks for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunnableobject">IRunnableObject</a>, and then calls <b>IRunnableObject::IsRunning</b>. In other words, you can use the interface and the helper function interchangeably.
     * @returns {BOOL} If the object is in the running state, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irunnableobject-isrunning
     */
    IsRunning() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Locks an already running object into its running state or unlocks it from its running state. (IRunnableObject.LockRunning)
     * @remarks
     * Most implementations of <b>IRunnableObject::LockRunning</b> call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-colockobjectexternal">CoLockObjectExternal</a>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olelockrunning">OleLockRunning</a> is a helper function that conveniently repackages the functionality offered by <b>IRunnableObject::LockRunning</b>. With the release of OLE 2.01, the implementation of <b>OleLockRunning</b> was changed to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>, ask for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunnableobject">IRunnableObject</a>, and then call <b>IRunnableObject::LockRunning</b>. In other words, you can use the interface and the helper function interchangeably.
     * @param {BOOL} fLock <b>TRUE</b> locks the object into its running state. <b>FALSE</b> unlocks the object from its running state.
     * @param {BOOL} fLastUnlockCloses <b>TRUE</b> specifies that if the connection being released is the last external lock on the object, the object should close. <b>FALSE</b> specifies that the object should remain open until closed by the user or another process.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irunnableobject-lockrunning
     */
    LockRunning(fLock, fLastUnlockCloses) {
        result := ComCall(6, this, "int", fLock, "int", fLastUnlockCloses, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies an object that it is embedded in an OLE container, which ensures that reference counting is done correctly for containers that support links to embedded objects. (IRunnableObject.SetContainedObject)
     * @remarks
     * The <b>SetContainedObject</b> method enables a container to inform an object handler that it is embedded in the container, rather than acting as a link. This call changes the container's reference on the object from strong, the default for external connections, to weak. When the object is running visibly, this method is of little significance because the end user has a lock on the object. During a silent update of an embedded link source, however, the container should not be able to hold an object in the running state after the link has been broken. For this reason, the container's reference to the object must be weak.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A container application must call <b>SetContainedObject</b> if it supports linking to embedded objects. It normally makes the call immediately after calling <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleload">OleLoad</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreate">OleCreate</a> and never calls the method again, even before it closes. Moreover, a container almost always calls this method with <i>fContained</i> set to <b>TRUE</b>. The use of this method with <i>fContained</i> set to <b>FALSE</b> is rare.
     * 
     * Calling <b>SetContainedObject</b> is optional only when you know that the embedded object will not be referenced by any client other than the container. If your container application does not support linking to embedded objects; it is preferable, but not necessary, to call <b>SetContainedObject</b>.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetcontainedobject">OleSetContainedObject</a> is a helper function that conveniently repackages the functionality offered by <b>SetContainedObject</b>. With the release of OLE 2.01, the implementation of <b>OleSetContainedObject</b> was changed to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>, ask for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunnableobject">IRunnableObject</a>, and then call <b>IRunnableObject::SetContainedObject</b>. In other words, you can use the interface and the helper function interchangeably.
     * @param {BOOL} fContained <b>TRUE</b> specifies that the object is contained in an OLE container. <b>FALSE</b> indicates that it is not.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irunnableobject-setcontainedobject
     */
    SetContainedObject(fContained) {
        result := ComCall(7, this, "int", fContained, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

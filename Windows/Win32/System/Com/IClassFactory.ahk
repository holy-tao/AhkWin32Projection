#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The IClassFactory interface enables a class of objects to be created.
 * @see https://learn.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iclassfactory
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClassFactory
     * @type {Guid}
     */
    static IID => Guid("{00000001-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "LockServer"]

    /**
     * Creates an uninitialized object.
     * @remarks
     * A COM server's implementation of <b>CreateInstance</b> must return a reference to an object contained in an apartment that belongs to the server's DCOM resolver. It must not return a reference to an object that is contained in a remote apartment.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface is always on a class object. The <b>CreateInstance</b> method creates an uninitialized object of the class identified with the specified CLSID. When an object is created in this way, the CLSID must be registered in the system registry with the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a> function.
     * 
     * The <i>pUnkOuter</i> parameter indicates whether the object is being created as part of an aggregate. Object definitions are not required to support aggregation - they must be specifically designed and implemented to support it.
     * 
     * The <i>riid</i> parameter specifies the IID (interface identifier) of the interface through which you will communicate with the new object. If <i>pUnkOuter</i> is non-<b>NULL</b> (indicating aggregation), the value of the riid parameter must be IID_IUnknown. If the object is not part of an aggregate, riid often specifies the interface though which the object will be initialized.
     * 
     * For OLE embeddings, the initialization interface is <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a>, but in other situations, other interfaces are used. To initialize the object, there must be a subsequent call to an appropriate method in the initializing interface. Common initialization functions include <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-initnew">IPersistStorage::InitNew</a> (for new, blank embeddable components), <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a> (for reloaded embeddable components), <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-load">IPersistStream::Load</a>, (for objects stored in a stream object) or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a> (for objects stored in a file).
     * 
     * In general, if an application supports only one class of objects, and the class object is registered for single use, only one object can be created. The application must not create other objects, and a request to do so should return an error from <b>IClassFactory::CreateInstance</b>. The same is true for applications that support multiple classes, each with a class object registered for single use; a call to <b>CreateInstance</b> for one class followed by a call to <b>CreateInstance</b> for any of the classes that should return an error.
     * 
     * To avoid returning an error, applications that support multiple classes with single-use class objects can revoke the registered class object of the first class by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> when a request for instantiating a second is received. For example, suppose there are two classes, A and B. When <b>CreateInstance</b> is called for class A, revoke the class object for B. When B is created, revoke the class object for A. This solution complicates shutdown because one of the class objects might have already been revoked (and cannot be revoked twice).
     * @param {IUnknown} pUnkOuter If the object is being created as part of an aggregate, specify a pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate. Otherwise, this parameter must be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the newly created object. If <i>pUnkOuter</i> is <b>NULL</b>, this parameter is generally the IID of the initializing interface; if <i>pUnkOuter</i> is non-<b>NULL</b>, <i>riid</i> must be IID_IUnknown.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObject</i> contains the requested interface pointer. If the object does not support the interface specified in <i>riid</i>, the implementation must set *<i>ppvObject</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iclassfactory-createinstance
     */
    CreateInstance(pUnkOuter, riid) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * The IClassFactory::LockServer method locks an object application open in memory. This enables instances to be created more quickly.
     * @remarks
     * <b>IClassFactory::LockServer</b> controls whether an object's server is kept in memory. Keeping the application alive in memory allows instances to be created more quickly.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Most clients do not need to call this method. It is provided only for those clients that require special performance in creating multiple instances of their objects.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the lock count is zero, there are no more objects in use, and the application is not under user control, the server can be closed. One way to implement <b>LockServer</b> is to call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-colockobjectexternal">CoLockObjectExternal</a> function.
     * 
     * The process that locks the object application is responsible for unlocking it. After the class object is released, there is no mechanism that guarantees the caller connection to the same class later (as in the case where a class object is registered as single-use). It is important to count all calls, not just the last one, to <b>LockServer</b>, because calls must be balanced before attempting to release the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface on the class object or an error results. For every call to <b>LockServer</b> with <i>fLock</i> set to <b>TRUE</b>, there must be a call to <b>LockServer</b> with <i>fLock</i> set to <b>FALSE</b>. When the lock count and the class object reference count are both zero, the class object can be freed.
     * @param {BOOL} fLock If <b>TRUE</b>, increments the lock count; if <b>FALSE</b>, decrements the lock count.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iclassfactory-lockserver
     */
    LockServer(fLock) {
        result := ComCall(4, this, "int", fLock, "HRESULT")
        return result
    }
}

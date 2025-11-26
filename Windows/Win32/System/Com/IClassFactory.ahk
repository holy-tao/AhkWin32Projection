#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables a class of objects to be created.
 * @see https://docs.microsoft.com/windows/win32/api//unknwnbase/nn-unknwnbase-iclassfactory
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
     * @param {IUnknown} pUnkOuter If the object is being created as part of an aggregate, specify a pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate. Otherwise, this parameter must be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the newly created object. If <i>pUnkOuter</i> is <b>NULL</b>, this parameter is generally the IID of the initializing interface; if <i>pUnkOuter</i> is non-<b>NULL</b>, <i>riid</i> must be IID_IUnknown.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObject</i> contains the requested interface pointer. If the object does not support the interface specified in <i>riid</i>, the implementation must set *<i>ppvObject</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//unknwn/nf-unknwn-iclassfactory-createinstance
     */
    CreateInstance(pUnkOuter, riid) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Locks an object application open in memory. This enables instances to be created more quickly.
     * @param {BOOL} fLock If <b>TRUE</b>, increments the lock count; if <b>FALSE</b>, decrements the lock count.
     * @returns {HRESULT} This method can return the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//unknwnbase/nf-unknwnbase-iclassfactory-lockserver
     */
    LockServer(fLock) {
        result := ComCall(4, this, "int", fLock, "HRESULT")
        return result
    }
}

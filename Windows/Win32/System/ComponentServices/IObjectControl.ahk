#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines context-specific initialization and cleanup procedures for your COM+ objects, and specifies whether the objects can be recycled.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontrol
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectControl
     * @type {Guid}
     */
    static IID => Guid("{51372aec-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The class identifier for ObjectControl
     * @type {Guid}
     */
    static CLSID => Guid("{7dc41850-0c31-11d0-8b79-00aa00b8a790}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "CanBePooled"]

    /**
     * Enables a COM+ object to perform context-specific initialization whenever it is activated.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontrol-activate
     */
    Activate() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Enables a COM+ object to perform required cleanup before it is recycled or destroyed.
     * @remarks
     * 
     * The COM+ run-time environment calls the <b>Deactivate</b> method whenever an object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> interface is deactivated. An object is deactivated when it returns from a method in which the method called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setabort">SetAbort</a>, when the transaction in which it executed is committed or aborted, or when the last client to hold a reference on the object releases its reference.
     * 
     * If the component supports recycling (returns <b>TRUE</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontrol-canbepooled">CanBePooled</a> method), you must use the <b>Deactivate</b> method to reset the object's state to the state in which the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontrol-activate">Activate</a> method expects to find it. You can also use the <b>Deactivate</b> method to release the object's context or to do other context-specific cleanup. Even if an object supports recycling, it can be beneficial to release certain reusable resources in its <b>Deactivate</b> method. For example, ODBC provides its own connection pooling. It is more efficient to pool a database connection in a general connection pool where other objects can use it than it is to keep it tied to a specific object in an object pool.
     * 
     * 
     * 
     * COM+ expressly forbids calling into an object that exposes <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> after the deactivate method has returned (when it is in its destructor). Such a call would result in an RPC_E_DISCONNECTED error. For example, if an object has passed out a reference to itself and then calls back into the object after <b>Deactivate</b> has returned, a disconnected error results.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontrol-deactivate
     */
    Deactivate() {
        ComCall(4, this)
    }

    /**
     * Notifies the COM+ run-time environment whether the object can be pooled for reuse when it is deactivated.
     * @returns {BOOL} If the object can be pooled for reuse, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontrol-canbepooled
     */
    CanBePooled() {
        result := ComCall(5, this, "int")
        return result
    }
}

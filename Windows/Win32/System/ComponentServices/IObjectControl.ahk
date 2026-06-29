#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines context-specific initialization and cleanup procedures for your COM+ objects, and specifies whether the objects can be recycled.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjectcontrol
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjectControl extends IUnknown {
    /**
     * The interface identifier for IObjectControl
     * @type {Guid}
     */
    static IID := Guid("{51372aec-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The class identifier for ObjectControl
     * @type {Guid}
     */
    static CLSID := Guid("{7dc41850-0c31-11d0-8b79-00aa00b8a790}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate    : IntPtr
        Deactivate  : IntPtr
        CanBePooled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables a COM+ object to perform context-specific initialization whenever it is activated. (IObjectControl.Activate)
     * @remarks
     * Whenever a client calls a COM+ object that isn't already active, the COM+ run-time environment automatically activates the object. This is called <a href="https://docs.microsoft.com/windows/desktop/cossdk/com--just-in-time-activation">Just-in-Time Activation</a>. For components that support <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> as an interface, COM+ invokes the object's <b>Activate</b> method before passing the client's method call on to the object.
     * 
     * Any context-specific initialization procedures should be implemented in the <b>Activate</b> method for objects that expose <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a>.
     * 
     * For example, you can use the <b>Activate</b> method to obtain a reference to an object's context and store it in a member variable. Then the object context is available to any method that requires it, and you do not have to acquire a new one every time you want to use it. After you have a reference to the object's context, you can use the <b>IObjectControl</b> methods to check whether security is enabled, whether the object is executing in a transaction, or whether the caller is in a particular role.
     * 
     * If you are enabling object recycling (by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontrol-canbepooled">CanBePooled</a> method to query the object), the <b>Activate</b> method must be able to handle both newly created and recycled objects. When the <b>Activate</b> method returns, there should be no distinguishable difference between a new object and a recycled one.
     * 
     * COM+ expressly forbids calling into an object that exposes <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> before calling the <b>Activate</b> method (when it is in its constructor). Such a call would result in an RPC_E_DISCONNECTED error. For example, if an object passes out a reference to itself while in its constructor and then the reference calls back into that object prior to the call to <b>Activate</b>, the disconnected error is returned.
     * 
     * 
     * 
     * You can also use the <b>Activate</b> method to obtain a reference to the object's <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-isecurityproperty">ISecurityProperty</a> interface and check the security ID of the object's creator before any methods are called.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontrol-activate
     */
    Activate() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Enables a COM+ object to perform required cleanup before it is recycled or destroyed.
     * @remarks
     * The COM+ run-time environment calls the <b>Deactivate</b> method whenever an object that supports the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> interface is deactivated. An object is deactivated when it returns from a method in which the method called <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setcomplete">SetComplete</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontext-setabort">SetAbort</a>, when the transaction in which it executed is committed or aborted, or when the last client to hold a reference on the object releases its reference.
     * 
     * If the component supports recycling (returns <b>TRUE</b> from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontrol-canbepooled">CanBePooled</a> method), you must use the <b>Deactivate</b> method to reset the object's state to the state in which the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontrol-activate">Activate</a> method expects to find it. You can also use the <b>Deactivate</b> method to release the object's context or to do other context-specific cleanup. Even if an object supports recycling, it can be beneficial to release certain reusable resources in its <b>Deactivate</b> method. For example, ODBC provides its own connection pooling. It is more efficient to pool a database connection in a general connection pool where other objects can use it than it is to keep it tied to a specific object in an object pool.
     * 
     * 
     * 
     * COM+ expressly forbids calling into an object that exposes <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontrol">IObjectControl</a> after the deactivate method has returned (when it is in its destructor). Such a call would result in an RPC_E_DISCONNECTED error. For example, if an object has passed out a reference to itself and then calls back into the object after <b>Deactivate</b> has returned, a disconnected error results.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontrol-deactivate
     */
    Deactivate() {
        ComCall(4, this)
    }

    /**
     * Notifies the COM+ run-time environment whether the object can be pooled for reuse when it is deactivated.
     * @remarks
     * When an object returns <b>TRUE</b> from the <b>CanBePooled</b> method, it indicates to the COM+ run-time environment that it can be added to an object pool after deactivation rather than being destroyed. Whenever an instance is required, one is drawn from the pool rather than created.
     * 
     * 
     * 
     * Returning <b>TRUE</b> from the <b>CanBePooled</b> method does not guarantee that objects will be recycled; it only gives the COM+ run-time environment permission to recycle them. Returning <b>FALSE</b> from the <b>CanBePooled</b> method guarantees that instances of a component are not recycled.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontrol-activate">Activate</a> method is called if a new instance is created or if a recycled instance is drawn from the pool. Similarly, the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iobjectcontrol-deactivate">Deactivate</a> method is called every time the object is deactivated, whether it is being destroyed or returned to the pool for recycling.
     * @returns {BOOL} If the object can be pooled for reuse, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontrol-canbepooled
     */
    CanBePooled() {
        result := ComCall(5, this, BOOL)
        return result
    }

    Query(iid) {
        if (IObjectControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 1)
        this.vtbl.Deactivate := CallbackCreate(GetMethod(implObj, "Deactivate"), flags, 1)
        this.vtbl.CanBePooled := CallbackCreate(GetMethod(implObj, "CanBePooled"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Activate)
        CallbackFree(this.vtbl.Deactivate)
        CallbackFree(this.vtbl.CanBePooled)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFunctionInstance.ahk" { IFunctionInstance }

/**
 * This interface is implemented to create and initialize objects to provide a specified access interface to a resource represented by the function instance. After the object is created, the Initialize method is called to initialize the object.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryserviceprovider
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IFunctionDiscoveryServiceProvider extends IUnknown {
    /**
     * The interface identifier for IFunctionDiscoveryServiceProvider
     * @type {Guid}
     */
    static IID := Guid("{4c81ed02-1b04-43f2-a451-69966cbcd1c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFunctionDiscoveryServiceProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFunctionDiscoveryServiceProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an object that provides a specific interface that has been bound to the resource represented by the function instance.
     * @remarks
     * Any error code indicates failure. The provider should return an appropriate error code if it is unable to create the desired object.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface that represents the underlying resource.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the object.
     * @returns {Pointer<Void>} The interface pointer requested in <i>riid</i>. Upon successful return, <i>*ppv</i> contains the requested interface pointer. Upon failure, <i>*ppv</i> contains <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryserviceprovider-initialize
     */
    Initialize(pIFunctionInstance, riid) {
        result := ComCall(3, this, "ptr", pIFunctionInstance, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IFunctionDiscoveryServiceProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}

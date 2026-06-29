#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfFunction.ahk" { ITfFunction }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\TfSapiObject.ahk" { TfSapiObject }

/**
 * The ITfFnGetSAPIObject interface is implemented by the Speech API (SAPI) text service. This interface is used by the TSF manager or a client (application or other text service) to obtain various SAPI objects.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffngetsapiobject
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnGetSAPIObject extends ITfFunction {
    /**
     * The interface identifier for ITfFnGetSAPIObject
     * @type {Guid}
     */
    static IID := Guid("{5c0ab7ea-167d-4f59-bfb5-4693755e90ca}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnGetSAPIObject interfaces
    */
    struct Vtbl extends ITfFunction.Vtbl {
        Get : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnGetSAPIObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnGetSAPIObject::Get method
     * @param {TfSapiObject} sObj Contains a <a href="https://docs.microsoft.com/windows/win32/api/ctffunc/ne-ctffunc-tfsapiobject">TfSapiObject</a> value that specifies the SAPI object to obtain.
     * @returns {IUnknown} Pointer to an <b>IUnknown</b> interface pointer that receives the requested SAPI object. The caller must release this interface when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffngetsapiobject-get
     */
    Get(sObj) {
        result := ComCall(4, this, TfSapiObject, sObj, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (ITfFnGetSAPIObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Get := CallbackCreate(GetMethod(implObj, "Get"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Get)
    }
}

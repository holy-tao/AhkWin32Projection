#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUnsecuredApartment interface is used to simplify the process of making asynchronous calls from a client process.
 * @remarks
 * <b>IUnsecuredApartment</b> allows WMI to create a separate process to handle callbacks. Using this interface creates security risks, as described in <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/setting-security-on-an-asynchronous-call">Setting Security on an Asynchronous Call</a>. Semisynchronous access or performing access checks are recommended instead of asynchronous calls. For more information and an example of using <b>IUnsecuredApartment</b>, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/lowering-the-security-for-a-sink-in-a-separate-process">Lowering the Security for a Sink in a Separate Process</a>. Use <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemunsecuredapartment">IWbemUnsecuredApartment::CreateSinkStub</a> for a more secure approach.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iunsecuredapartment
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IUnsecuredApartment extends IUnknown {
    /**
     * The interface identifier for IUnsecuredApartment
     * @type {Guid}
     */
    static IID := Guid("{1cfaba8c-1523-11d1-ad79-00c04fd8fdff}")

    /**
     * The class identifier for UnsecuredApartment
     * @type {Guid}
     */
    static CLSID := Guid("{49bd2028-1523-11d1-ad79-00c04fd8fdff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUnsecuredApartment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateObjectStub : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUnsecuredApartment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateObjectStub method creates an object forwarder sink to assist in receiving asynchronous calls from Windows Management.
     * @remarks
     * <div class="alert"><b>Note</b>  Because the call-back to the sink might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.</div>
     * <div> </div>
     * @param {IUnknown} pObject Pointer to the client's in-process implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>.
     * @returns {IUnknown} Receives a pointer to a substitute object to be used in asynchronous 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> calls. The user receives an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer and must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for <b>IID_WbemObjectSink</b> before using this object in asynchronous 
     * <b>IWbemServices</b> calls.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iunsecuredapartment-createobjectstub
     */
    CreateObjectStub(pObject) {
        result := ComCall(3, this, "ptr", pObject, "ptr*", &ppStub := 0, "HRESULT")
        return IUnknown(ppStub)
    }

    Query(iid) {
        if (IUnsecuredApartment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateObjectStub := CallbackCreate(GetMethod(implObj, "CreateObjectStub"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateObjectStub)
    }
}

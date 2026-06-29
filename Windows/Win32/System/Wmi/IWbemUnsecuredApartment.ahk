#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnsecuredApartment.ahk" { IUnsecuredApartment }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemObjectSink.ahk" { IWbemObjectSink }

/**
 * Allows client applications to determine whether Unsecapp.exe performs access checks on asynchronous callbacks.
 * @remarks
 * <b>IWbemUnsecuredApartment</b> is similar to 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iunsecuredapartment">IUnsecuredApartment</a>, which also creates a sink in a 
 *      separate process. For more information, see 
 *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/performing-access-checks">Performing Access Checks</a>.
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>WBEM</b>&#92;<b>CIMOM</b>&#92;<b>UnsecAppAccessControlDefault</b>
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemunsecuredapartment
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemUnsecuredApartment extends IUnsecuredApartment {
    /**
     * The interface identifier for IWbemUnsecuredApartment
     * @type {Guid}
     */
    static IID := Guid("{31739d04-3471-4cf4-9a7c-57a44ae71956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemUnsecuredApartment interfaces
    */
    struct Vtbl extends IUnsecuredApartment.Vtbl {
        CreateSinkStub : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemUnsecuredApartment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateSinkStub method is similar to the IUnsecuredApartment::CreateObjectStub and creates an object forwarder sink and performs access checks for receiving asynchronous calls from Windows Management.
     * @remarks
     * This method is provided to improve the security of asynchronous calls 
     *     from client applications. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/setting-security-on-an-asynchronous-call">Setting Security on an Asynchronous Call</a>.
     * @param {IWbemObjectSink} pSink Pointer to the client's in-process implementation of 
     *       <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>.
     * @param {Integer} dwFlags 
     * @param {PWSTR} wszReserved Reserved.
     * @returns {IWbemObjectSink} Receives a pointer to a substitute object to be used in asynchronous 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> calls. The user receives an 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer and must call 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for 
     *       <b>IID_WbemObjectSink</b> before using this object in asynchronous 
     *       <b>IWbemServices</b> calls.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemunsecuredapartment-createsinkstub
     */
    CreateSinkStub(pSink, dwFlags, wszReserved) {
        wszReserved := wszReserved is String ? StrPtr(wszReserved) : wszReserved

        result := ComCall(4, this, "ptr", pSink, "uint", dwFlags, "ptr", wszReserved, "ptr*", &ppStub := 0, "HRESULT")
        return IWbemObjectSink(ppStub)
    }

    Query(iid) {
        if (IWbemUnsecuredApartment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSinkStub := CallbackCreate(GetMethod(implObj, "CreateSinkStub"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSinkStub)
    }
}

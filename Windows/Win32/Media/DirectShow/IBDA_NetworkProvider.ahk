#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_NetworkProvider interface is implemented on a Network Provider filter. It provides methods that BDA device filters call to register themselves after they are added to the graph.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_NetworkProvider)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_networkprovider
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_NetworkProvider extends IUnknown {
    /**
     * The interface identifier for IBDA_NetworkProvider
     * @type {Guid}
     */
    static IID := Guid("{fd501041-8ebe-11ce-8183-00aa00577da2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_NetworkProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PutSignalSource        : IntPtr
        GetSignalSource        : IntPtr
        GetNetworkType         : IntPtr
        PutTuningSpace         : IntPtr
        GetTuningSpace         : IntPtr
        RegisterDeviceFilter   : IntPtr
        UnRegisterDeviceFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_NetworkProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The PutSignalSource method specifies the signal source.
     * @param {Integer} ulSignalSource Specifies the signal source.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-putsignalsource
     */
    PutSignalSource(ulSignalSource) {
        result := ComCall(3, this, "uint", ulSignalSource, "HRESULT")
        return result
    }

    /**
     * The GetSignalSource method retrieves the signal source.
     * @param {Pointer<Integer>} pulSignalSource Receives a value specifying the signal source.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-getsignalsource
     */
    GetSignalSource(pulSignalSource) {
        pulSignalSourceMarshal := pulSignalSource is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulSignalSourceMarshal, pulSignalSource, "HRESULT")
        return result
    }

    /**
     * The GetNetworkType method retrieves the network type.
     * @param {Pointer<Guid>} pguidNetworkType Receives a GUID specifying the network type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-getnetworktype
     */
    GetNetworkType(pguidNetworkType) {
        result := ComCall(5, this, Guid.Ptr, pguidNetworkType, "HRESULT")
        return result
    }

    /**
     * The PutTuningSpace method specifies the tuning space.
     * @param {Pointer<Guid>} guidTuningSpace Specifies the tuning space.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-puttuningspace
     */
    PutTuningSpace(guidTuningSpace) {
        result := ComCall(6, this, Guid.Ptr, guidTuningSpace, "HRESULT")
        return result
    }

    /**
     * The GetTuningSpace method retrieves the tuning space.
     * @param {Pointer<Guid>} pguidTuingSpace Receives a GUID specifying the tuning space.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-gettuningspace
     */
    GetTuningSpace(pguidTuingSpace) {
        result := ComCall(7, this, Guid.Ptr, pguidTuingSpace, "HRESULT")
        return result
    }

    /**
     * The RegisterDeviceFilter method is called by a BDA device filter to register itself in the filter graph.
     * @param {IUnknown} pUnkFilterControl Pointer to the filter's <b>IUnknown</b> interface.
     * @param {Pointer<Integer>} ppvRegisitrationContext Pointer that receives the registration context. The filter should store this value and return it in the call to <b>UnRegisterDeviceFilter</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-registerdevicefilter
     */
    RegisterDeviceFilter(pUnkFilterControl, ppvRegisitrationContext) {
        ppvRegisitrationContextMarshal := ppvRegisitrationContext is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pUnkFilterControl, ppvRegisitrationContextMarshal, ppvRegisitrationContext, "HRESULT")
        return result
    }

    /**
     * The UnRegisterDeviceFilter method is called by BDA device filters when they are removed from the filter graph.
     * @param {Integer} pvRegistrationContext The registration context that the filter received in the call to <b>RegisterDeviceFilter</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-unregisterdevicefilter
     */
    UnRegisterDeviceFilter(pvRegistrationContext) {
        result := ComCall(9, this, "uint", pvRegistrationContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_NetworkProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PutSignalSource := CallbackCreate(GetMethod(implObj, "PutSignalSource"), flags, 2)
        this.vtbl.GetSignalSource := CallbackCreate(GetMethod(implObj, "GetSignalSource"), flags, 2)
        this.vtbl.GetNetworkType := CallbackCreate(GetMethod(implObj, "GetNetworkType"), flags, 2)
        this.vtbl.PutTuningSpace := CallbackCreate(GetMethod(implObj, "PutTuningSpace"), flags, 2)
        this.vtbl.GetTuningSpace := CallbackCreate(GetMethod(implObj, "GetTuningSpace"), flags, 2)
        this.vtbl.RegisterDeviceFilter := CallbackCreate(GetMethod(implObj, "RegisterDeviceFilter"), flags, 3)
        this.vtbl.UnRegisterDeviceFilter := CallbackCreate(GetMethod(implObj, "UnRegisterDeviceFilter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PutSignalSource)
        CallbackFree(this.vtbl.GetSignalSource)
        CallbackFree(this.vtbl.GetNetworkType)
        CallbackFree(this.vtbl.PutTuningSpace)
        CallbackFree(this.vtbl.GetTuningSpace)
        CallbackFree(this.vtbl.RegisterDeviceFilter)
        CallbackFree(this.vtbl.UnRegisterDeviceFilter)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSDMessageParameters.ahk" { IWSDMessageParameters }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WSD_SOAP_MESSAGE.ahk" { WSD_SOAP_MESSAGE }

/**
 * Is implemented by the client program to receive callback notifications from IWSDiscoveryPublisher.
 * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nn-wsddisco-iwsdiscoverypublishernotify
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDiscoveryPublisherNotify extends IUnknown {
    /**
     * The interface identifier for IWSDiscoveryPublisherNotify
     * @type {Guid}
     */
    static IID := Guid("{e67651b0-337a-4b3c-9758-733388568251}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDiscoveryPublisherNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProbeHandler   : IntPtr
        ResolveHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDiscoveryPublisherNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Is called when a Probe is received by the discovery publisher.
     * @remarks
     * <b>ProbeHandler</b> is called whenever a <a href="https://docs.microsoft.com/windows/desktop/WsdApi/probe-message">Probe</a> is received by the discovery publisher. It is the responsibility of the callback interface to then call <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobe">MatchProbe</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchprobeex">MatchProbeEx</a> with host information to determine whether or not the received Probe matches the host.
     * 
     * The body of the Probe message passed to <i>pSoap</i> can be cast to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_probe">WSD_PROBE</a> structure.
     * @param {Pointer<WSD_SOAP_MESSAGE>} pSoap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that contains the Probe message received by the discovery publisher.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> interface that contains transport information associated with the received message.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-probehandler
     */
    ProbeHandler(pSoap, pMessageParameters) {
        result := ComCall(3, this, WSD_SOAP_MESSAGE.Ptr, pSoap, "ptr", pMessageParameters, "HRESULT")
        return result
    }

    /**
     * Is called when a Resolve is received by the discovery publisher.
     * @remarks
     * <b>ResolveHandler</b> is called whenever a Resolve is received by the discovery publisher. It is the responsibility of the callback interface to then call <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchresolve">MatchResolve</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsddisco/nf-wsddisco-iwsdiscoverypublisher-matchresolveex">MatchResolveEx</a> with host information to determine whether or not the received Resolve matches the host.
     * @param {Pointer<WSD_SOAP_MESSAGE>} pSoap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_message">WSD_SOAP_MESSAGE</a> structure that contains the Resolve message received by the discovery publisher.
     * @param {IWSDMessageParameters} pMessageParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdmessageparameters">IWSDMessageParameters</a> interface that contains transport information associated with the received message.
     * @returns {HRESULT} The return value is not meaningful. An implementer should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wsddisco/nf-wsddisco-iwsdiscoverypublishernotify-resolvehandler
     */
    ResolveHandler(pSoap, pMessageParameters) {
        result := ComCall(4, this, WSD_SOAP_MESSAGE.Ptr, pSoap, "ptr", pMessageParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDiscoveryPublisherNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProbeHandler := CallbackCreate(GetMethod(implObj, "ProbeHandler"), flags, 3)
        this.vtbl.ResolveHandler := CallbackCreate(GetMethod(implObj, "ResolveHandler"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProbeHandler)
        CallbackFree(this.vtbl.ResolveHandler)
    }
}

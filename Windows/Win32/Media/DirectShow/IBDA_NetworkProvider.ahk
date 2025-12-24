#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IBDA_NetworkProvider interface is implemented on a Network Provider filter. It provides methods that BDA device filters call to register themselves after they are added to the graph.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_NetworkProvider)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_networkprovider
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_NetworkProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_NetworkProvider
     * @type {Guid}
     */
    static IID => Guid("{fd501041-8ebe-11ce-8183-00aa00577da2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutSignalSource", "GetSignalSource", "GetNetworkType", "PutTuningSpace", "GetTuningSpace", "RegisterDeviceFilter", "UnRegisterDeviceFilter"]

    /**
     * The PutSignalSource method specifies the signal source.
     * @param {Integer} ulSignalSource Specifies the signal source.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_networkprovider-putsignalsource
     */
    PutSignalSource(ulSignalSource) {
        result := ComCall(3, this, "uint", ulSignalSource, "HRESULT")
        return result
    }

    /**
     * The GetSignalSource method retrieves the signal source.
     * @param {Pointer<Integer>} pulSignalSource Receives a value specifying the signal source.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_networkprovider-getsignalsource
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
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_networkprovider-getnetworktype
     */
    GetNetworkType(pguidNetworkType) {
        result := ComCall(5, this, "ptr", pguidNetworkType, "HRESULT")
        return result
    }

    /**
     * The PutTuningSpace method specifies the tuning space.
     * @param {Pointer<Guid>} guidTuningSpace Specifies the tuning space.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_networkprovider-puttuningspace
     */
    PutTuningSpace(guidTuningSpace) {
        result := ComCall(6, this, "ptr", guidTuningSpace, "HRESULT")
        return result
    }

    /**
     * The GetTuningSpace method retrieves the tuning space.
     * @param {Pointer<Guid>} pguidTuingSpace Receives a GUID specifying the tuning space.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_networkprovider-gettuningspace
     */
    GetTuningSpace(pguidTuingSpace) {
        result := ComCall(7, this, "ptr", pguidTuingSpace, "HRESULT")
        return result
    }

    /**
     * The RegisterDeviceFilter method is called by a BDA device filter to register itself in the filter graph.
     * @param {IUnknown} pUnkFilterControl Pointer to the filter's <b>IUnknown</b> interface.
     * @param {Pointer<Integer>} ppvRegisitrationContext Pointer that receives the registration context. The filter should store this value and return it in the call to <b>UnRegisterDeviceFilter</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_networkprovider-registerdevicefilter
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
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_networkprovider-unregisterdevicefilter
     */
    UnRegisterDeviceFilter(pvRegistrationContext) {
        result := ComCall(9, this, "uint", pvRegistrationContext, "HRESULT")
        return result
    }
}

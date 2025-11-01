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
     * 
     * @param {Integer} ulSignalSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-putsignalsource
     */
    PutSignalSource(ulSignalSource) {
        result := ComCall(3, this, "uint", ulSignalSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulSignalSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-getsignalsource
     */
    GetSignalSource(pulSignalSource) {
        pulSignalSourceMarshal := pulSignalSource is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulSignalSourceMarshal, pulSignalSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidNetworkType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-getnetworktype
     */
    GetNetworkType(pguidNetworkType) {
        result := ComCall(5, this, "ptr", pguidNetworkType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTuningSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-puttuningspace
     */
    PutTuningSpace(guidTuningSpace) {
        result := ComCall(6, this, "ptr", guidTuningSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTuingSpace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-gettuningspace
     */
    GetTuningSpace(pguidTuingSpace) {
        result := ComCall(7, this, "ptr", pguidTuingSpace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkFilterControl 
     * @param {Pointer<Integer>} ppvRegisitrationContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-registerdevicefilter
     */
    RegisterDeviceFilter(pUnkFilterControl, ppvRegisitrationContext) {
        ppvRegisitrationContextMarshal := ppvRegisitrationContext is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pUnkFilterControl, ppvRegisitrationContextMarshal, ppvRegisitrationContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pvRegistrationContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_networkprovider-unregisterdevicefilter
     */
    UnRegisterDeviceFilter(pvRegistrationContext) {
        result := ComCall(9, this, "uint", pvRegistrationContext, "HRESULT")
        return result
    }
}

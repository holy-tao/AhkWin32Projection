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
     * 
     * @param {Integer} ulSignalSource 
     * @returns {HRESULT} 
     */
    PutSignalSource(ulSignalSource) {
        result := ComCall(3, this, "uint", ulSignalSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulSignalSource 
     * @returns {HRESULT} 
     */
    GetSignalSource(pulSignalSource) {
        result := ComCall(4, this, "uint*", pulSignalSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidNetworkType 
     * @returns {HRESULT} 
     */
    GetNetworkType(pguidNetworkType) {
        result := ComCall(5, this, "ptr", pguidNetworkType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTuningSpace 
     * @returns {HRESULT} 
     */
    PutTuningSpace(guidTuningSpace) {
        result := ComCall(6, this, "ptr", guidTuningSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTuingSpace 
     * @returns {HRESULT} 
     */
    GetTuningSpace(pguidTuingSpace) {
        result := ComCall(7, this, "ptr", pguidTuingSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkFilterControl 
     * @param {Pointer<UInt32>} ppvRegisitrationContext 
     * @returns {HRESULT} 
     */
    RegisterDeviceFilter(pUnkFilterControl, ppvRegisitrationContext) {
        result := ComCall(8, this, "ptr", pUnkFilterControl, "uint*", ppvRegisitrationContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pvRegistrationContext 
     * @returns {HRESULT} 
     */
    UnRegisterDeviceFilter(pvRegistrationContext) {
        result := ComCall(9, this, "uint", pvRegistrationContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

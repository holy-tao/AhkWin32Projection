#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is implemented by the client program to receive callback notifications from IWSDiscoveryPublisher.
 * @see https://docs.microsoft.com/windows/win32/api//wsddisco/nn-wsddisco-iwsdiscoverypublishernotify
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDiscoveryPublisherNotify extends IUnknown{
    /**
     * The interface identifier for IWSDiscoveryPublisherNotify
     * @type {Guid}
     */
    static IID => Guid("{e67651b0-337a-4b3c-9758-733388568251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<WSD_SOAP_MESSAGE>} pSoap 
     * @param {Pointer<IWSDMessageParameters>} pMessageParameters 
     * @returns {HRESULT} 
     */
    ProbeHandler(pSoap, pMessageParameters) {
        result := ComCall(3, this, "ptr", pSoap, "ptr", pMessageParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_MESSAGE>} pSoap 
     * @param {Pointer<IWSDMessageParameters>} pMessageParameters 
     * @returns {HRESULT} 
     */
    ResolveHandler(pSoap, pMessageParameters) {
        result := ComCall(4, this, "ptr", pSoap, "ptr", pMessageParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

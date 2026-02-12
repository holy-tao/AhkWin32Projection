#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INDCustomData.ahk
#Include .\INDTransmitterProperties.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides arguments for the PlayReady-ND [RegistrationCompleted](ndclient_registrationcompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indregistrationcompletedeventargs
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDRegistrationCompletedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDRegistrationCompletedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{9e39b64d-ab5b-4905-acdc-787a77c6374d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResponseCustomData", "get_TransmitterProperties", "get_TransmitterCertificateAccepted", "put_TransmitterCertificateAccepted"]

    /**
     * Gets custom data from a registration response.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indregistrationcompletedeventargs.responsecustomdata
     * @type {INDCustomData} 
     */
    ResponseCustomData {
        get => this.get_ResponseCustomData()
    }

    /**
     * Gets transmitter properties from the transmitter's certificate to verify the transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indregistrationcompletedeventargs.transmitterproperties
     * @type {INDTransmitterProperties} 
     */
    TransmitterProperties {
        get => this.get_TransmitterProperties()
    }

    /**
     * Gets or sets whether to accept or reject a transmitter's certificate.
     * @remarks
     * The receiver must accept or reject the transmitter certificate when the mutual authentication flag is set in [NDStartAsyncOptions](ndstartasyncoptions.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indregistrationcompletedeventargs.transmittercertificateaccepted
     * @type {Boolean} 
     */
    TransmitterCertificateAccepted {
        get => this.get_TransmitterCertificateAccepted()
        set => this.put_TransmitterCertificateAccepted(value)
    }

    /**
     * 
     * @returns {INDCustomData} 
     */
    get_ResponseCustomData() {
        result := ComCall(6, this, "ptr*", &customData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INDCustomData(customData)
    }

    /**
     * 
     * @returns {INDTransmitterProperties} 
     */
    get_TransmitterProperties() {
        result := ComCall(7, this, "ptr*", &transmitterProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INDTransmitterProperties(transmitterProperties)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransmitterCertificateAccepted() {
        result := ComCall(8, this, "int*", &acceptpt := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return acceptpt
    }

    /**
     * 
     * @param {Boolean} accept 
     * @returns {HRESULT} 
     */
    put_TransmitterCertificateAccepted(accept) {
        result := ComCall(9, this, "int", accept, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

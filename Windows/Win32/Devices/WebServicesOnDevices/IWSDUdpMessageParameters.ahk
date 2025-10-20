#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDMessageParameters.ahk

/**
 * Use this interface to specify how often WSD repeats the message transmission.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdudpmessageparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDUdpMessageParameters extends IWSDMessageParameters{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDUdpMessageParameters
     * @type {Guid}
     */
    static IID => Guid("{9934149f-8f0c-447b-aa0b-73124b0ca7f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRetransmitParams", "GetRetransmitParams"]

    /**
     * 
     * @param {Pointer<WSDUdpRetransmitParams>} pParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpmessageparameters-setretransmitparams
     */
    SetRetransmitParams(pParams) {
        result := ComCall(8, this, "ptr", pParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSDUdpRetransmitParams>} pParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdudpmessageparameters-getretransmitparams
     */
    GetRetransmitParams(pParams) {
        result := ComCall(9, this, "ptr", pParams, "HRESULT")
        return result
    }
}

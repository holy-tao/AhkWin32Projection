#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WSDUdpRetransmitParams.ahk
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
     * Sets the values that WSD uses to determine how often to repeat the message transmission.
     * @param {Pointer<WSDUdpRetransmitParams>} pParams Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsdudpretransmitparams">WSDUdpRetransmitParams</a> structure. The structure contains values that determine how often WSD repeats the message transmission.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpmessageparameters-setretransmitparams
     */
    SetRetransmitParams(pParams) {
        result := ComCall(8, this, "ptr", pParams, "HRESULT")
        return result
    }

    /**
     * Retrieves the values that WSD uses to determine how often to repeat the message transmission.
     * @returns {WSDUdpRetransmitParams} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/ns-wsdbase-wsdudpretransmitparams">WSDUdpRetransmitParams</a> structure. The structure contains values that determine how often WSD repeats the message transmission.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdudpmessageparameters-getretransmitparams
     */
    GetRetransmitParams() {
        pParams := WSDUdpRetransmitParams()
        result := ComCall(9, this, "ptr", pParams, "HRESULT")
        return pParams
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITRequest interface allows an application to use Assisted Telephony. Assisted Telephony provides telephony-enabled applications with a simple mechanism for making phone calls without requiring the developer to become fully literate in telephony.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itrequest
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITRequest extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITRequest
     * @type {Guid}
     */
    static IID => Guid("{ac48ffdf-f8c4-11d1-a030-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MakeCall"]

    /**
     * The MakeCall method makes a call to the designated party.
     * @param {BSTR} pDestAddress Pointer to a <b>BSTR</b> containing the destination address for the call.
     * @param {BSTR} pAppName Pointer to a <b>BSTR</b> containing the name of the application.
     * @param {BSTR} pCalledParty Pointer to a <b>BSTR</b> containing the called party name.
     * @param {BSTR} pComment Pointer to a <b>BSTR</b> containing a comment.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPIERR_NOREQUESTRECIPIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No application exists that can handle the assisted telephony request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPIERR_INVALDESTADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The destination address is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPIERR_REQUESTQUEUEFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TAPI Server request queue is full and cannot handle another assisted telephony request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itrequest-makecall
     */
    MakeCall(pDestAddress, pAppName, pCalledParty, pComment) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress
        pAppName := pAppName is String ? BSTR.Alloc(pAppName).Value : pAppName
        pCalledParty := pCalledParty is String ? BSTR.Alloc(pCalledParty).Value : pCalledParty
        pComment := pComment is String ? BSTR.Alloc(pComment).Value : pComment

        result := ComCall(7, this, "ptr", pDestAddress, "ptr", pAppName, "ptr", pCalledParty, "ptr", pComment, "HRESULT")
        return result
    }
}

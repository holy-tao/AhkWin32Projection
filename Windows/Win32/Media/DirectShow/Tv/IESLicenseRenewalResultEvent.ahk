#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IESEvent.ahk

/**
 * Implements methods that get information from a LicenseRenewalResult event.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESLicenseRenewalResultEvent)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ieslicenserenewalresultevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESLicenseRenewalResultEvent extends IESEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESLicenseRenewalResultEvent
     * @type {Guid}
     */
    static IID => Guid("{d5a48ef5-a81b-4df0-acaa-5e35e7ea45d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCallersId", "GetFileName", "IsRenewalSuccessful", "IsCheckEntitlementCallRequired", "GetDescrambledStatus", "GetRenewalResultCode", "GetCASFailureCode", "GetRenewalHResult", "GetEntitlementTokenLength", "GetEntitlementToken", "GetExpiryDate"]

    /**
     * Gets a unique identifier from a LicenseRenewalResult event that identifies the caller.
     * @returns {Integer} Receives the caller identifier.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getcallersid
     */
    GetCallersId() {
        result := ComCall(8, this, "uint*", &pdwCallersId := 0, "HRESULT")
        return pdwCallersId
    }

    /**
     * Gets the file name for the license to renew from a LicenseRenewalResult event.
     * @returns {BSTR} Pointer to a buffer that receives the file name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getfilename
     */
    GetFileName() {
        pbstrFilename := BSTR()
        result := ComCall(9, this, "ptr", pbstrFilename, "HRESULT")
        return pbstrFilename
    }

    /**
     * Gets a flag from a LicenseRenewalResult event that indicates whether the renewal was successful. In the event of failure, a client can call the GetRenewalResultCode or GetRenewalHResult method to get information about the reason for the failure.
     * @returns {BOOL} Receives the renewal success flag: 1 indicates success; 0 indicates failure.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-isrenewalsuccessful
     */
    IsRenewalSuccessful() {
        result := ComCall(10, this, "int*", &pfRenewalSuccessful := 0, "HRESULT")
        return pfRenewalSuccessful
    }

    /**
     * Gets a flag from a LicenseRenewalResult event that indicates whether the client should check the entitlement token from the license. The client can call the IBDA_ConditionalAccessEx::CheckEntitlementToken method to validate the entitlement token.
     * @returns {BOOL} Receives the check entitlement token flag: 1 indicates that a check is needed; 0 indicates that no check is needed.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-ischeckentitlementcallrequired
     */
    IsCheckEntitlementCallRequired() {
        result := ComCall(11, this, "int*", &pfCheckEntTokenCallNeeded := 0, "HRESULT")
        return pfCheckEntTokenCallNeeded
    }

    /**
     * Gets a code from a LicenseRenewalResult event that indicates the result of an attempt to descramble protected content.
     * @returns {Integer} Receives a status code that indicates the descrambling status. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000000 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Free to air content (nonprotected). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Descrambling possible. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No technical (other). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010001 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) firmware upgrade required. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010002 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) internal failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010003 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) initializing/not ready.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010004 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) setup required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010005 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) no access card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010006 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) access card failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010007 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) bad access card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010008 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) wrong access card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80010009 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) expired access card.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x8001000A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) out of resources, for example, too many streams.	
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x8001000B </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) not in purchase window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x8001000C </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) not in purchase window, prior.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x8001000D </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No technical) not in purchase window, after.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020000 </dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No entitlement (other).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) access card not authorized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) service not authorized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) service expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) account not authorized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) account expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) service blacked out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) purchase required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) insufficient credit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x80020009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) purchase canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x8002000A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) renewal entitlement expired.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x8002000B</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) showing not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x8002000C</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * (No entitlement) showing next.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getdescrambledstatus
     */
    GetDescrambledStatus() {
        result := ComCall(12, this, "uint*", &pDescrambledStatus := 0, "HRESULT")
        return pDescrambledStatus
    }

    /**
     * Gets a constant from a Protected Broadcast Driver Architecture (PBDA) LicenseRenewalResult event that indicates which step in the renewal process caused the renewal to succeed or fail.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getrenewalresultcode
     */
    GetRenewalResultCode() {
        result := ComCall(13, this, "uint*", &pdwRenewalResultCode := 0, "HRESULT")
        return pdwRenewalResultCode
    }

    /**
     * Gets a code from a LicenseRenewalResult event that indicates the reason for the failure in the conditional access system (CAS).
     * @returns {Integer} Receives the CAS failure code. This code is defined by the CAS that is used.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getcasfailurecode
     */
    GetCASFailureCode() {
        result := ComCall(14, this, "uint*", &pdwCASFailureCode := 0, "HRESULT")
        return pdwCASFailureCode
    }

    /**
     * Gets the final HRESULT value from a LicenseRenewalResult event that is returned by a call to a COM interface method during the renewal process.
     * @returns {HRESULT} Receives the <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getrenewalhresult
     */
    GetRenewalHResult() {
        result := ComCall(15, this, "int*", &phr := 0, "HRESULT")
        return phr
    }

    /**
     * Gets the length of the entitlement token in a protected-content license from a LicenseRenewalResult event.
     * @returns {Integer} Receives the length of the entitlement token, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getentitlementtokenlength
     */
    GetEntitlementTokenLength() {
        result := ComCall(16, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * Gets the entitlement token in a protected-content license from a LicenseRenewalResult event. Clients can call the GetEntitlementTokenLength method to get the number of bytes to read from this buffer.
     * @returns {Pointer<SAFEARRAY>} Pointer to a buffer that receives the entitlement token.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getentitlementtoken
     */
    GetEntitlementToken() {
        result := ComCall(17, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }

    /**
     * Gets the expiry date of a renewed protected-content license from a LicenseRenewalResult event.
     * @returns {Integer} Receives the expiry date in number of seconds since epoch.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-ieslicenserenewalresultevent-getexpirydate
     */
    GetExpiryDate() {
        result := ComCall(18, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }
}

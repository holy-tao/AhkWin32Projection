#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IDTFilter.ahk

/**
 * The IDTFilter2 interface extends the IDTFilter interface and is exposed by the Decrypter/Detagger filter.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-idtfilter2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDTFilter2 extends IDTFilter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDTFilter2
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4b4-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChallengeUrl", "GetCurrLicenseExpDate", "GetLastErrorCode"]

    /**
     * @type {BSTR} 
     */
    ChallengeUrl {
        get => this.get_ChallengeUrl()
    }

    /**
     * Not implemented in this release.
     * @returns {BSTR} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter2-get_challengeurl
     */
    get_ChallengeUrl() {
        pbstrChallengeUrl := BSTR()
        result := ComCall(11, this, "ptr", pbstrChallengeUrl, "HRESULT")
        return pbstrChallengeUrl
    }

    /**
     * Not implemented in this release.
     * @param {Pointer<Integer>} protType Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter2-getcurrlicenseexpdate
     */
    GetCurrLicenseExpDate(protType) {
        protTypeMarshal := protType is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, protTypeMarshal, protType, "int*", &lpDateTime := 0, "HRESULT")
        return lpDateTime
    }

    /**
     * The GetLastErrorCode method returns the most recent error code from the Decrypter/Detagger filter.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_APPCERT_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A problem has occurred in the digital rights management (DRM) component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_CERTIFICATE_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's certificate has been revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No DRM errors have occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter2-getlasterrorcode
     */
    GetLastErrorCode() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}

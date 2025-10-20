#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides functionality to manage an Online Certificate Status Protocol (OCSP) responder server.
 * @remarks
 * 
  * The following table disambiguates the various properties used in the Microsoft OCSP architecture.
  * 
  * <table>
  * <tr>
  * <th>Architecture</th>
  * <th>Scope</th>
  * <th>Information types</th>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-get_ocspserviceproperties">OCSPServiceProperties</a>
  * </td>
  * <td>Governs general responder-service behavior for every CA.</td>
  * <td>
  * <ul>
  * <li>Proxy</li>
  * <li>Audit</li>
  * <li>Security configurations</li>
  * </ul>
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-get_ocspcaconfigurationcollection">OCSPCAConfigurationCollection</a>
  * </td>
  * <td>Governs response behavior for a specific CA.</td>
  * <td>
  * <ul>
  * <li>CA</li>
  * <li>Hash algorithm</li>
  * <li>Certificate signing</li>
  * <li>Revocation provider configurations</li>
  * </ul>
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfiguration-get_providerproperties">ProviderProperties</a>
  * </td>
  * <td>Governs behavior of a revocation information provider that is specific to a particular <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">OCSPCAConfiguration</a>.</td>
  * <td>
  * <ul>
  * <li>Certificate revocation lists (CRLs)</li>
  * <li>Refresh interval</li>
  * </ul>
  * </td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-iocspadmin
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IOCSPAdmin extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOCSPAdmin
     * @type {Guid}
     */
    static IID => Guid("{322e830d-67db-4fe9-9577-4596d9f09294}")

    /**
     * The class identifier for OCSPAdmin
     * @type {Guid}
     */
    static CLSID => Guid("{d3f73511-92c9-47cb-8ff2-8d891a7c4de4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OCSPServiceProperties", "get_OCSPCAConfigurationCollection", "GetConfiguration", "SetConfiguration", "GetMyRoles", "Ping", "SetSecurity", "GetSecurity", "GetSigningCertificates", "GetHashAlgorithms"]

    /**
     * 
     * @param {Pointer<IOCSPPropertyCollection>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-get_ocspserviceproperties
     */
    get_OCSPServiceProperties(ppVal) {
        result := ComCall(7, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOCSPCAConfigurationCollection>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-get_ocspcaconfigurationcollection
     */
    get_OCSPCAConfigurationCollection(pVal) {
        result := ComCall(8, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {VARIANT_BOOL} bForce 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-getconfiguration
     */
    GetConfiguration(bstrServerName, bForce) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(9, this, "ptr", bstrServerName, "short", bForce, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {VARIANT_BOOL} bForce 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-setconfiguration
     */
    SetConfiguration(bstrServerName, bForce) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(10, this, "ptr", bstrServerName, "short", bForce, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {Pointer<Integer>} pRoles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-getmyroles
     */
    GetMyRoles(bstrServerName, pRoles) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(11, this, "ptr", bstrServerName, "int*", pRoles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-ping
     */
    Ping(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(12, this, "ptr", bstrServerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-setsecurity
     */
    SetSecurity(bstrServerName, bstrVal) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(13, this, "ptr", bstrServerName, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-getsecurity
     */
    GetSecurity(bstrServerName, pVal) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(14, this, "ptr", bstrServerName, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {Pointer<VARIANT>} pCACertVar 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-getsigningcertificates
     */
    GetSigningCertificates(bstrServerName, pCACertVar, pVal) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(15, this, "ptr", bstrServerName, "ptr", pCACertVar, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @param {BSTR} bstrCAId 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspadmin-gethashalgorithms
     */
    GetHashAlgorithms(bstrServerName, bstrCAId, pVal) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName
        bstrCAId := bstrCAId is String ? BSTR.Alloc(bstrCAId).Value : bstrCAId

        result := ComCall(16, this, "ptr", bstrServerName, "ptr", bstrCAId, "ptr", pVal, "HRESULT")
        return result
    }
}

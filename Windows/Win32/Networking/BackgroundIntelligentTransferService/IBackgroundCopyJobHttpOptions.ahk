#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to specify client certificates for certificate-based client authentication and custom headers for HTTP requests.
 * @see https://docs.microsoft.com/windows/win32/api//bits2_5/nn-bits2_5-ibackgroundcopyjobhttpoptions
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJobHttpOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJobHttpOptions
     * @type {Guid}
     */
    static IID => Guid("{f1bd1079-9f01-4bdc-8036-f09b70095066}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClientCertificateByID", "SetClientCertificateByName", "RemoveClientCertificate", "GetClientCertificate", "SetCustomHeaders", "GetCustomHeaders", "SetSecurityFlags", "GetSecurityFlags"]

    /**
     * 
     * @param {Integer} StoreLocation 
     * @param {PWSTR} StoreName 
     * @param {Pointer<Integer>} pCertHashBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setclientcertificatebyid
     */
    SetClientCertificateByID(StoreLocation, StoreName, pCertHashBlob) {
        StoreName := StoreName is String ? StrPtr(StoreName) : StoreName

        result := ComCall(3, this, "int", StoreLocation, "ptr", StoreName, "char*", pCertHashBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StoreLocation 
     * @param {PWSTR} StoreName 
     * @param {PWSTR} SubjectName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setclientcertificatebyname
     */
    SetClientCertificateByName(StoreLocation, StoreName, SubjectName) {
        StoreName := StoreName is String ? StrPtr(StoreName) : StoreName
        SubjectName := SubjectName is String ? StrPtr(SubjectName) : SubjectName

        result := ComCall(4, this, "int", StoreLocation, "ptr", StoreName, "ptr", SubjectName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-removeclientcertificate
     */
    RemoveClientCertificate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStoreLocation 
     * @param {Pointer<PWSTR>} pStoreName 
     * @param {Pointer<Pointer<Integer>>} ppCertHashBlob 
     * @param {Pointer<PWSTR>} pSubjectName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-getclientcertificate
     */
    GetClientCertificate(pStoreLocation, pStoreName, ppCertHashBlob, pSubjectName) {
        result := ComCall(6, this, "int*", pStoreLocation, "ptr", pStoreName, "ptr*", ppCertHashBlob, "ptr", pSubjectName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} RequestHeaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setcustomheaders
     */
    SetCustomHeaders(RequestHeaders) {
        RequestHeaders := RequestHeaders is String ? StrPtr(RequestHeaders) : RequestHeaders

        result := ComCall(7, this, "ptr", RequestHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pRequestHeaders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-getcustomheaders
     */
    GetCustomHeaders(pRequestHeaders) {
        result := ComCall(8, this, "ptr", pRequestHeaders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setsecurityflags
     */
    SetSecurityFlags(Flags) {
        result := ComCall(9, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-getsecurityflags
     */
    GetSecurityFlags(pFlags) {
        result := ComCall(10, this, "uint*", pFlags, "HRESULT")
        return result
    }
}

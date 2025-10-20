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
     * 
     * @param {Integer} StoreLocation 
     * @param {PWSTR} StoreName 
     * @param {Pointer<Byte>} pCertHashBlob 
     * @returns {HRESULT} 
     */
    SetClientCertificateByID(StoreLocation, StoreName, pCertHashBlob) {
        StoreName := StoreName is String ? StrPtr(StoreName) : StoreName

        result := ComCall(3, this, "int", StoreLocation, "ptr", StoreName, "char*", pCertHashBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StoreLocation 
     * @param {PWSTR} StoreName 
     * @param {PWSTR} SubjectName 
     * @returns {HRESULT} 
     */
    SetClientCertificateByName(StoreLocation, StoreName, SubjectName) {
        StoreName := StoreName is String ? StrPtr(StoreName) : StoreName
        SubjectName := SubjectName is String ? StrPtr(SubjectName) : SubjectName

        result := ComCall(4, this, "int", StoreLocation, "ptr", StoreName, "ptr", SubjectName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveClientCertificate() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStoreLocation 
     * @param {Pointer<PWSTR>} pStoreName 
     * @param {Pointer<Byte>} ppCertHashBlob 
     * @param {Pointer<PWSTR>} pSubjectName 
     * @returns {HRESULT} 
     */
    GetClientCertificate(pStoreLocation, pStoreName, ppCertHashBlob, pSubjectName) {
        result := ComCall(6, this, "int*", pStoreLocation, "ptr", pStoreName, "char*", ppCertHashBlob, "ptr", pSubjectName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} RequestHeaders 
     * @returns {HRESULT} 
     */
    SetCustomHeaders(RequestHeaders) {
        RequestHeaders := RequestHeaders is String ? StrPtr(RequestHeaders) : RequestHeaders

        result := ComCall(7, this, "ptr", RequestHeaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pRequestHeaders 
     * @returns {HRESULT} 
     */
    GetCustomHeaders(pRequestHeaders) {
        result := ComCall(8, this, "ptr", pRequestHeaders, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetSecurityFlags(Flags) {
        result := ComCall(9, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    GetSecurityFlags(pFlags) {
        result := ComCall(10, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

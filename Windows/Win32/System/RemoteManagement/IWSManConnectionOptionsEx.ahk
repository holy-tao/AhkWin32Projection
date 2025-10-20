#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWSManConnectionOptions.ahk

/**
 * The IWSManConnectionOptionsEx object is passed to the IWSMan::CreateSession method to provide the thumbprint of the client certificate used for authentication.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanconnectionoptionsex
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManConnectionOptionsEx extends IWSManConnectionOptions{
    /**
     * The interface identifier for IWSManConnectionOptionsEx
     * @type {Guid}
     */
    static IID => Guid("{ef43edf7-2a48-4d93-9526-8bd6ab6d4a6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<BSTR>} thumbprint 
     * @returns {HRESULT} 
     */
    get_CertificateThumbprint(thumbprint) {
        result := ComCall(10, this, "ptr", thumbprint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} thumbprint 
     * @returns {HRESULT} 
     */
    put_CertificateThumbprint(thumbprint) {
        thumbprint := thumbprint is String ? BSTR.Alloc(thumbprint).Value : thumbprint

        result := ComCall(11, this, "ptr", thumbprint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface to configure the device and initiate the session.
 * @see https://docs.microsoft.com/windows/win32/api//wcndevice/nn-wcndevice-iwcndevice
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class IWCNDevice extends IUnknown{
    /**
     * The interface identifier for IWCNDevice
     * @type {Guid}
     */
    static IID => Guid("{c100be9c-d33a-4a4b-bf23-bbef4663d017}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} dwPasswordLength 
     * @param {Pointer<Byte>} pbPassword 
     * @returns {HRESULT} 
     */
    SetPassword(Type, dwPasswordLength, pbPassword) {
        result := ComCall(3, this, "int", Type, "uint", dwPasswordLength, "char*", pbPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWCNConnectNotify>} pNotify 
     * @returns {HRESULT} 
     */
    Connect(pNotify) {
        result := ComCall(4, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AttributeType 
     * @param {Integer} dwMaxBufferSize 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Pointer<UInt32>} pdwBufferUsed 
     * @returns {HRESULT} 
     */
    GetAttribute(AttributeType, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        result := ComCall(5, this, "int", AttributeType, "uint", dwMaxBufferSize, "char*", pbBuffer, "uint*", pdwBufferUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AttributeType 
     * @param {Pointer<UInt32>} puInteger 
     * @returns {HRESULT} 
     */
    GetIntegerAttribute(AttributeType, puInteger) {
        result := ComCall(6, this, "int", AttributeType, "uint*", puInteger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AttributeType 
     * @param {Integer} cchMaxString 
     * @param {PWSTR} wszString 
     * @returns {HRESULT} 
     */
    GetStringAttribute(AttributeType, cchMaxString, wszString) {
        wszString := wszString is String ? StrPtr(wszString) : wszString

        result := ComCall(7, this, "int", AttributeType, "uint", cchMaxString, "ptr", wszString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchMaxStringLength 
     * @param {PWSTR} wszProfile 
     * @returns {HRESULT} 
     */
    GetNetworkProfile(cchMaxStringLength, wszProfile) {
        wszProfile := wszProfile is String ? StrPtr(wszProfile) : wszProfile

        result := ComCall(8, this, "uint", cchMaxStringLength, "ptr", wszProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszProfileXml 
     * @returns {HRESULT} 
     */
    SetNetworkProfile(pszProfileXml) {
        pszProfileXml := pszProfileXml is String ? StrPtr(pszProfileXml) : pszProfileXml

        result := ComCall(9, this, "ptr", pszProfileXml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WCN_VENDOR_EXTENSION_SPEC>} pVendorExtSpec 
     * @param {Integer} dwMaxBufferSize 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Pointer<UInt32>} pdwBufferUsed 
     * @returns {HRESULT} 
     */
    GetVendorExtension(pVendorExtSpec, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        result := ComCall(10, this, "ptr", pVendorExtSpec, "uint", dwMaxBufferSize, "char*", pbBuffer, "uint*", pdwBufferUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WCN_VENDOR_EXTENSION_SPEC>} pVendorExtSpec 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Byte>} pbBuffer 
     * @returns {HRESULT} 
     */
    SetVendorExtension(pVendorExtSpec, cbBuffer, pbBuffer) {
        result := ComCall(11, this, "ptr", pVendorExtSpec, "uint", cbBuffer, "char*", pbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unadvise() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} dwOOBPasswordID 
     * @param {Integer} dwPasswordLength 
     * @param {Pointer<Byte>} pbPassword 
     * @param {Integer} dwRemotePublicKeyHashLength 
     * @param {Pointer<Byte>} pbRemotePublicKeyHash 
     * @param {Integer} dwDHKeyBlobLength 
     * @param {Pointer<Byte>} pbDHKeyBlob 
     * @returns {HRESULT} 
     */
    SetNFCPasswordParams(Type, dwOOBPasswordID, dwPasswordLength, pbPassword, dwRemotePublicKeyHashLength, pbRemotePublicKeyHash, dwDHKeyBlobLength, pbDHKeyBlob) {
        result := ComCall(13, this, "int", Type, "uint", dwOOBPasswordID, "uint", dwPasswordLength, "char*", pbPassword, "uint", dwRemotePublicKeyHashLength, "char*", pbRemotePublicKeyHash, "uint", dwDHKeyBlobLength, "char*", pbDHKeyBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPassword", "Connect", "GetAttribute", "GetIntegerAttribute", "GetStringAttribute", "GetNetworkProfile", "SetNetworkProfile", "GetVendorExtension", "SetVendorExtension", "Unadvise", "SetNFCPasswordParams"]

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} dwPasswordLength 
     * @param {Pointer<Integer>} pbPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-setpassword
     */
    SetPassword(Type, dwPasswordLength, pbPassword) {
        result := ComCall(3, this, "int", Type, "uint", dwPasswordLength, "char*", pbPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWCNConnectNotify} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-connect
     */
    Connect(pNotify) {
        result := ComCall(4, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AttributeType 
     * @param {Integer} dwMaxBufferSize 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Pointer<Integer>} pdwBufferUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getattribute
     */
    GetAttribute(AttributeType, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        result := ComCall(5, this, "int", AttributeType, "uint", dwMaxBufferSize, "char*", pbBuffer, "uint*", pdwBufferUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AttributeType 
     * @param {Pointer<Integer>} puInteger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute
     */
    GetIntegerAttribute(AttributeType, puInteger) {
        result := ComCall(6, this, "int", AttributeType, "uint*", puInteger, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AttributeType 
     * @param {Integer} cchMaxString 
     * @param {PWSTR} wszString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getstringattribute
     */
    GetStringAttribute(AttributeType, cchMaxString, wszString) {
        wszString := wszString is String ? StrPtr(wszString) : wszString

        result := ComCall(7, this, "int", AttributeType, "uint", cchMaxString, "ptr", wszString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchMaxStringLength 
     * @param {PWSTR} wszProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getnetworkprofile
     */
    GetNetworkProfile(cchMaxStringLength, wszProfile) {
        wszProfile := wszProfile is String ? StrPtr(wszProfile) : wszProfile

        result := ComCall(8, this, "uint", cchMaxStringLength, "ptr", wszProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszProfileXml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-setnetworkprofile
     */
    SetNetworkProfile(pszProfileXml) {
        pszProfileXml := pszProfileXml is String ? StrPtr(pszProfileXml) : pszProfileXml

        result := ComCall(9, this, "ptr", pszProfileXml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WCN_VENDOR_EXTENSION_SPEC>} pVendorExtSpec 
     * @param {Integer} dwMaxBufferSize 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Pointer<Integer>} pdwBufferUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-getvendorextension
     */
    GetVendorExtension(pVendorExtSpec, dwMaxBufferSize, pbBuffer, pdwBufferUsed) {
        result := ComCall(10, this, "ptr", pVendorExtSpec, "uint", dwMaxBufferSize, "char*", pbBuffer, "uint*", pdwBufferUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WCN_VENDOR_EXTENSION_SPEC>} pVendorExtSpec 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-setvendorextension
     */
    SetVendorExtension(pVendorExtSpec, cbBuffer, pbBuffer) {
        result := ComCall(11, this, "ptr", pVendorExtSpec, "uint", cbBuffer, "char*", pbBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcndevice-unadvise
     */
    Unadvise() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} dwOOBPasswordID 
     * @param {Integer} dwPasswordLength 
     * @param {Pointer<Integer>} pbPassword 
     * @param {Integer} dwRemotePublicKeyHashLength 
     * @param {Pointer<Integer>} pbRemotePublicKeyHash 
     * @param {Integer} dwDHKeyBlobLength 
     * @param {Pointer<Integer>} pbDHKeyBlob 
     * @returns {HRESULT} 
     */
    SetNFCPasswordParams(Type, dwOOBPasswordID, dwPasswordLength, pbPassword, dwRemotePublicKeyHashLength, pbRemotePublicKeyHash, dwDHKeyBlobLength, pbDHKeyBlob) {
        result := ComCall(13, this, "int", Type, "uint", dwOOBPasswordID, "uint", dwPasswordLength, "char*", pbPassword, "uint", dwRemotePublicKeyHashLength, "char*", pbRemotePublicKeyHash, "uint", dwDHKeyBlobLength, "char*", pbDHKeyBlob, "HRESULT")
        return result
    }
}

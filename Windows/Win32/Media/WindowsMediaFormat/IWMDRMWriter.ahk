#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMWriter interface provides support for applying DRM protection to content in ASF files.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmwriter
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMWriter
     * @type {Guid}
     */
    static IID => Guid("{d6ea5dd0-12a0-43f4-90ab-a3fd451e6a07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateKeySeed", "GenerateKeyID", "GenerateSigningKeyPair", "SetDRMAttribute"]

    /**
     * The GenerateKeySeed method generates a DRM key seed.
     * @param {PWSTR} pwszKeySeed Pointer to a wide-character <b>null</b>-terminated string containing the key seed. Set to <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcwchLength</i>.
     * @param {Pointer<Integer>} pcwchLength Pointer to a <b>DWORD</b> containing the size, in wide characters, of <i>pwszKeySeed</i>. This size includes the terminating <b>null</b> character.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmwriter-generatekeyseed
     */
    GenerateKeySeed(pwszKeySeed, pcwchLength) {
        pwszKeySeed := pwszKeySeed is String ? StrPtr(pwszKeySeed) : pwszKeySeed

        pcwchLengthMarshal := pcwchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwszKeySeed, pcwchLengthMarshal, pcwchLength, "HRESULT")
        return result
    }

    /**
     * The GenerateKeyID method generates a DRM key ID.
     * @param {PWSTR} pwszKeyID Pointer to a wide-character <b>null</b>-terminated string containing the key identifier. Set to <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcwchLength</i>.
     * @param {Pointer<Integer>} pcwchLength Pointer to a <b>DWORD</b> containing the size, in wide characters, of <i>pwszKeyID</i>. This size includes the terminating <b>null</b> character.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmwriter-generatekeyid
     */
    GenerateKeyID(pwszKeyID, pcwchLength) {
        pwszKeyID := pwszKeyID is String ? StrPtr(pwszKeyID) : pwszKeyID

        pcwchLengthMarshal := pcwchLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszKeyID, pcwchLengthMarshal, pcwchLength, "HRESULT")
        return result
    }

    /**
     * The GenerateSigningKeyPair method generates a public and private key pair that are used to sign the DRM header object.
     * @param {PWSTR} pwszPrivKey Pointer to a wide-character <b>null</b>-terminated string containing the private key. Set to <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcwchPrivKeyLength</i>. Use this key to set the <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-headersignprivkey">DRM_HeaderSignPrivKey</a> property.
     * @param {Pointer<Integer>} pcwchPrivKeyLength Pointer to a <b>DWORD</b> containing the size, in wide characters, of <i>pwszPrivKey</i>. This size includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszPubKey Pointer to a wide-character <b>null</b>-terminated string containing the public key. Set to <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcwchPubKeyLength</i>. This key is shared only with the license server; it enables the license server to verify the signature of the DRM header object when users attempt to obtain a content license for a file.
     * @param {Pointer<Integer>} pcwchPubKeyLength Pointer to a <b>DWORD</b> containing the size, in wide characters, of <i>pwsPubKey</i>. This size includes the terminating <b>null</b> character.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmwriter-generatesigningkeypair
     */
    GenerateSigningKeyPair(pwszPrivKey, pcwchPrivKeyLength, pwszPubKey, pcwchPubKeyLength) {
        pwszPrivKey := pwszPrivKey is String ? StrPtr(pwszPrivKey) : pwszPrivKey
        pwszPubKey := pwszPubKey is String ? StrPtr(pwszPubKey) : pwszPubKey

        pcwchPrivKeyLengthMarshal := pcwchPrivKeyLength is VarRef ? "uint*" : "ptr"
        pcwchPubKeyLengthMarshal := pcwchPubKeyLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pwszPrivKey, pcwchPrivKeyLengthMarshal, pcwchPrivKeyLength, "ptr", pwszPubKey, pcwchPubKeyLengthMarshal, pcwchPubKeyLength, "HRESULT")
        return result
    }

    /**
     * The SetDRMAttribute method sets DRM-header attributes as well as other DRM run-time properties.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number to which the attribute applies.
     * @param {PWSTR} pszName Pointer to a null-terminated string containing the attribute name. See Remarks for supported attributes.
     * @param {Integer} Type A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type specifying the data type of the attribute data.
     * @param {Pointer<Integer>} pValue Pointer to an array of bytes containing the attribute data.
     * @param {Integer} cbLength The size, in bytes, of the attribute data pointed to by <i>pValue</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmwriter-setdrmattribute
     */
    SetDRMAttribute(wStreamNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ushort", wStreamNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }
}

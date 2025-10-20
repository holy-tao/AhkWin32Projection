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
     * 
     * @param {PWSTR} pwszKeySeed 
     * @param {Pointer<UInt32>} pcwchLength 
     * @returns {HRESULT} 
     */
    GenerateKeySeed(pwszKeySeed, pcwchLength) {
        pwszKeySeed := pwszKeySeed is String ? StrPtr(pwszKeySeed) : pwszKeySeed

        result := ComCall(3, this, "ptr", pwszKeySeed, "uint*", pcwchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszKeyID 
     * @param {Pointer<UInt32>} pcwchLength 
     * @returns {HRESULT} 
     */
    GenerateKeyID(pwszKeyID, pcwchLength) {
        pwszKeyID := pwszKeyID is String ? StrPtr(pwszKeyID) : pwszKeyID

        result := ComCall(4, this, "ptr", pwszKeyID, "uint*", pcwchLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPrivKey 
     * @param {Pointer<UInt32>} pcwchPrivKeyLength 
     * @param {PWSTR} pwszPubKey 
     * @param {Pointer<UInt32>} pcwchPubKeyLength 
     * @returns {HRESULT} 
     */
    GenerateSigningKeyPair(pwszPrivKey, pcwchPrivKeyLength, pwszPubKey, pcwchPubKeyLength) {
        pwszPrivKey := pwszPrivKey is String ? StrPtr(pwszPrivKey) : pwszPrivKey
        pwszPubKey := pwszPubKey is String ? StrPtr(pwszPubKey) : pwszPubKey

        result := ComCall(5, this, "ptr", pwszPrivKey, "uint*", pcwchPrivKeyLength, "ptr", pwszPubKey, "uint*", pcwchPubKeyLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {PWSTR} pszName 
     * @param {Integer} Type 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetDRMAttribute(wStreamNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(6, this, "ushort", wStreamNum, "ptr", pszName, "int", Type, "char*", pValue, "ushort", cbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

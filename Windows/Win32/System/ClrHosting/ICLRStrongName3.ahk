#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRStrongName3 extends IUnknown{
    /**
     * The interface identifier for ICLRStrongName3
     * @type {Guid}
     */
    static IID => Guid("{22c7089b-bbd3-414a-b698-210f263f1fed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {Pointer<Byte>} ppbDigestBlob 
     * @param {Pointer<UInt32>} pcbDigestBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameDigestGenerate(wszFilePath, ppbDigestBlob, pcbDigestBlob, dwFlags) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        result := ComCall(3, this, "ptr", wszFilePath, "char*", ppbDigestBlob, "uint*", pcbDigestBlob, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszKeyContainer 
     * @param {Pointer<Byte>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Byte>} pbDigestBlob 
     * @param {Integer} cbDigestBlob 
     * @param {Integer} hashAlgId 
     * @param {Pointer<Byte>} ppbSignatureBlob 
     * @param {Pointer<UInt32>} pcbSignatureBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameDigestSign(wszKeyContainer, pbKeyBlob, cbKeyBlob, pbDigestBlob, cbDigestBlob, hashAlgId, ppbSignatureBlob, pcbSignatureBlob, dwFlags) {
        wszKeyContainer := wszKeyContainer is String ? StrPtr(wszKeyContainer) : wszKeyContainer

        result := ComCall(4, this, "ptr", wszKeyContainer, "char*", pbKeyBlob, "uint", cbKeyBlob, "char*", pbDigestBlob, "uint", cbDigestBlob, "uint", hashAlgId, "char*", ppbSignatureBlob, "uint*", pcbSignatureBlob, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {Pointer<Byte>} pbSignatureBlob 
     * @param {Integer} cbSignatureBlob 
     * @returns {HRESULT} 
     */
    StrongNameDigestEmbed(wszFilePath, pbSignatureBlob, cbSignatureBlob) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        result := ComCall(5, this, "ptr", wszFilePath, "char*", pbSignatureBlob, "uint", cbSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

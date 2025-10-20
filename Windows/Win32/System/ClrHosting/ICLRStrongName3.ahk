#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRStrongName3 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StrongNameDigestGenerate", "StrongNameDigestSign", "StrongNameDigestEmbed"]

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {Pointer<Pointer<Integer>>} ppbDigestBlob 
     * @param {Pointer<Integer>} pcbDigestBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameDigestGenerate(wszFilePath, ppbDigestBlob, pcbDigestBlob, dwFlags) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        result := ComCall(3, this, "ptr", wszFilePath, "ptr*", ppbDigestBlob, "uint*", pcbDigestBlob, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszKeyContainer 
     * @param {Pointer<Integer>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Integer>} pbDigestBlob 
     * @param {Integer} cbDigestBlob 
     * @param {Integer} hashAlgId 
     * @param {Pointer<Pointer<Integer>>} ppbSignatureBlob 
     * @param {Pointer<Integer>} pcbSignatureBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameDigestSign(wszKeyContainer, pbKeyBlob, cbKeyBlob, pbDigestBlob, cbDigestBlob, hashAlgId, ppbSignatureBlob, pcbSignatureBlob, dwFlags) {
        wszKeyContainer := wszKeyContainer is String ? StrPtr(wszKeyContainer) : wszKeyContainer

        result := ComCall(4, this, "ptr", wszKeyContainer, "char*", pbKeyBlob, "uint", cbKeyBlob, "char*", pbDigestBlob, "uint", cbDigestBlob, "uint", hashAlgId, "ptr*", ppbSignatureBlob, "uint*", pcbSignatureBlob, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {Pointer<Integer>} pbSignatureBlob 
     * @param {Integer} cbSignatureBlob 
     * @returns {HRESULT} 
     */
    StrongNameDigestEmbed(wszFilePath, pbSignatureBlob, cbSignatureBlob) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        result := ComCall(5, this, "ptr", wszFilePath, "char*", pbSignatureBlob, "uint", cbSignatureBlob, "HRESULT")
        return result
    }
}

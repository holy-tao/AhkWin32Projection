#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMetaDataEmit.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataEmit2 extends IMetaDataEmit{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataEmit2
     * @type {Guid}
     */
    static IID => Guid("{f5dd9950-f693-42e6-830e-7b833e8146a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 52

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DefineMethodSpec", "GetDeltaSaveSize", "SaveDelta", "SaveDeltaToStream", "SaveDeltaToMemory", "DefineGenericParam", "SetGenericParamProps", "ResetENCLog"]

    /**
     * 
     * @param {Integer} tkParent 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<Integer>} pmi 
     * @returns {HRESULT} 
     */
    DefineMethodSpec(tkParent, pvSigBlob, cbSigBlob, pmi) {
        result := ComCall(52, this, "uint", tkParent, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fSave 
     * @param {Pointer<Integer>} pdwSaveSize 
     * @returns {HRESULT} 
     */
    GetDeltaSaveSize(fSave, pdwSaveSize) {
        result := ComCall(53, this, "int", fSave, "uint*", pdwSaveSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szFile 
     * @param {Integer} dwSaveFlags 
     * @returns {HRESULT} 
     */
    SaveDelta(szFile, dwSaveFlags) {
        szFile := szFile is String ? StrPtr(szFile) : szFile

        result := ComCall(54, this, "ptr", szFile, "uint", dwSaveFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @param {Integer} dwSaveFlags 
     * @returns {HRESULT} 
     */
    SaveDeltaToStream(pIStream, dwSaveFlags) {
        result := ComCall(55, this, "ptr", pIStream, "uint", dwSaveFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    SaveDeltaToMemory(pbData, cbData) {
        result := ComCall(56, this, "ptr", pbData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Integer} ulParamSeq 
     * @param {Integer} dwParamFlags 
     * @param {PWSTR} szname 
     * @param {Integer} reserved 
     * @param {Pointer<Integer>} rtkConstraints 
     * @param {Pointer<Integer>} pgp 
     * @returns {HRESULT} 
     */
    DefineGenericParam(tk, ulParamSeq, dwParamFlags, szname, reserved, rtkConstraints, pgp) {
        szname := szname is String ? StrPtr(szname) : szname

        result := ComCall(57, this, "uint", tk, "uint", ulParamSeq, "uint", dwParamFlags, "ptr", szname, "uint", reserved, "uint*", rtkConstraints, "uint*", pgp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gp 
     * @param {Integer} dwParamFlags 
     * @param {PWSTR} szName 
     * @param {Integer} reserved 
     * @param {Pointer<Integer>} rtkConstraints 
     * @returns {HRESULT} 
     */
    SetGenericParamProps(gp, dwParamFlags, szName, reserved, rtkConstraints) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(58, this, "uint", gp, "uint", dwParamFlags, "ptr", szName, "uint", reserved, "uint*", rtkConstraints, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetENCLog() {
        result := ComCall(59, this, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMetaDataEmit.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataEmit2 extends IMetaDataEmit{
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
     * 
     * @param {Integer} tkParent 
     * @param {Pointer<Byte>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<UInt32>} pmi 
     * @returns {HRESULT} 
     */
    DefineMethodSpec(tkParent, pvSigBlob, cbSigBlob, pmi) {
        result := ComCall(52, this, "uint", tkParent, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fSave 
     * @param {Pointer<UInt32>} pdwSaveSize 
     * @returns {HRESULT} 
     */
    GetDeltaSaveSize(fSave, pdwSaveSize) {
        result := ComCall(53, this, "int", fSave, "uint*", pdwSaveSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(54, this, "ptr", szFile, "uint", dwSaveFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pIStream 
     * @param {Integer} dwSaveFlags 
     * @returns {HRESULT} 
     */
    SaveDeltaToStream(pIStream, dwSaveFlags) {
        result := ComCall(55, this, "ptr", pIStream, "uint", dwSaveFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    SaveDeltaToMemory(pbData, cbData) {
        result := ComCall(56, this, "ptr", pbData, "uint", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Integer} ulParamSeq 
     * @param {Integer} dwParamFlags 
     * @param {PWSTR} szname 
     * @param {Integer} reserved 
     * @param {Pointer<UInt32>} rtkConstraints 
     * @param {Pointer<UInt32>} pgp 
     * @returns {HRESULT} 
     */
    DefineGenericParam(tk, ulParamSeq, dwParamFlags, szname, reserved, rtkConstraints, pgp) {
        szname := szname is String ? StrPtr(szname) : szname

        result := ComCall(57, this, "uint", tk, "uint", ulParamSeq, "uint", dwParamFlags, "ptr", szname, "uint", reserved, "uint*", rtkConstraints, "uint*", pgp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} gp 
     * @param {Integer} dwParamFlags 
     * @param {PWSTR} szName 
     * @param {Integer} reserved 
     * @param {Pointer<UInt32>} rtkConstraints 
     * @returns {HRESULT} 
     */
    SetGenericParamProps(gp, dwParamFlags, szName, reserved, rtkConstraints) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(58, this, "uint", gp, "uint", dwParamFlags, "ptr", szName, "uint", reserved, "uint*", rtkConstraints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetENCLog() {
        result := ComCall(59, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

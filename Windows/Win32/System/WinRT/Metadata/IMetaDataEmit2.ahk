#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMetaDataEmit.ahk" { IMetaDataEmit }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CorSaveSize.ahk" { CorSaveSize }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataEmit2 extends IMetaDataEmit {
    /**
     * The interface identifier for IMetaDataEmit2
     * @type {Guid}
     */
    static IID := Guid("{f5dd9950-f693-42e6-830e-7b833e8146a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataEmit2 interfaces
    */
    struct Vtbl extends IMetaDataEmit.Vtbl {
        DefineMethodSpec     : IntPtr
        GetDeltaSaveSize     : IntPtr
        SaveDelta            : IntPtr
        SaveDeltaToStream    : IntPtr
        SaveDeltaToMemory    : IntPtr
        DefineGenericParam   : IntPtr
        SetGenericParamProps : IntPtr
        ResetENCLog          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataEmit2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} tkParent 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<Integer>} pmi 
     * @returns {HRESULT} 
     */
    DefineMethodSpec(tkParent, pvSigBlob, cbSigBlob, pmi) {
        pvSigBlobMarshal := pvSigBlob is VarRef ? "char*" : "ptr"
        pmiMarshal := pmi is VarRef ? "uint*" : "ptr"

        result := ComCall(52, this, "uint", tkParent, pvSigBlobMarshal, pvSigBlob, "uint", cbSigBlob, pmiMarshal, pmi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CorSaveSize} fSave 
     * @param {Pointer<Integer>} pdwSaveSize 
     * @returns {HRESULT} 
     */
    GetDeltaSaveSize(fSave, pdwSaveSize) {
        pdwSaveSizeMarshal := pdwSaveSize is VarRef ? "uint*" : "ptr"

        result := ComCall(53, this, CorSaveSize, fSave, pdwSaveSizeMarshal, pdwSaveSize, "HRESULT")
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
        pbDataMarshal := pbData is VarRef ? "ptr" : "ptr"

        result := ComCall(56, this, pbDataMarshal, pbData, "uint", cbData, "HRESULT")
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

        rtkConstraintsMarshal := rtkConstraints is VarRef ? "uint*" : "ptr"
        pgpMarshal := pgp is VarRef ? "uint*" : "ptr"

        result := ComCall(57, this, "uint", tk, "uint", ulParamSeq, "uint", dwParamFlags, "ptr", szname, "uint", reserved, rtkConstraintsMarshal, rtkConstraints, pgpMarshal, pgp, "HRESULT")
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

        rtkConstraintsMarshal := rtkConstraints is VarRef ? "uint*" : "ptr"

        result := ComCall(58, this, "uint", gp, "uint", dwParamFlags, "ptr", szName, "uint", reserved, rtkConstraintsMarshal, rtkConstraints, "HRESULT")
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

    Query(iid) {
        if (IMetaDataEmit2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DefineMethodSpec := CallbackCreate(GetMethod(implObj, "DefineMethodSpec"), flags, 5)
        this.vtbl.GetDeltaSaveSize := CallbackCreate(GetMethod(implObj, "GetDeltaSaveSize"), flags, 3)
        this.vtbl.SaveDelta := CallbackCreate(GetMethod(implObj, "SaveDelta"), flags, 3)
        this.vtbl.SaveDeltaToStream := CallbackCreate(GetMethod(implObj, "SaveDeltaToStream"), flags, 3)
        this.vtbl.SaveDeltaToMemory := CallbackCreate(GetMethod(implObj, "SaveDeltaToMemory"), flags, 3)
        this.vtbl.DefineGenericParam := CallbackCreate(GetMethod(implObj, "DefineGenericParam"), flags, 8)
        this.vtbl.SetGenericParamProps := CallbackCreate(GetMethod(implObj, "SetGenericParamProps"), flags, 6)
        this.vtbl.ResetENCLog := CallbackCreate(GetMethod(implObj, "ResetENCLog"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DefineMethodSpec)
        CallbackFree(this.vtbl.GetDeltaSaveSize)
        CallbackFree(this.vtbl.SaveDelta)
        CallbackFree(this.vtbl.SaveDeltaToStream)
        CallbackFree(this.vtbl.SaveDeltaToMemory)
        CallbackFree(this.vtbl.DefineGenericParam)
        CallbackFree(this.vtbl.SetGenericParamProps)
        CallbackFree(this.vtbl.ResetENCLog)
    }
}

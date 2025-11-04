#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMetaDataImport.ahk

/**
 * Extends the IMetaDataImport interface to provide the capability of working with generic types.
 * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nn-rometadataapi-imetadataimport2
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataImport2 extends IMetaDataImport{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataImport2
     * @type {Guid}
     */
    static IID => Guid("{fce5efa0-8bba-4f8e-a036-8f2022b08466}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumGenericParams", "GetGenericParamProps", "GetMethodSpecProps", "EnumGenericParamConstraints", "GetGenericParamConstraintProps", "GetPEKind", "GetVersionString", "EnumMethodSpecs"]

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} tk 
     * @param {Pointer<Integer>} rGenericParams 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcGenericParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-enumgenericparams
     */
    EnumGenericParams(phEnum, tk, rGenericParams, cMax, pcGenericParams) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rGenericParamsMarshal := rGenericParams is VarRef ? "uint*" : "ptr"
        pcGenericParamsMarshal := pcGenericParams is VarRef ? "uint*" : "ptr"

        result := ComCall(65, this, phEnumMarshal, phEnum, "uint", tk, rGenericParamsMarshal, rGenericParams, "uint", cMax, pcGenericParamsMarshal, pcGenericParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gp 
     * @param {Pointer<Integer>} pulParamSeq 
     * @param {Pointer<Integer>} pdwParamFlags 
     * @param {Pointer<Integer>} ptOwner 
     * @param {Pointer<Integer>} reserved 
     * @param {PWSTR} wzname 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-getgenericparamprops
     */
    GetGenericParamProps(gp, pulParamSeq, pdwParamFlags, ptOwner, reserved, wzname, cchName, pchName) {
        wzname := wzname is String ? StrPtr(wzname) : wzname

        pulParamSeqMarshal := pulParamSeq is VarRef ? "uint*" : "ptr"
        pdwParamFlagsMarshal := pdwParamFlags is VarRef ? "uint*" : "ptr"
        ptOwnerMarshal := ptOwner is VarRef ? "uint*" : "ptr"
        reservedMarshal := reserved is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(66, this, "uint", gp, pulParamSeqMarshal, pulParamSeq, pdwParamFlagsMarshal, pdwParamFlags, ptOwnerMarshal, ptOwner, reservedMarshal, reserved, "ptr", wzname, "uint", cchName, pchNameMarshal, pchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mi 
     * @param {Pointer<Integer>} tkParent 
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob 
     * @param {Pointer<Integer>} pcbSigBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-getmethodspecprops
     */
    GetMethodSpecProps(mi, tkParent, ppvSigBlob, pcbSigBlob) {
        tkParentMarshal := tkParent is VarRef ? "uint*" : "ptr"
        ppvSigBlobMarshal := ppvSigBlob is VarRef ? "ptr*" : "ptr"
        pcbSigBlobMarshal := pcbSigBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(67, this, "uint", mi, tkParentMarshal, tkParent, ppvSigBlobMarshal, ppvSigBlob, pcbSigBlobMarshal, pcbSigBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} tk 
     * @param {Pointer<Integer>} rGenericParamConstraints 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcGenericParamConstraints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-enumgenericparamconstraints
     */
    EnumGenericParamConstraints(phEnum, tk, rGenericParamConstraints, cMax, pcGenericParamConstraints) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rGenericParamConstraintsMarshal := rGenericParamConstraints is VarRef ? "uint*" : "ptr"
        pcGenericParamConstraintsMarshal := pcGenericParamConstraints is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, phEnumMarshal, phEnum, "uint", tk, rGenericParamConstraintsMarshal, rGenericParamConstraints, "uint", cMax, pcGenericParamConstraintsMarshal, pcGenericParamConstraints, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} gpc 
     * @param {Pointer<Integer>} ptGenericParam 
     * @param {Pointer<Integer>} ptkConstraintType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-getgenericparamconstraintprops
     */
    GetGenericParamConstraintProps(gpc, ptGenericParam, ptkConstraintType) {
        ptGenericParamMarshal := ptGenericParam is VarRef ? "uint*" : "ptr"
        ptkConstraintTypeMarshal := ptkConstraintType is VarRef ? "uint*" : "ptr"

        result := ComCall(69, this, "uint", gpc, ptGenericParamMarshal, ptGenericParam, ptkConstraintTypeMarshal, ptkConstraintType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPEKind 
     * @param {Pointer<Integer>} pdwMAchine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-getpekind
     */
    GetPEKind(pdwPEKind, pdwMAchine) {
        pdwPEKindMarshal := pdwPEKind is VarRef ? "uint*" : "ptr"
        pdwMAchineMarshal := pdwMAchine is VarRef ? "uint*" : "ptr"

        result := ComCall(70, this, pdwPEKindMarshal, pdwPEKind, pdwMAchineMarshal, pdwMAchine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzBuf 
     * @param {Integer} ccBufSize 
     * @param {Pointer<Integer>} pccBufSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-getversionstring
     */
    GetVersionString(pwzBuf, ccBufSize, pccBufSize) {
        pwzBuf := pwzBuf is String ? StrPtr(pwzBuf) : pwzBuf

        pccBufSizeMarshal := pccBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(71, this, "ptr", pwzBuf, "uint", ccBufSize, pccBufSizeMarshal, pccBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} tk 
     * @param {Pointer<Integer>} rMethodSpecs 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcMethodSpecs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport2-enummethodspecs
     */
    EnumMethodSpecs(phEnum, tk, rMethodSpecs, cMax, pcMethodSpecs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodSpecsMarshal := rMethodSpecs is VarRef ? "uint*" : "ptr"
        pcMethodSpecsMarshal := pcMethodSpecs is VarRef ? "uint*" : "ptr"

        result := ComCall(72, this, phEnumMarshal, phEnum, "uint", tk, rMethodSpecsMarshal, rMethodSpecs, "uint", cMax, pcMethodSpecsMarshal, pcMethodSpecs, "HRESULT")
        return result
    }
}

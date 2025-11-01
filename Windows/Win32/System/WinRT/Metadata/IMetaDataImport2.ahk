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
        result := ComCall(65, this, "ptr*", phEnum, "uint", tk, "uint*", rGenericParams, "uint", cMax, "uint*", pcGenericParams, "HRESULT")
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

        result := ComCall(66, this, "uint", gp, "uint*", pulParamSeq, "uint*", pdwParamFlags, "uint*", ptOwner, "uint*", reserved, "ptr", wzname, "uint", cchName, "uint*", pchName, "HRESULT")
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
        result := ComCall(67, this, "uint", mi, "uint*", tkParent, "ptr*", ppvSigBlob, "uint*", pcbSigBlob, "HRESULT")
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
        result := ComCall(68, this, "ptr*", phEnum, "uint", tk, "uint*", rGenericParamConstraints, "uint", cMax, "uint*", pcGenericParamConstraints, "HRESULT")
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
        result := ComCall(69, this, "uint", gpc, "uint*", ptGenericParam, "uint*", ptkConstraintType, "HRESULT")
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
        result := ComCall(70, this, "uint*", pdwPEKind, "uint*", pdwMAchine, "HRESULT")
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

        result := ComCall(71, this, "ptr", pwzBuf, "uint", ccBufSize, "uint*", pccBufSize, "HRESULT")
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
        result := ComCall(72, this, "ptr*", phEnum, "uint", tk, "uint*", rMethodSpecs, "uint", cMax, "uint*", pcMethodSpecs, "HRESULT")
        return result
    }
}

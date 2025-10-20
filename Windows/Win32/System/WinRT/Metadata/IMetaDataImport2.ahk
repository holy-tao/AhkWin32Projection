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
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} tk 
     * @param {Pointer<UInt32>} rGenericParams 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcGenericParams 
     * @returns {HRESULT} 
     */
    EnumGenericParams(phEnum, tk, rGenericParams, cMax, pcGenericParams) {
        result := ComCall(65, this, "ptr", phEnum, "uint", tk, "uint*", rGenericParams, "uint", cMax, "uint*", pcGenericParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} gp 
     * @param {Pointer<UInt32>} pulParamSeq 
     * @param {Pointer<UInt32>} pdwParamFlags 
     * @param {Pointer<UInt32>} ptOwner 
     * @param {Pointer<UInt32>} reserved 
     * @param {PWSTR} wzname 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @returns {HRESULT} 
     */
    GetGenericParamProps(gp, pulParamSeq, pdwParamFlags, ptOwner, reserved, wzname, cchName, pchName) {
        wzname := wzname is String ? StrPtr(wzname) : wzname

        result := ComCall(66, this, "uint", gp, "uint*", pulParamSeq, "uint*", pdwParamFlags, "uint*", ptOwner, "uint*", reserved, "ptr", wzname, "uint", cchName, "uint*", pchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mi 
     * @param {Pointer<UInt32>} tkParent 
     * @param {Pointer<Byte>} ppvSigBlob 
     * @param {Pointer<UInt32>} pcbSigBlob 
     * @returns {HRESULT} 
     */
    GetMethodSpecProps(mi, tkParent, ppvSigBlob, pcbSigBlob) {
        result := ComCall(67, this, "uint", mi, "uint*", tkParent, "char*", ppvSigBlob, "uint*", pcbSigBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} tk 
     * @param {Pointer<UInt32>} rGenericParamConstraints 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcGenericParamConstraints 
     * @returns {HRESULT} 
     */
    EnumGenericParamConstraints(phEnum, tk, rGenericParamConstraints, cMax, pcGenericParamConstraints) {
        result := ComCall(68, this, "ptr", phEnum, "uint", tk, "uint*", rGenericParamConstraints, "uint", cMax, "uint*", pcGenericParamConstraints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} gpc 
     * @param {Pointer<UInt32>} ptGenericParam 
     * @param {Pointer<UInt32>} ptkConstraintType 
     * @returns {HRESULT} 
     */
    GetGenericParamConstraintProps(gpc, ptGenericParam, ptkConstraintType) {
        result := ComCall(69, this, "uint", gpc, "uint*", ptGenericParam, "uint*", ptkConstraintType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPEKind 
     * @param {Pointer<UInt32>} pdwMAchine 
     * @returns {HRESULT} 
     */
    GetPEKind(pdwPEKind, pdwMAchine) {
        result := ComCall(70, this, "uint*", pdwPEKind, "uint*", pdwMAchine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzBuf 
     * @param {Integer} ccBufSize 
     * @param {Pointer<UInt32>} pccBufSize 
     * @returns {HRESULT} 
     */
    GetVersionString(pwzBuf, ccBufSize, pccBufSize) {
        pwzBuf := pwzBuf is String ? StrPtr(pwzBuf) : pwzBuf

        result := ComCall(71, this, "ptr", pwzBuf, "uint", ccBufSize, "uint*", pccBufSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} tk 
     * @param {Pointer<UInt32>} rMethodSpecs 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcMethodSpecs 
     * @returns {HRESULT} 
     */
    EnumMethodSpecs(phEnum, tk, rMethodSpecs, cMax, pcMethodSpecs) {
        result := ComCall(72, this, "ptr", phEnum, "uint", tk, "uint*", rMethodSpecs, "uint", cMax, "uint*", pcMethodSpecs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

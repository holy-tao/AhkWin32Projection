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
     * Gets an enumerator for an array of generic parameter tokens associated with the specified TypeDef or MethodDef token.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} tk The <b>TypeDef</b> or <b>MethodDef</b> token whose generic parameters are to be enumerated.
     * @param {Pointer<Integer>} rGenericParams The array of generic parameters to enumerate.
     * @param {Integer} cMax The requested maximum number of tokens to place in <i>rGenericParams</i>.
     * @param {Pointer<Integer>} pcGenericParams The returned number of tokens placed in <i>rGenericParams</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumGenericParams</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td><i>phEnum</i> has no member elements. In this case, <i>pcGenericParams</i> is set to 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-enumgenericparams
     */
    EnumGenericParams(phEnum, tk, rGenericParams, cMax, pcGenericParams) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rGenericParamsMarshal := rGenericParams is VarRef ? "uint*" : "ptr"
        pcGenericParamsMarshal := pcGenericParams is VarRef ? "uint*" : "ptr"

        result := ComCall(65, this, phEnumMarshal, phEnum, "uint", tk, rGenericParamsMarshal, rGenericParams, "uint", cMax, pcGenericParamsMarshal, pcGenericParams, "HRESULT")
        return result
    }

    /**
     * Gets the metadata associated with the generic parameter represented by the specified token.
     * @param {Integer} gp The token that represents the generic parameter for which to return metadata.
     * @param {Pointer<Integer>} pulParamSeq The ordinal position of the Type parameter in the parent constructor or method.
     * @param {Pointer<Integer>} pdwParamFlags A value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corgenericparamattr-enumeration">CorGenericParamAttr</a> enumeration that describes the Type for the generic parameter.
     * @param {Pointer<Integer>} ptOwner A  <b>TypeDef</b> or <b>MethodDef</b> token that represents the owner of the parameter.
     * @param {Pointer<Integer>} reserved Reserved for future extensibility.
     * @param {PWSTR} wzname The name of the generic parameter.
     * @param {Integer} cchName The size of the <i>wzName</i> buffer.
     * @param {Pointer<Integer>} pchName The returned size of the name, in wide characters.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-getgenericparamprops
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
     * Gets the metadata signature of the method referenced by the specified MethodSpec token.
     * @param {Integer} mi A <b>MethodSpec</b> token that represents the instantiation of the method.
     * @param {Pointer<Integer>} tkParent A pointer to the <b>MethodDef</b> or <b>MethodRef</b> token that represents the method definition.
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob A pointer to the binary metadata signature of the method.
     * @param {Pointer<Integer>} pcbSigBlob The size, in bytes, of <i>ppvSigBlob</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-getmethodspecprops
     */
    GetMethodSpecProps(mi, tkParent, ppvSigBlob, pcbSigBlob) {
        tkParentMarshal := tkParent is VarRef ? "uint*" : "ptr"
        ppvSigBlobMarshal := ppvSigBlob is VarRef ? "ptr*" : "ptr"
        pcbSigBlobMarshal := pcbSigBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(67, this, "uint", mi, tkParentMarshal, tkParent, ppvSigBlobMarshal, ppvSigBlob, pcbSigBlobMarshal, pcbSigBlob, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator for an array of generic parameter constraints associated with the generic parameter represented by the specified token.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} tk A token that represents the generic parameter whose constraints are to be enumerated.
     * @param {Pointer<Integer>} rGenericParamConstraints The array of generic parameter constraints to enumerate.
     * @param {Integer} cMax The requested maximum number of tokens to place in <i>rGenericParamConstraints</i>.
     * @param {Pointer<Integer>} pcGenericParamConstraints A pointer to the number of tokens placed in <i>rGenericParamConstraints</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumGenericParamConstraints</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td><i>phEnum</i> has no member elements. In this case, <i>pcGenericParameterConstraints</i> is set to 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-enumgenericparamconstraints
     */
    EnumGenericParamConstraints(phEnum, tk, rGenericParamConstraints, cMax, pcGenericParamConstraints) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rGenericParamConstraintsMarshal := rGenericParamConstraints is VarRef ? "uint*" : "ptr"
        pcGenericParamConstraintsMarshal := pcGenericParamConstraints is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, phEnumMarshal, phEnum, "uint", tk, rGenericParamConstraintsMarshal, rGenericParamConstraints, "uint", cMax, pcGenericParamConstraintsMarshal, pcGenericParamConstraints, "HRESULT")
        return result
    }

    /**
     * Gets the metadata associated with the generic parameter constraint represented by the specified constraint token.
     * @param {Integer} gpc The token to the generic parameter constraint for which to return the metadata.
     * @param {Pointer<Integer>} ptGenericParam A pointer to the token that represents the generic parameter that is constrained.
     * @param {Pointer<Integer>} ptkConstraintType A pointer to a <b>TypeDef</b>, <b>TypeRef</b>, or <b>TypeSpec</b> token that represents a constraint on ptGenericParam.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-getgenericparamconstraintprops
     */
    GetGenericParamConstraintProps(gpc, ptGenericParam, ptkConstraintType) {
        ptGenericParamMarshal := ptGenericParam is VarRef ? "uint*" : "ptr"
        ptkConstraintTypeMarshal := ptkConstraintType is VarRef ? "uint*" : "ptr"

        result := ComCall(69, this, "uint", gpc, ptGenericParamMarshal, ptGenericParam, ptkConstraintTypeMarshal, ptkConstraintType, "HRESULT")
        return result
    }

    /**
     * Gets a value identifying the nature of the code in the portable executable (PE) file, typically a DLL or EXE file, that is defined in the current metadata scope.
     * @param {Pointer<Integer>} pdwPEKind A pointer to a value of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corpekind-enumeration">CorPEKind</a> enumeration that describes the PE file.
     * @param {Pointer<Integer>} pdwMAchine A pointer to a value that identifies the architecture of the machine. See the next section for possible values.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-getpekind
     */
    GetPEKind(pdwPEKind, pdwMAchine) {
        pdwPEKindMarshal := pdwPEKind is VarRef ? "uint*" : "ptr"
        pdwMAchineMarshal := pdwMAchine is VarRef ? "uint*" : "ptr"

        result := ComCall(70, this, pdwPEKindMarshal, pdwPEKind, pdwMAchineMarshal, pdwMAchine, "HRESULT")
        return result
    }

    /**
     * Gets the version number of the runtime that was used to build the assembly.
     * @param {PWSTR} pwzBuf An array to store the string that specifies the version.
     * @param {Integer} ccBufSize The size, in wide characters, of the <i>pwzBuf</i> array.
     * @param {Pointer<Integer>} pccBufSize The number of wide characters, including a null terminator, returned in the <i>pwzBuf</i> array.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-getversionstring
     */
    GetVersionString(pwzBuf, ccBufSize, pccBufSize) {
        pwzBuf := pwzBuf is String ? StrPtr(pwzBuf) : pwzBuf

        pccBufSizeMarshal := pccBufSize is VarRef ? "uint*" : "ptr"

        result := ComCall(71, this, "ptr", pwzBuf, "uint", ccBufSize, pccBufSizeMarshal, pccBufSize, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator for an array of MethodSpec tokens associated with the specified MethodDef or MemberRef token.
     * @param {Pointer<Pointer<Void>>} phEnum pointer to the enumerator for <i>rMethodSpecs</i>.
     * @param {Integer} tk The <b>MemberRef</b> or <b>MethodDef</b> token that represents the method whose <b>MethodSpec</b> tokens are to be enumerated. If the value of <i>tk</i> is 0 (zero), all <b>MethodSpec</b> tokens in the scope will be enumerated.
     * @param {Pointer<Integer>} rMethodSpecs The array of <b>MethodSpec</b> tokens to enumerate.
     * @param {Integer} cMax The requested maximum number of tokens to place in <i>rMethodSpecs</i>.
     * @param {Pointer<Integer>} pcMethodSpecs The returned number of tokens placed in <i>rMethodSpecs</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMethodSpecs</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td><i>phEnum</i> has no member elements. In this case, <i>pcMethodSpecs</i> is set to 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport2-enummethodspecs
     */
    EnumMethodSpecs(phEnum, tk, rMethodSpecs, cMax, pcMethodSpecs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodSpecsMarshal := rMethodSpecs is VarRef ? "uint*" : "ptr"
        pcMethodSpecsMarshal := pcMethodSpecs is VarRef ? "uint*" : "ptr"

        result := ComCall(72, this, phEnumMarshal, phEnum, "uint", tk, rMethodSpecsMarshal, rMethodSpecs, "uint", cMax, pcMethodSpecsMarshal, pcMethodSpecs, "HRESULT")
        return result
    }
}

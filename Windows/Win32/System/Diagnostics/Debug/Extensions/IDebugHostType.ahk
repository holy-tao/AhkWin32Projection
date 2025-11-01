#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostType
     * @type {Guid}
     */
    static IID => Guid("{3aadc353-2b14-4abb-9893-5e03458e07ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeKind", "GetSize", "GetBaseType", "GetHashCode", "GetIntrinsicType", "GetBitField", "GetPointerKind", "GetMemberType", "CreatePointerTo", "GetArrayDimensionality", "GetArrayDimensions", "CreateArrayOf", "GetFunctionCallingConvention", "GetFunctionReturnType", "GetFunctionParameterTypeCount", "GetFunctionParameterTypeAt", "IsGeneric", "GetGenericArgumentCount", "GetGenericArgumentAt"]

    /**
     * 
     * @param {Pointer<Integer>} kind 
     * @returns {HRESULT} 
     */
    GetTypeKind(kind) {
        result := ComCall(10, this, "int*", kind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} size 
     * @returns {HRESULT} 
     */
    GetSize(size) {
        result := ComCall(11, this, "uint*", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} baseType 
     * @returns {HRESULT} 
     */
    GetBaseType(baseType) {
        result := ComCall(12, this, "ptr*", baseType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} hashCode 
     * @returns {HRESULT} 
     */
    GetHashCode(hashCode) {
        result := ComCall(13, this, "uint*", hashCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} intrinsicKind 
     * @param {Pointer<Integer>} carrierType 
     * @returns {HRESULT} 
     */
    GetIntrinsicType(intrinsicKind, carrierType) {
        result := ComCall(14, this, "int*", intrinsicKind, "ushort*", carrierType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lsbOfField 
     * @param {Pointer<Integer>} lengthOfField 
     * @returns {HRESULT} 
     */
    GetBitField(lsbOfField, lengthOfField) {
        result := ComCall(15, this, "uint*", lsbOfField, "uint*", lengthOfField, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pointerKind 
     * @returns {HRESULT} 
     */
    GetPointerKind(pointerKind) {
        result := ComCall(16, this, "int*", pointerKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} memberType 
     * @returns {HRESULT} 
     */
    GetMemberType(memberType) {
        result := ComCall(17, this, "ptr*", memberType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Pointer<IDebugHostType>} newType 
     * @returns {HRESULT} 
     */
    CreatePointerTo(kind, newType) {
        result := ComCall(18, this, "int", kind, "ptr*", newType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} arrayDimensionality 
     * @returns {HRESULT} 
     */
    GetArrayDimensionality(arrayDimensionality) {
        result := ComCall(19, this, "uint*", arrayDimensionality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @param {Pointer<ArrayDimension>} pDimensions 
     * @returns {HRESULT} 
     */
    GetArrayDimensions(dimensions, pDimensions) {
        result := ComCall(20, this, "uint", dimensions, "ptr", pDimensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @param {Pointer<ArrayDimension>} pDimensions 
     * @param {Pointer<IDebugHostType>} newType 
     * @returns {HRESULT} 
     */
    CreateArrayOf(dimensions, pDimensions, newType) {
        result := ComCall(21, this, "uint", dimensions, "ptr", pDimensions, "ptr*", newType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} conventionKind 
     * @returns {HRESULT} 
     */
    GetFunctionCallingConvention(conventionKind) {
        result := ComCall(22, this, "int*", conventionKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} returnType 
     * @returns {HRESULT} 
     */
    GetFunctionReturnType(returnType) {
        result := ComCall(23, this, "ptr*", returnType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     */
    GetFunctionParameterTypeCount(count) {
        result := ComCall(24, this, "uint*", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IDebugHostType>} parameterType 
     * @returns {HRESULT} 
     */
    GetFunctionParameterTypeAt(i, parameterType) {
        result := ComCall(25, this, "uint", i, "ptr*", parameterType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} isGeneric 
     * @returns {HRESULT} 
     */
    IsGeneric(isGeneric) {
        result := ComCall(26, this, "int*", isGeneric, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} argCount 
     * @returns {HRESULT} 
     */
    GetGenericArgumentCount(argCount) {
        result := ComCall(27, this, "uint*", argCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IDebugHostSymbol>} argument 
     * @returns {HRESULT} 
     */
    GetGenericArgumentAt(i, argument) {
        result := ComCall(28, this, "uint", i, "ptr*", argument, "HRESULT")
        return result
    }
}

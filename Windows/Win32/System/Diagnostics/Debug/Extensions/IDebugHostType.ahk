#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType extends IDebugHostSymbol{
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
     * 
     * @param {Pointer<Int32>} kind 
     * @returns {HRESULT} 
     */
    GetTypeKind(kind) {
        result := ComCall(10, this, "int*", kind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} size 
     * @returns {HRESULT} 
     */
    GetSize(size) {
        result := ComCall(11, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} baseType 
     * @returns {HRESULT} 
     */
    GetBaseType(baseType) {
        result := ComCall(12, this, "ptr", baseType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} hashCode 
     * @returns {HRESULT} 
     */
    GetHashCode(hashCode) {
        result := ComCall(13, this, "uint*", hashCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} intrinsicKind 
     * @param {Pointer<UInt16>} carrierType 
     * @returns {HRESULT} 
     */
    GetIntrinsicType(intrinsicKind, carrierType) {
        result := ComCall(14, this, "int*", intrinsicKind, "ushort*", carrierType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lsbOfField 
     * @param {Pointer<UInt32>} lengthOfField 
     * @returns {HRESULT} 
     */
    GetBitField(lsbOfField, lengthOfField) {
        result := ComCall(15, this, "uint*", lsbOfField, "uint*", lengthOfField, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pointerKind 
     * @returns {HRESULT} 
     */
    GetPointerKind(pointerKind) {
        result := ComCall(16, this, "int*", pointerKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} memberType 
     * @returns {HRESULT} 
     */
    GetMemberType(memberType) {
        result := ComCall(17, this, "ptr", memberType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {Pointer<IDebugHostType>} newType 
     * @returns {HRESULT} 
     */
    CreatePointerTo(kind, newType) {
        result := ComCall(18, this, "int", kind, "ptr", newType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} arrayDimensionality 
     * @returns {HRESULT} 
     */
    GetArrayDimensionality(arrayDimensionality) {
        result := ComCall(19, this, "uint*", arrayDimensionality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @param {Pointer<ArrayDimension>} pDimensions 
     * @returns {HRESULT} 
     */
    GetArrayDimensions(dimensions, pDimensions) {
        result := ComCall(20, this, "uint", dimensions, "ptr", pDimensions, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(21, this, "uint", dimensions, "ptr", pDimensions, "ptr", newType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} conventionKind 
     * @returns {HRESULT} 
     */
    GetFunctionCallingConvention(conventionKind) {
        result := ComCall(22, this, "int*", conventionKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} returnType 
     * @returns {HRESULT} 
     */
    GetFunctionReturnType(returnType) {
        result := ComCall(23, this, "ptr", returnType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} count 
     * @returns {HRESULT} 
     */
    GetFunctionParameterTypeCount(count) {
        result := ComCall(24, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IDebugHostType>} parameterType 
     * @returns {HRESULT} 
     */
    GetFunctionParameterTypeAt(i, parameterType) {
        result := ComCall(25, this, "uint", i, "ptr", parameterType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} isGeneric 
     * @returns {HRESULT} 
     */
    IsGeneric(isGeneric) {
        result := ComCall(26, this, "int*", isGeneric, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} argCount 
     * @returns {HRESULT} 
     */
    GetGenericArgumentCount(argCount) {
        result := ComCall(27, this, "uint*", argCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<IDebugHostSymbol>} argument 
     * @returns {HRESULT} 
     */
    GetGenericArgumentAt(i, argument) {
        result := ComCall(28, this, "uint", i, "ptr", argument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

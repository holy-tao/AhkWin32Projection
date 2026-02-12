#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType.ahk
#Include .\ArrayDimension.ahk
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
     * @returns {Integer} 
     */
    GetTypeKind() {
        result := ComCall(10, this, "int*", &kind := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return kind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSize() {
        result := ComCall(11, this, "uint*", &size_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return size_
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetBaseType() {
        result := ComCall(12, this, "ptr*", &baseType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostType(baseType)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHashCode() {
        result := ComCall(13, this, "uint*", &hashCode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hashCode
    }

    /**
     * 
     * @param {Pointer<Integer>} intrinsicKind_ 
     * @param {Pointer<Integer>} carrierType 
     * @returns {HRESULT} 
     */
    GetIntrinsicType(intrinsicKind_, carrierType) {
        intrinsicKind_Marshal := intrinsicKind_ is VarRef ? "int*" : "ptr"
        carrierTypeMarshal := carrierType is VarRef ? "ushort*" : "ptr"

        result := ComCall(14, this, intrinsicKind_Marshal, intrinsicKind_, carrierTypeMarshal, carrierType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lsbOfField 
     * @param {Pointer<Integer>} lengthOfField 
     * @returns {HRESULT} 
     */
    GetBitField(lsbOfField, lengthOfField) {
        lsbOfFieldMarshal := lsbOfField is VarRef ? "uint*" : "ptr"
        lengthOfFieldMarshal := lengthOfField is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, lsbOfFieldMarshal, lsbOfField, lengthOfFieldMarshal, lengthOfField, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPointerKind() {
        result := ComCall(16, this, "int*", &pointerKind_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pointerKind_
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetMemberType() {
        result := ComCall(17, this, "ptr*", &memberType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostType(memberType)
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {Pointer<IDebugHostType>} 
     */
    CreatePointerTo(kind) {
        result := ComCall(18, this, "int", kind, "ptr*", &newType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return newType
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArrayDimensionality() {
        result := ComCall(19, this, "uint*", &arrayDimensionality := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return arrayDimensionality
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @returns {ArrayDimension} 
     */
    GetArrayDimensions(dimensions) {
        pDimensions := ArrayDimension()
        result := ComCall(20, this, "uint", dimensions, "ptr", pDimensions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDimensions
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @param {Pointer<ArrayDimension>} pDimensions 
     * @returns {Pointer<IDebugHostType>} 
     */
    CreateArrayOf(dimensions, pDimensions) {
        result := ComCall(21, this, "uint", dimensions, "ptr", pDimensions, "ptr*", &newType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return newType
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFunctionCallingConvention() {
        result := ComCall(22, this, "int*", &conventionKind := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return conventionKind
    }

    /**
     * 
     * @returns {Pointer<IDebugHostType>} 
     */
    GetFunctionReturnType() {
        result := ComCall(23, this, "ptr*", &returnType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnType
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFunctionParameterTypeCount() {
        result := ComCall(24, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {IDebugHostType} 
     */
    GetFunctionParameterTypeAt(i) {
        result := ComCall(25, this, "uint", i, "ptr*", &parameterType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostType(parameterType)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsGeneric() {
        result := ComCall(26, this, "int*", &isGeneric := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isGeneric
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGenericArgumentCount() {
        result := ComCall(27, this, "uint*", &argCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return argCount
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {IDebugHostSymbol} 
     */
    GetGenericArgumentAt(i) {
        result := ComCall(28, this, "uint", i, "ptr*", &argument := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugHostSymbol(argument)
    }
}

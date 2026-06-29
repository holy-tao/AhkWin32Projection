#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IntrinsicKind.ahk" { IntrinsicKind }
#Import ".\PointerKind.ahk" { PointerKind }
#Import ".\CallingConventionKind.ahk" { CallingConventionKind }
#Import ".\TypeKind.ahk" { TypeKind }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }
#Import ".\ArrayDimension.ahk" { ArrayDimension }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostType extends IDebugHostSymbol {
    /**
     * The interface identifier for IDebugHostType
     * @type {Guid}
     */
    static IID := Guid("{3aadc353-2b14-4abb-9893-5e03458e07ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostType interfaces
    */
    struct Vtbl extends IDebugHostSymbol.Vtbl {
        GetTypeKind                   : IntPtr
        GetSize                       : IntPtr
        GetBaseType                   : IntPtr
        GetHashCode                   : IntPtr
        GetIntrinsicType              : IntPtr
        GetBitField                   : IntPtr
        GetPointerKind                : IntPtr
        GetMemberType                 : IntPtr
        CreatePointerTo               : IntPtr
        GetArrayDimensionality        : IntPtr
        GetArrayDimensions            : IntPtr
        CreateArrayOf                 : IntPtr
        GetFunctionCallingConvention  : IntPtr
        GetFunctionReturnType         : IntPtr
        GetFunctionParameterTypeCount : IntPtr
        GetFunctionParameterTypeAt    : IntPtr
        IsGeneric                     : IntPtr
        GetGenericArgumentCount       : IntPtr
        GetGenericArgumentAt          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {TypeKind} 
     */
    GetTypeKind() {
        result := ComCall(10, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSize() {
        result := ComCall(11, this, "uint*", &_size := 0, "HRESULT")
        return _size
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetBaseType() {
        result := ComCall(12, this, "ptr*", &baseType := 0, "HRESULT")
        return IDebugHostType(baseType)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHashCode() {
        result := ComCall(13, this, "uint*", &hashCode := 0, "HRESULT")
        return hashCode
    }

    /**
     * 
     * @param {Pointer<IntrinsicKind>} _intrinsicKind 
     * @param {Pointer<Integer>} carrierType 
     * @returns {HRESULT} 
     */
    GetIntrinsicType(_intrinsicKind, carrierType) {
        _intrinsicKindMarshal := _intrinsicKind is VarRef ? "int*" : "ptr"
        carrierTypeMarshal := carrierType is VarRef ? "ushort*" : "ptr"

        result := ComCall(14, this, _intrinsicKindMarshal, _intrinsicKind, carrierTypeMarshal, carrierType, "HRESULT")
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

        result := ComCall(15, this, lsbOfFieldMarshal, lsbOfField, lengthOfFieldMarshal, lengthOfField, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PointerKind} 
     */
    GetPointerKind() {
        result := ComCall(16, this, "int*", &_pointerKind := 0, "HRESULT")
        return _pointerKind
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetMemberType() {
        result := ComCall(17, this, "ptr*", &memberType := 0, "HRESULT")
        return IDebugHostType(memberType)
    }

    /**
     * 
     * @param {PointerKind} kind 
     * @returns {IDebugHostType} 
     */
    CreatePointerTo(kind) {
        result := ComCall(18, this, PointerKind, kind, "ptr*", &newType := 0, "HRESULT")
        return IDebugHostType(newType)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArrayDimensionality() {
        result := ComCall(19, this, "uint*", &arrayDimensionality := 0, "HRESULT")
        return arrayDimensionality
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @returns {ArrayDimension} 
     */
    GetArrayDimensions(dimensions) {
        pDimensions := ArrayDimension()
        result := ComCall(20, this, "uint", dimensions, ArrayDimension.Ptr, pDimensions, "HRESULT")
        return pDimensions
    }

    /**
     * 
     * @param {Integer} dimensions 
     * @param {Pointer<ArrayDimension>} pDimensions 
     * @returns {IDebugHostType} 
     */
    CreateArrayOf(dimensions, pDimensions) {
        result := ComCall(21, this, "uint", dimensions, ArrayDimension.Ptr, pDimensions, "ptr*", &newType := 0, "HRESULT")
        return IDebugHostType(newType)
    }

    /**
     * 
     * @returns {CallingConventionKind} 
     */
    GetFunctionCallingConvention() {
        result := ComCall(22, this, "int*", &conventionKind := 0, "HRESULT")
        return conventionKind
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetFunctionReturnType() {
        result := ComCall(23, this, "ptr*", &returnType := 0, "HRESULT")
        return IDebugHostType(returnType)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFunctionParameterTypeCount() {
        result := ComCall(24, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {IDebugHostType} 
     */
    GetFunctionParameterTypeAt(i) {
        result := ComCall(25, this, "uint", i, "ptr*", &parameterType := 0, "HRESULT")
        return IDebugHostType(parameterType)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsGeneric() {
        result := ComCall(26, this, "int*", &isGeneric := 0, "HRESULT")
        return isGeneric
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGenericArgumentCount() {
        result := ComCall(27, this, "uint*", &argCount := 0, "HRESULT")
        return argCount
    }

    /**
     * 
     * @param {Integer} i 
     * @returns {IDebugHostSymbol} 
     */
    GetGenericArgumentAt(i) {
        result := ComCall(28, this, "uint", i, "ptr*", &argument := 0, "HRESULT")
        return IDebugHostSymbol(argument)
    }

    Query(iid) {
        if (IDebugHostType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTypeKind := CallbackCreate(GetMethod(implObj, "GetTypeKind"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 2)
        this.vtbl.GetBaseType := CallbackCreate(GetMethod(implObj, "GetBaseType"), flags, 2)
        this.vtbl.GetHashCode := CallbackCreate(GetMethod(implObj, "GetHashCode"), flags, 2)
        this.vtbl.GetIntrinsicType := CallbackCreate(GetMethod(implObj, "GetIntrinsicType"), flags, 3)
        this.vtbl.GetBitField := CallbackCreate(GetMethod(implObj, "GetBitField"), flags, 3)
        this.vtbl.GetPointerKind := CallbackCreate(GetMethod(implObj, "GetPointerKind"), flags, 2)
        this.vtbl.GetMemberType := CallbackCreate(GetMethod(implObj, "GetMemberType"), flags, 2)
        this.vtbl.CreatePointerTo := CallbackCreate(GetMethod(implObj, "CreatePointerTo"), flags, 3)
        this.vtbl.GetArrayDimensionality := CallbackCreate(GetMethod(implObj, "GetArrayDimensionality"), flags, 2)
        this.vtbl.GetArrayDimensions := CallbackCreate(GetMethod(implObj, "GetArrayDimensions"), flags, 3)
        this.vtbl.CreateArrayOf := CallbackCreate(GetMethod(implObj, "CreateArrayOf"), flags, 4)
        this.vtbl.GetFunctionCallingConvention := CallbackCreate(GetMethod(implObj, "GetFunctionCallingConvention"), flags, 2)
        this.vtbl.GetFunctionReturnType := CallbackCreate(GetMethod(implObj, "GetFunctionReturnType"), flags, 2)
        this.vtbl.GetFunctionParameterTypeCount := CallbackCreate(GetMethod(implObj, "GetFunctionParameterTypeCount"), flags, 2)
        this.vtbl.GetFunctionParameterTypeAt := CallbackCreate(GetMethod(implObj, "GetFunctionParameterTypeAt"), flags, 3)
        this.vtbl.IsGeneric := CallbackCreate(GetMethod(implObj, "IsGeneric"), flags, 2)
        this.vtbl.GetGenericArgumentCount := CallbackCreate(GetMethod(implObj, "GetGenericArgumentCount"), flags, 2)
        this.vtbl.GetGenericArgumentAt := CallbackCreate(GetMethod(implObj, "GetGenericArgumentAt"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTypeKind)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetBaseType)
        CallbackFree(this.vtbl.GetHashCode)
        CallbackFree(this.vtbl.GetIntrinsicType)
        CallbackFree(this.vtbl.GetBitField)
        CallbackFree(this.vtbl.GetPointerKind)
        CallbackFree(this.vtbl.GetMemberType)
        CallbackFree(this.vtbl.CreatePointerTo)
        CallbackFree(this.vtbl.GetArrayDimensionality)
        CallbackFree(this.vtbl.GetArrayDimensions)
        CallbackFree(this.vtbl.CreateArrayOf)
        CallbackFree(this.vtbl.GetFunctionCallingConvention)
        CallbackFree(this.vtbl.GetFunctionReturnType)
        CallbackFree(this.vtbl.GetFunctionParameterTypeCount)
        CallbackFree(this.vtbl.GetFunctionParameterTypeAt)
        CallbackFree(this.vtbl.IsGeneric)
        CallbackFree(this.vtbl.GetGenericArgumentCount)
        CallbackFree(this.vtbl.GetGenericArgumentAt)
    }
}

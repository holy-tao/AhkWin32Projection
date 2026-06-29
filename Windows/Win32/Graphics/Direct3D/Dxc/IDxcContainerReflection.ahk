#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcContainerReflection extends IUnknown {
    /**
     * The interface identifier for IDxcContainerReflection
     * @type {Guid}
     */
    static IID := Guid("{d2c21b26-8350-4bdc-976a-331ce6f4c54c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcContainerReflection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Load              : IntPtr
        GetPartCount      : IntPtr
        GetPartKind       : IntPtr
        GetPartContent    : IntPtr
        FindFirstPartKind : IntPtr
        GetPartReflection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcContainerReflection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {IDxcBlob} pContainer 
     * @returns {HRESULT} <span id="Object"></span><span id="object"></span><span id="OBJECT"></span>*Object*
     * 
     * A [texture-object](dx-graphics-hlsl-to-type.md) type (except TextureCube or TextureCubeArray).
     * 
     * 
     * <span id="Location"></span><span id="location"></span><span id="LOCATION"></span>*Location*
     * 
     * \[in\] The texture coordinates; the last component specifies the mipmap level. This method uses a 0-based coordinate system and not a 0.0-1.0 UV system. The argument type is dependent on the texture-object type.
     * 
     * 
     * 
     * | Object Type                                  | Parameter Type |
     * |----------------------------------------------|----------------|
     * | Buffer                                       | int            |
     * | Texture1D, Texture2DMS                       | int2           |
     * | Texture1DArray, Texture2D, Texture2DMSArray  | int3           |
     * | Texture2DArray, Texture3D                    | int4           |
     * 
     * 
     * 
     *  
     * 
     * For example, to access a 2D texture, supply integer texel coordinates for the first two components and a mipmap level for the third component.
     * 
     * > [!Note]  
     * > When one or more of the coordinates in *Location* exceed the u, v, or w mipmap level dimensions of the texture, **Load** returns zero in all components. Direct3D guarantees to return zero for any resource that is accessed out of bounds.
     * 
     *  
     * 
     * 
     * <span id="SampleIndex"></span><span id="sampleindex"></span><span id="SAMPLEINDEX"></span>*SampleIndex*
     * 
     * \[in\] A sampling index. Required for multi-sample textures. Not supported for other textures.
     * 
     * 
     * 
     * | Texture Type                                                                                                   | Parameter Type |
     * |----------------------------------------------------------------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray, Texture2D, Texture2DArray, Texture3D, Texture2DArray, TextureCube, TextureCubeArray | not supported  |
     * | Texture2DMS, Texture2DMSArray¹                                                                                 | int            |
     * 
     * 
     * <span id="Offset"></span><span id="offset"></span><span id="OFFSET"></span>*Offset*
     * 
     * \[in\] An optional offset applied to the texture coordinates before sampling. The offset type is dependent on the texture-object type, and needs to be static.
     * 
     * 
     * 
     * | Texture Type                                             | Parameter Type |
     * |----------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray                                | int            |
     * | Texture2D, Texture2DArray, Texture2DMS, Texture2DMSArray | int2           |
     * | Texture3D                                                | int3           |
     * 
     * 
     * 
     *  
     * 
     * > [!Note]  
     * > *SampleIndex* must always be specified first with multi-sample textures.
     * 
     *  
     * 
     * 
     * 
     * The return type matches the type in the *Object* declaration. For example, a Texture2D object that was declared as "Texture2d&lt;uint4&gt; myTexture;" has a return value of type **uint4**.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(pContainer) {
        result := ComCall(3, this, "ptr", pContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPartCount() {
        result := ComCall(4, this, "uint*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} idx 
     * @returns {Integer} 
     */
    GetPartKind(idx) {
        result := ComCall(5, this, "uint", idx, "uint*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} idx 
     * @returns {IDxcBlob} 
     */
    GetPartContent(idx) {
        result := ComCall(6, this, "uint", idx, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlob(ppResult)
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {Integer} 
     */
    FindFirstPartKind(kind) {
        result := ComCall(7, this, "uint", kind, "uint*", &pResult := 0, "HRESULT")
        return pResult
    }

    /**
     * 
     * @param {Integer} idx 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    GetPartReflection(idx, iid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "uint", idx, Guid.Ptr, iid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDxcContainerReflection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 2)
        this.vtbl.GetPartCount := CallbackCreate(GetMethod(implObj, "GetPartCount"), flags, 2)
        this.vtbl.GetPartKind := CallbackCreate(GetMethod(implObj, "GetPartKind"), flags, 3)
        this.vtbl.GetPartContent := CallbackCreate(GetMethod(implObj, "GetPartContent"), flags, 3)
        this.vtbl.FindFirstPartKind := CallbackCreate(GetMethod(implObj, "FindFirstPartKind"), flags, 3)
        this.vtbl.GetPartReflection := CallbackCreate(GetMethod(implObj, "GetPartReflection"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.GetPartCount)
        CallbackFree(this.vtbl.GetPartKind)
        CallbackFree(this.vtbl.GetPartContent)
        CallbackFree(this.vtbl.FindFirstPartKind)
        CallbackFree(this.vtbl.GetPartReflection)
    }
}

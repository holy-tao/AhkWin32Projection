#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IBindCtx.ahk" { IBindCtx }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IMoniker.ahk" { IMoniker }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IPersistMoniker extends IUnknown {
    /**
     * The interface identifier for IPersistMoniker
     * @type {Guid}
     */
    static IID := Guid("{79eac9c9-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistMoniker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClassID    : IntPtr
        IsDirty       : IntPtr
        Load          : IntPtr
        Save          : IntPtr
        SaveCompleted : IntPtr
        GetCurMoniker : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistMoniker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetClassID() {
        pClassID := Guid()
        result := ComCall(3, this, Guid.Ptr, pClassID, "HRESULT")
        return pClassID
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(4, this, Int32)
        return result
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {BOOL} fFullyAvailable 
     * @param {IMoniker} pimkName 
     * @param {IBindCtx} pibc 
     * @param {Integer} grfMode 
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
    Load(fFullyAvailable, pimkName, pibc, grfMode) {
        result := ComCall(5, this, BOOL, fFullyAvailable, "ptr", pimkName, "ptr", pibc, "uint", grfMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pimkName 
     * @param {IBindCtx} pbc 
     * @param {BOOL} fRemember 
     * @returns {HRESULT} 
     */
    Save(pimkName, pbc, fRemember) {
        result := ComCall(6, this, "ptr", pimkName, "ptr", pbc, BOOL, fRemember, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pimkName 
     * @param {IBindCtx} pibc 
     * @returns {HRESULT} 
     */
    SaveCompleted(pimkName, pibc) {
        result := ComCall(7, this, "ptr", pimkName, "ptr", pibc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMoniker} 
     */
    GetCurMoniker() {
        result := ComCall(8, this, "ptr*", &ppimkName := 0, "HRESULT")
        return IMoniker(ppimkName)
    }

    Query(iid) {
        if (IPersistMoniker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClassID := CallbackCreate(GetMethod(implObj, "GetClassID"), flags, 2)
        this.vtbl.IsDirty := CallbackCreate(GetMethod(implObj, "IsDirty"), flags, 1)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 5)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 4)
        this.vtbl.SaveCompleted := CallbackCreate(GetMethod(implObj, "SaveCompleted"), flags, 3)
        this.vtbl.GetCurMoniker := CallbackCreate(GetMethod(implObj, "GetCurMoniker"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClassID)
        CallbackFree(this.vtbl.IsDirty)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.SaveCompleted)
        CallbackFree(this.vtbl.GetCurMoniker)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IErrorLog.ahk" { IErrorLog }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IPersist.ahk" { IPersist }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\StructuredStorage\IPropertyBag2.ahk" { IPropertyBag2 }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IPersistPropertyBag2 extends IPersist {
    /**
     * The interface identifier for IPersistPropertyBag2
     * @type {Guid}
     */
    static IID := Guid("{22f55881-280b-11d0-a8a9-00a0c90c2004}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistPropertyBag2 interfaces
    */
    struct Vtbl extends IPersist.Vtbl {
        InitNew : IntPtr
        Load    : IntPtr
        Save    : IntPtr
        IsDirty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistPropertyBag2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {IPropertyBag2} pPropBag 
     * @param {IErrorLog} pErrLog 
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
    Load(pPropBag, pErrLog) {
        result := ComCall(5, this, "ptr", pPropBag, "ptr", pErrLog, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyBag2} pPropBag 
     * @param {BOOL} fClearDirty 
     * @param {BOOL} fSaveAllProperties 
     * @returns {HRESULT} 
     */
    Save(pPropBag, fClearDirty, fSaveAllProperties) {
        result := ComCall(6, this, "ptr", pPropBag, BOOL, fClearDirty, BOOL, fSaveAllProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(7, this, Int32)
        return result
    }

    Query(iid) {
        if (IPersistPropertyBag2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitNew := CallbackCreate(GetMethod(implObj, "InitNew"), flags, 1)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 3)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 4)
        this.vtbl.IsDirty := CallbackCreate(GetMethod(implObj, "IsDirty"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitNew)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.IsDirty)
    }
}

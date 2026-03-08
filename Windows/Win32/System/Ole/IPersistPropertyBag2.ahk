#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IPersist.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPersistPropertyBag2 extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistPropertyBag2
     * @type {Guid}
     */
    static IID => Guid("{22f55881-280b-11d0-a8a9-00a0c90c2004}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitNew", "Load", "Save", "IsDirty"]

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
     * The SaveBookmark method saves the current disc position and state of the MSWebDVD object so the user can return to the same place later.
     * @remarks
     * A bookmark is a snapshot of the DVD Navigator's current state. This includes information such as where it is playing on the disc, and which audio and subpictures streams are selected. By saving a bookmark, the user can close the application, shut down the computer, and come back later to continue viewing the disc right where he or she left off, with all settings just as they were before. Only one bookmark can be saved at any given time. When you call `SaveBookmark`, the old bookmark is overwritten.
     * @param {IPropertyBag2} pPropBag 
     * @param {BOOL} fClearDirty 
     * @param {BOOL} fSaveAllProperties 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/savebookmark-method
     */
    Save(pPropBag, fClearDirty, fSaveAllProperties) {
        result := ComCall(6, this, "ptr", pPropBag, "int", fClearDirty, "int", fSaveAllProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDirty() {
        result := ComCall(7, this, "int")
        return result
    }
}

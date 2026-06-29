#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcVersionInfo.ahk" { IDxcVersionInfo }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDxcBlob.ahk" { IDxcBlob }
#Import ".\IDxcBlobUtf16.ahk" { IDxcBlobUtf16 }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcPdbUtils2 extends IUnknown {
    /**
     * The interface identifier for IDxcPdbUtils2
     * @type {Guid}
     */
    static IID := Guid("{4315d938-f369-4f93-95a2-252017cc3807}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcPdbUtils2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Load                   : IntPtr
        GetSourceCount         : IntPtr
        GetSource              : IntPtr
        GetSourceName          : IntPtr
        GetLibraryPDBCount     : IntPtr
        GetLibraryPDB          : IntPtr
        GetFlagCount           : IntPtr
        GetFlag                : IntPtr
        GetArgCount            : IntPtr
        GetArg                 : IntPtr
        GetArgPairCount        : IntPtr
        GetArgPair             : IntPtr
        GetDefineCount         : IntPtr
        GetDefine              : IntPtr
        GetTargetProfile       : IntPtr
        GetEntryPoint          : IntPtr
        GetMainFileName        : IntPtr
        GetHash                : IntPtr
        GetName                : IntPtr
        GetVersionInfo         : IntPtr
        GetCustomToolchainID   : IntPtr
        GetCustomToolchainData : IntPtr
        GetWholeDxil           : IntPtr
        IsFullPDB              : IntPtr
        IsPDBRef               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcPdbUtils2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {IDxcBlob} pPdbOrDxil 
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
    Load(pPdbOrDxil) {
        result := ComCall(3, this, "ptr", pPdbOrDxil, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSourceCount() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {IDxcBlobEncoding} 
     */
    GetSource(uIndex) {
        result := ComCall(5, this, "uint", uIndex, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobEncoding(ppResult)
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {IDxcBlobUtf16} 
     */
    GetSourceName(uIndex) {
        result := ComCall(6, this, "uint", uIndex, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetLibraryPDBCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IDxcPdbUtils2>} ppOutPdbUtils 
     * @param {Pointer<IDxcBlobUtf16>} ppLibraryName 
     * @returns {HRESULT} 
     */
    GetLibraryPDB(uIndex, ppOutPdbUtils, ppLibraryName) {
        result := ComCall(8, this, "uint", uIndex, IDxcPdbUtils2.Ptr, ppOutPdbUtils, IDxcBlobUtf16.Ptr, ppLibraryName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlagCount() {
        result := ComCall(9, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {IDxcBlobUtf16} 
     */
    GetFlag(uIndex) {
        result := ComCall(10, this, "uint", uIndex, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgCount() {
        result := ComCall(11, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {IDxcBlobUtf16} 
     */
    GetArg(uIndex) {
        result := ComCall(12, this, "uint", uIndex, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgPairCount() {
        result := ComCall(13, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IDxcBlobUtf16>} ppName 
     * @param {Pointer<IDxcBlobUtf16>} ppValue 
     * @returns {HRESULT} 
     */
    GetArgPair(uIndex, ppName, ppValue) {
        result := ComCall(14, this, "uint", uIndex, IDxcBlobUtf16.Ptr, ppName, IDxcBlobUtf16.Ptr, ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDefineCount() {
        result := ComCall(15, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {IDxcBlobUtf16} 
     */
    GetDefine(uIndex) {
        result := ComCall(16, this, "uint", uIndex, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @returns {IDxcBlobUtf16} 
     */
    GetTargetProfile() {
        result := ComCall(17, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @returns {IDxcBlobUtf16} 
     */
    GetEntryPoint() {
        result := ComCall(18, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @returns {IDxcBlobUtf16} 
     */
    GetMainFileName() {
        result := ComCall(19, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @returns {IDxcBlob} 
     */
    GetHash() {
        result := ComCall(20, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlob(ppResult)
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {IDxcBlobUtf16} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        result := ComCall(21, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlobUtf16(ppResult)
    }

    /**
     * 
     * @returns {IDxcVersionInfo} 
     */
    GetVersionInfo() {
        result := ComCall(22, this, "ptr*", &ppVersionInfo := 0, "HRESULT")
        return IDxcVersionInfo(ppVersionInfo)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCustomToolchainID() {
        result := ComCall(23, this, "uint*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * 
     * @returns {IDxcBlob} 
     */
    GetCustomToolchainData() {
        result := ComCall(24, this, "ptr*", &ppBlob := 0, "HRESULT")
        return IDxcBlob(ppBlob)
    }

    /**
     * 
     * @returns {IDxcBlob} 
     */
    GetWholeDxil() {
        result := ComCall(25, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlob(ppResult)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsFullPDB() {
        result := ComCall(26, this, BOOL)
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsPDBRef() {
        result := ComCall(27, this, BOOL)
        return result
    }

    Query(iid) {
        if (IDxcPdbUtils2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 2)
        this.vtbl.GetSourceCount := CallbackCreate(GetMethod(implObj, "GetSourceCount"), flags, 2)
        this.vtbl.GetSource := CallbackCreate(GetMethod(implObj, "GetSource"), flags, 3)
        this.vtbl.GetSourceName := CallbackCreate(GetMethod(implObj, "GetSourceName"), flags, 3)
        this.vtbl.GetLibraryPDBCount := CallbackCreate(GetMethod(implObj, "GetLibraryPDBCount"), flags, 2)
        this.vtbl.GetLibraryPDB := CallbackCreate(GetMethod(implObj, "GetLibraryPDB"), flags, 4)
        this.vtbl.GetFlagCount := CallbackCreate(GetMethod(implObj, "GetFlagCount"), flags, 2)
        this.vtbl.GetFlag := CallbackCreate(GetMethod(implObj, "GetFlag"), flags, 3)
        this.vtbl.GetArgCount := CallbackCreate(GetMethod(implObj, "GetArgCount"), flags, 2)
        this.vtbl.GetArg := CallbackCreate(GetMethod(implObj, "GetArg"), flags, 3)
        this.vtbl.GetArgPairCount := CallbackCreate(GetMethod(implObj, "GetArgPairCount"), flags, 2)
        this.vtbl.GetArgPair := CallbackCreate(GetMethod(implObj, "GetArgPair"), flags, 4)
        this.vtbl.GetDefineCount := CallbackCreate(GetMethod(implObj, "GetDefineCount"), flags, 2)
        this.vtbl.GetDefine := CallbackCreate(GetMethod(implObj, "GetDefine"), flags, 3)
        this.vtbl.GetTargetProfile := CallbackCreate(GetMethod(implObj, "GetTargetProfile"), flags, 2)
        this.vtbl.GetEntryPoint := CallbackCreate(GetMethod(implObj, "GetEntryPoint"), flags, 2)
        this.vtbl.GetMainFileName := CallbackCreate(GetMethod(implObj, "GetMainFileName"), flags, 2)
        this.vtbl.GetHash := CallbackCreate(GetMethod(implObj, "GetHash"), flags, 2)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetVersionInfo := CallbackCreate(GetMethod(implObj, "GetVersionInfo"), flags, 2)
        this.vtbl.GetCustomToolchainID := CallbackCreate(GetMethod(implObj, "GetCustomToolchainID"), flags, 2)
        this.vtbl.GetCustomToolchainData := CallbackCreate(GetMethod(implObj, "GetCustomToolchainData"), flags, 2)
        this.vtbl.GetWholeDxil := CallbackCreate(GetMethod(implObj, "GetWholeDxil"), flags, 2)
        this.vtbl.IsFullPDB := CallbackCreate(GetMethod(implObj, "IsFullPDB"), flags, 1)
        this.vtbl.IsPDBRef := CallbackCreate(GetMethod(implObj, "IsPDBRef"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.GetSourceCount)
        CallbackFree(this.vtbl.GetSource)
        CallbackFree(this.vtbl.GetSourceName)
        CallbackFree(this.vtbl.GetLibraryPDBCount)
        CallbackFree(this.vtbl.GetLibraryPDB)
        CallbackFree(this.vtbl.GetFlagCount)
        CallbackFree(this.vtbl.GetFlag)
        CallbackFree(this.vtbl.GetArgCount)
        CallbackFree(this.vtbl.GetArg)
        CallbackFree(this.vtbl.GetArgPairCount)
        CallbackFree(this.vtbl.GetArgPair)
        CallbackFree(this.vtbl.GetDefineCount)
        CallbackFree(this.vtbl.GetDefine)
        CallbackFree(this.vtbl.GetTargetProfile)
        CallbackFree(this.vtbl.GetEntryPoint)
        CallbackFree(this.vtbl.GetMainFileName)
        CallbackFree(this.vtbl.GetHash)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetVersionInfo)
        CallbackFree(this.vtbl.GetCustomToolchainID)
        CallbackFree(this.vtbl.GetCustomToolchainData)
        CallbackFree(this.vtbl.GetWholeDxil)
        CallbackFree(this.vtbl.IsFullPDB)
        CallbackFree(this.vtbl.IsPDBRef)
    }
}

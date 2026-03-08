#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcBlobEncoding.ahk
#Include .\IDxcBlobUtf16.ahk
#Include .\IDxcBlob.ahk
#Include .\IDxcVersionInfo.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcPdbUtils2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcPdbUtils2
     * @type {Guid}
     */
    static IID => Guid("{4315d938-f369-4f93-95a2-252017cc3807}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Load", "GetSourceCount", "GetSource", "GetSourceName", "GetLibraryPDBCount", "GetLibraryPDB", "GetFlagCount", "GetFlag", "GetArgCount", "GetArg", "GetArgPairCount", "GetArgPair", "GetDefineCount", "GetDefine", "GetTargetProfile", "GetEntryPoint", "GetMainFileName", "GetHash", "GetName", "GetVersionInfo", "GetCustomToolchainID", "GetCustomToolchainData", "GetWholeDxil", "IsFullPDB", "IsPDBRef"]

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
        result := ComCall(8, this, "uint", uIndex, "ptr*", ppOutPdbUtils, "ptr*", ppLibraryName, "HRESULT")
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
        result := ComCall(14, this, "uint", uIndex, "ptr*", ppName, "ptr*", ppValue, "HRESULT")
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
        result := ComCall(26, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsPDBRef() {
        result := ComCall(27, this, "int")
        return result
    }
}

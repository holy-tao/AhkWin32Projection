#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcBlobEncoding.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IDxcBlob.ahk
#Include .\IDxcVersionInfo.ahk
#Include .\IDxcResult.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcPdbUtils extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcPdbUtils
     * @type {Guid}
     */
    static IID => Guid("{e6c9647e-9d6a-4c3b-b94c-524b5a6c343d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Load", "GetSourceCount", "GetSource", "GetSourceName", "GetFlagCount", "GetFlag", "GetArgCount", "GetArg", "GetArgPairCount", "GetArgPair", "GetDefineCount", "GetDefine", "GetTargetProfile", "GetEntryPoint", "GetMainFileName", "GetHash", "GetName", "IsFullPDB", "GetFullPDB", "GetVersionInfo", "SetCompiler", "CompileForFullPDB", "OverrideArgs", "OverrideRootSignature"]

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(pPdbOrDxil) {
        result := ComCall(3, this, "ptr", pPdbOrDxil, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSourceCount() {
        result := ComCall(4, this, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    GetSource(uIndex) {
        result := ComCall(5, this, "uint", uIndex, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     */
    GetSourceName(uIndex) {
        pResult := BSTR()
        result := ComCall(6, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlagCount() {
        result := ComCall(7, this, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     */
    GetFlag(uIndex) {
        pResult := BSTR()
        result := ComCall(8, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgCount() {
        result := ComCall(9, this, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     */
    GetArg(uIndex) {
        pResult := BSTR()
        result := ComCall(10, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgPairCount() {
        result := ComCall(11, this, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pName 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetArgPair(uIndex, pName, pValue) {
        result := ComCall(12, this, "uint", uIndex, "ptr", pName, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDefineCount() {
        result := ComCall(13, this, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     */
    GetDefine(uIndex) {
        pResult := BSTR()
        result := ComCall(14, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetTargetProfile() {
        pResult := BSTR()
        result := ComCall(15, this, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetEntryPoint() {
        pResult := BSTR()
        result := ComCall(16, this, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetMainFileName() {
        pResult := BSTR()
        result := ComCall(17, this, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {Pointer<IDxcBlob>} 
     */
    GetHash() {
        result := ComCall(18, this, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        pResult := BSTR()
        result := ComCall(19, this, "ptr", pResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pResult
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsFullPDB() {
        result := ComCall(20, this, "int")
        return result
    }

    /**
     * 
     * @returns {Pointer<IDxcBlob>} 
     */
    GetFullPDB() {
        result := ComCall(21, this, "ptr*", &ppFullPDB := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppFullPDB
    }

    /**
     * 
     * @returns {Pointer<IDxcVersionInfo>} 
     */
    GetVersionInfo() {
        result := ComCall(22, this, "ptr*", &ppVersionInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVersionInfo
    }

    /**
     * 
     * @param {IDxcCompiler3} pCompiler 
     * @returns {HRESULT} 
     */
    SetCompiler(pCompiler) {
        result := ComCall(23, this, "ptr", pCompiler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Pointer<IDxcResult>} 
     */
    CompileForFullPDB() {
        result := ComCall(24, this, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }

    /**
     * 
     * @param {Pointer<DxcArgPair>} pArgPairs 
     * @param {Integer} uNumArgPairs 
     * @returns {HRESULT} 
     */
    OverrideArgs(pArgPairs, uNumArgPairs) {
        result := ComCall(25, this, "ptr", pArgPairs, "uint", uNumArgPairs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pRootSignature 
     * @returns {HRESULT} 
     */
    OverrideRootSignature(pRootSignature) {
        pRootSignature := pRootSignature is String ? StrPtr(pRootSignature) : pRootSignature

        result := ComCall(26, this, "ptr", pRootSignature, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

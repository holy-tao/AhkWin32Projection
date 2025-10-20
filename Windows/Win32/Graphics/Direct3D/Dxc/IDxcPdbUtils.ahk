#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcPdbUtils extends IUnknown{
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
     * 
     * @param {Pointer<IDxcBlob>} pPdbOrDxil 
     * @returns {HRESULT} 
     */
    Load(pPdbOrDxil) {
        result := ComCall(3, this, "ptr", pPdbOrDxil, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetSourceCount(pCount) {
        result := ComCall(4, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IDxcBlobEncoding>} ppResult 
     * @returns {HRESULT} 
     */
    GetSource(uIndex, ppResult) {
        result := ComCall(5, this, "uint", uIndex, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetSourceName(uIndex, pResult) {
        result := ComCall(6, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetFlagCount(pCount) {
        result := ComCall(7, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetFlag(uIndex, pResult) {
        result := ComCall(8, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetArgCount(pCount) {
        result := ComCall(9, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetArg(uIndex, pResult) {
        result := ComCall(10, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetArgPairCount(pCount) {
        result := ComCall(11, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetDefineCount(pCount) {
        result := ComCall(13, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetDefine(uIndex, pResult) {
        result := ComCall(14, this, "uint", uIndex, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetTargetProfile(pResult) {
        result := ComCall(15, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetEntryPoint(pResult) {
        result := ComCall(16, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetMainFileName(pResult) {
        result := ComCall(17, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    GetHash(ppResult) {
        result := ComCall(18, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetName(pResult) {
        result := ComCall(19, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
     * @param {Pointer<IDxcBlob>} ppFullPDB 
     * @returns {HRESULT} 
     */
    GetFullPDB(ppFullPDB) {
        result := ComCall(21, this, "ptr", ppFullPDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcVersionInfo>} ppVersionInfo 
     * @returns {HRESULT} 
     */
    GetVersionInfo(ppVersionInfo) {
        result := ComCall(22, this, "ptr", ppVersionInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcCompiler3>} pCompiler 
     * @returns {HRESULT} 
     */
    SetCompiler(pCompiler) {
        result := ComCall(23, this, "ptr", pCompiler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcResult>} ppResult 
     * @returns {HRESULT} 
     */
    CompileForFullPDB(ppResult) {
        result := ComCall(24, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DxcArgPair>} pArgPairs 
     * @param {Integer} uNumArgPairs 
     * @returns {HRESULT} 
     */
    OverrideArgs(pArgPairs, uNumArgPairs) {
        result := ComCall(25, this, "ptr", pArgPairs, "uint", uNumArgPairs, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }
}

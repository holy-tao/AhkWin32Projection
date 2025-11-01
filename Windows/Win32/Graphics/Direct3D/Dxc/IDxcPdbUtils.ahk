#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {IDxcBlob} pPdbOrDxil 
     * @returns {HRESULT} 
     */
    Load(pPdbOrDxil) {
        result := ComCall(3, this, "ptr", pPdbOrDxil, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetSourceCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IDxcBlobEncoding>} ppResult 
     * @returns {HRESULT} 
     */
    GetSource(uIndex, ppResult) {
        result := ComCall(5, this, "uint", uIndex, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetSourceName(uIndex, pResult) {
        result := ComCall(6, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetFlagCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetFlag(uIndex, pResult) {
        result := ComCall(8, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetArgCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetArg(uIndex, pResult) {
        result := ComCall(10, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetArgPairCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pCountMarshal, pCount, "HRESULT")
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
        result := ComCall(12, this, "uint", uIndex, "ptr", pName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetDefineCount(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetDefine(uIndex, pResult) {
        result := ComCall(14, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetTargetProfile(pResult) {
        result := ComCall(15, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetEntryPoint(pResult) {
        result := ComCall(16, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetMainFileName(pResult) {
        result := ComCall(17, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    GetHash(ppResult) {
        result := ComCall(18, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetName(pResult) {
        result := ComCall(19, this, "ptr", pResult, "HRESULT")
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
        result := ComCall(21, this, "ptr*", ppFullPDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcVersionInfo>} ppVersionInfo 
     * @returns {HRESULT} 
     */
    GetVersionInfo(ppVersionInfo) {
        result := ComCall(22, this, "ptr*", ppVersionInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDxcCompiler3} pCompiler 
     * @returns {HRESULT} 
     */
    SetCompiler(pCompiler) {
        result := ComCall(23, this, "ptr", pCompiler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcResult>} ppResult 
     * @returns {HRESULT} 
     */
    CompileForFullPDB(ppResult) {
        result := ComCall(24, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DxcArgPair>} pArgPairs 
     * @param {Integer} uNumArgPairs 
     * @returns {HRESULT} 
     */
    OverrideArgs(pArgPairs, uNumArgPairs) {
        result := ComCall(25, this, "ptr", pArgPairs, "uint", uNumArgPairs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pRootSignature 
     * @returns {HRESULT} 
     */
    OverrideRootSignature(pRootSignature) {
        pRootSignature := pRootSignature is String ? StrPtr(pRootSignature) : pRootSignature

        result := ComCall(26, this, "ptr", pRootSignature, "HRESULT")
        return result
    }
}

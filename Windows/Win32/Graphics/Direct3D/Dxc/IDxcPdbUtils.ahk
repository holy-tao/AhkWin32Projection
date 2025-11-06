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
     * @returns {BSTR} 
     */
    GetSourceName(uIndex) {
        pResult := BSTR()
        result := ComCall(6, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlagCount() {
        result := ComCall(7, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     */
    GetFlag(uIndex) {
        pResult := BSTR()
        result := ComCall(8, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgCount() {
        result := ComCall(9, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     */
    GetArg(uIndex) {
        pResult := BSTR()
        result := ComCall(10, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetArgPairCount() {
        result := ComCall(11, this, "uint*", &pCount := 0, "HRESULT")
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
        result := ComCall(12, this, "uint", uIndex, "ptr", pName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDefineCount() {
        result := ComCall(13, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {BSTR} 
     */
    GetDefine(uIndex) {
        pResult := BSTR()
        result := ComCall(14, this, "uint", uIndex, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetTargetProfile() {
        pResult := BSTR()
        result := ComCall(15, this, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetEntryPoint() {
        pResult := BSTR()
        result := ComCall(16, this, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetMainFileName() {
        pResult := BSTR()
        result := ComCall(17, this, "ptr", pResult, "HRESULT")
        return pResult
    }

    /**
     * 
     * @returns {IDxcBlob} 
     */
    GetHash() {
        result := ComCall(18, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlob(ppResult)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetName() {
        pResult := BSTR()
        result := ComCall(19, this, "ptr", pResult, "HRESULT")
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
     * @returns {IDxcBlob} 
     */
    GetFullPDB() {
        result := ComCall(21, this, "ptr*", &ppFullPDB := 0, "HRESULT")
        return IDxcBlob(ppFullPDB)
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
     * @param {IDxcCompiler3} pCompiler 
     * @returns {HRESULT} 
     */
    SetCompiler(pCompiler) {
        result := ComCall(23, this, "ptr", pCompiler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDxcResult} 
     */
    CompileForFullPDB() {
        result := ComCall(24, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcResult(ppResult)
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

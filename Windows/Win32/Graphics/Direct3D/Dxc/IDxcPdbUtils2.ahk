#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
        result := ComCall(4, this, "uint*", pCount, "HRESULT")
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
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetSourceName(uIndex, ppResult) {
        result := ComCall(6, this, "uint", uIndex, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetLibraryPDBCount(pCount) {
        result := ComCall(7, this, "uint*", pCount, "HRESULT")
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
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetFlagCount(pCount) {
        result := ComCall(9, this, "uint*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetFlag(uIndex, ppResult) {
        result := ComCall(10, this, "uint", uIndex, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetArgCount(pCount) {
        result := ComCall(11, this, "uint*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetArg(uIndex, ppResult) {
        result := ComCall(12, this, "uint", uIndex, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetArgPairCount(pCount) {
        result := ComCall(13, this, "uint*", pCount, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetDefineCount(pCount) {
        result := ComCall(15, this, "uint*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetDefine(uIndex, ppResult) {
        result := ComCall(16, this, "uint", uIndex, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetTargetProfile(ppResult) {
        result := ComCall(17, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetEntryPoint(ppResult) {
        result := ComCall(18, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetMainFileName(ppResult) {
        result := ComCall(19, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    GetHash(ppResult) {
        result := ComCall(20, this, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlobUtf16>} ppResult 
     * @returns {HRESULT} 
     */
    GetName(ppResult) {
        result := ComCall(21, this, "ptr*", ppResult, "HRESULT")
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
     * @param {Pointer<Integer>} pID 
     * @returns {HRESULT} 
     */
    GetCustomToolchainID(pID) {
        result := ComCall(23, this, "uint*", pID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} ppBlob 
     * @returns {HRESULT} 
     */
    GetCustomToolchainData(ppBlob) {
        result := ComCall(24, this, "ptr*", ppBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    GetWholeDxil(ppResult) {
        result := ComCall(25, this, "ptr*", ppResult, "HRESULT")
        return result
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

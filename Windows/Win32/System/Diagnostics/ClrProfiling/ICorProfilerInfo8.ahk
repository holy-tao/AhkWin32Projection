#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo7.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo8 extends ICorProfilerInfo7{
    /**
     * The interface identifier for ICorProfilerInfo8
     * @type {Guid}
     */
    static IID => Guid("{c5ac80a6-782e-4716-8044-39598c60cfbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 87

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<BOOL>} isDynamic 
     * @returns {HRESULT} 
     */
    IsFunctionDynamic(functionId, isDynamic) {
        result := ComCall(87, this, "ptr", functionId, "ptr", isDynamic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ip 
     * @param {Pointer<UIntPtr>} functionId 
     * @param {Pointer<UIntPtr>} pReJitId 
     * @returns {HRESULT} 
     */
    GetFunctionFromIP3(ip, functionId, pReJitId) {
        result := ComCall(88, this, "char*", ip, "ptr*", functionId, "ptr*", pReJitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<UIntPtr>} moduleId 
     * @param {Pointer<Byte>} ppvSig 
     * @param {Pointer<UInt32>} pbSig 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pcchName 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     */
    GetDynamicFunctionInfo(functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := ComCall(89, this, "ptr", functionId, "ptr*", moduleId, "char*", ppvSig, "uint*", pbSig, "uint", cchName, "uint*", pcchName, "ptr", wszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

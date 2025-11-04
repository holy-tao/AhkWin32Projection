#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo7.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo8 extends ICorProfilerInfo7{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsFunctionDynamic", "GetFunctionFromIP3", "GetDynamicFunctionInfo"]

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<BOOL>} isDynamic 
     * @returns {HRESULT} 
     */
    IsFunctionDynamic(functionId, isDynamic) {
        result := ComCall(87, this, "ptr", functionId, "ptr", isDynamic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ip 
     * @param {Pointer<Pointer>} functionId 
     * @param {Pointer<Pointer>} pReJitId 
     * @returns {HRESULT} 
     */
    GetFunctionFromIP3(ip, functionId, pReJitId) {
        ipMarshal := ip is VarRef ? "char*" : "ptr"
        functionIdMarshal := functionId is VarRef ? "ptr*" : "ptr"
        pReJitIdMarshal := pReJitId is VarRef ? "ptr*" : "ptr"

        result := ComCall(88, this, ipMarshal, ip, functionIdMarshal, functionId, pReJitIdMarshal, pReJitId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<Pointer>} moduleId 
     * @param {Pointer<Pointer<Integer>>} ppvSig 
     * @param {Pointer<Integer>} pbSig 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcchName 
     * @param {PWSTR} wszName 
     * @returns {HRESULT} 
     */
    GetDynamicFunctionInfo(functionId, moduleId, ppvSig, pbSig, cchName, pcchName, wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        moduleIdMarshal := moduleId is VarRef ? "ptr*" : "ptr"
        ppvSigMarshal := ppvSig is VarRef ? "ptr*" : "ptr"
        pbSigMarshal := pbSig is VarRef ? "uint*" : "ptr"
        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(89, this, "ptr", functionId, moduleIdMarshal, moduleId, ppvSigMarshal, ppvSig, pbSigMarshal, pbSig, "uint", cchName, pcchNameMarshal, pcchName, "ptr", wszName, "HRESULT")
        return result
    }
}

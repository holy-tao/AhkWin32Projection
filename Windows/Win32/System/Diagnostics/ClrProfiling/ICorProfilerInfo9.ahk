#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo8.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo9 extends ICorProfilerInfo8{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo9
     * @type {Guid}
     */
    static IID => Guid("{008170db-f8cc-4796-9a51-dc8aa0b47012}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 90

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNativeCodeStartAddresses", "GetILToNativeMapping3", "GetCodeInfo4"]

    /**
     * 
     * @param {Pointer} functionID 
     * @param {Pointer} reJitId 
     * @param {Integer} cCodeStartAddresses 
     * @param {Pointer<Integer>} pcCodeStartAddresses 
     * @param {Pointer<Pointer>} codeStartAddresses 
     * @returns {HRESULT} 
     */
    GetNativeCodeStartAddresses(functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses) {
        result := ComCall(90, this, "ptr", functionID, "ptr", reJitId, "uint", cCodeStartAddresses, "uint*", pcCodeStartAddresses, "ptr*", codeStartAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pNativeCodeStartAddress 
     * @param {Integer} cMap 
     * @param {Pointer<Integer>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping3(pNativeCodeStartAddress, cMap, pcMap, map) {
        result := ComCall(91, this, "ptr", pNativeCodeStartAddress, "uint", cMap, "uint*", pcMap, "ptr", map, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pNativeCodeStartAddress 
     * @param {Integer} cCodeInfos 
     * @param {Pointer<Integer>} pcCodeInfos 
     * @param {Pointer<COR_PRF_CODE_INFO>} codeInfos 
     * @returns {HRESULT} 
     */
    GetCodeInfo4(pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos) {
        result := ComCall(92, this, "ptr", pNativeCodeStartAddress, "uint", cCodeInfos, "uint*", pcCodeInfos, "ptr", codeInfos, "HRESULT")
        return result
    }
}

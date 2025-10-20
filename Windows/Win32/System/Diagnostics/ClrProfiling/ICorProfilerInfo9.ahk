#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo8.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo9 extends ICorProfilerInfo8{
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
     * 
     * @param {Pointer} functionID 
     * @param {Pointer} reJitId 
     * @param {Integer} cCodeStartAddresses 
     * @param {Pointer<UInt32>} pcCodeStartAddresses 
     * @param {Pointer<UIntPtr>} codeStartAddresses 
     * @returns {HRESULT} 
     */
    GetNativeCodeStartAddresses(functionID, reJitId, cCodeStartAddresses, pcCodeStartAddresses, codeStartAddresses) {
        result := ComCall(90, this, "ptr", functionID, "ptr", reJitId, "uint", cCodeStartAddresses, "uint*", pcCodeStartAddresses, "ptr*", codeStartAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pNativeCodeStartAddress 
     * @param {Integer} cMap 
     * @param {Pointer<UInt32>} pcMap 
     * @param {Pointer<COR_DEBUG_IL_TO_NATIVE_MAP>} map 
     * @returns {HRESULT} 
     */
    GetILToNativeMapping3(pNativeCodeStartAddress, cMap, pcMap, map) {
        result := ComCall(91, this, "ptr", pNativeCodeStartAddress, "uint", cMap, "uint*", pcMap, "ptr", map, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pNativeCodeStartAddress 
     * @param {Integer} cCodeInfos 
     * @param {Pointer<UInt32>} pcCodeInfos 
     * @param {Pointer<COR_PRF_CODE_INFO>} codeInfos 
     * @returns {HRESULT} 
     */
    GetCodeInfo4(pNativeCodeStartAddress, cCodeInfos, pcCodeInfos, codeInfos) {
        result := ComCall(92, this, "ptr", pNativeCodeStartAddress, "uint", cCodeInfos, "uint*", pcCodeInfos, "ptr", codeInfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo5.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo6 extends ICorProfilerInfo5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo6
     * @type {Guid}
     */
    static IID => Guid("{f30a070d-bffb-46a7-b1d8-8781ef7b698a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 83

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumNgenModuleMethodsInliningThisMethod"]

    /**
     * 
     * @param {Pointer} inlinersModuleId 
     * @param {Pointer} inlineeModuleId 
     * @param {Integer} inlineeMethodId 
     * @param {Pointer<BOOL>} incompleteData 
     * @param {Pointer<ICorProfilerMethodEnum>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumNgenModuleMethodsInliningThisMethod(inlinersModuleId, inlineeModuleId, inlineeMethodId, incompleteData, ppEnum) {
        result := ComCall(83, this, "ptr", inlinersModuleId, "ptr", inlineeModuleId, "uint", inlineeMethodId, "ptr", incompleteData, "ptr*", ppEnum, "HRESULT")
        return result
    }
}

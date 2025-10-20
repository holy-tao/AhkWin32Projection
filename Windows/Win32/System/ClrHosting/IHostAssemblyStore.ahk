#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostAssemblyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostAssemblyStore
     * @type {Guid}
     */
    static IID => Guid("{7b102a88-3f7f-496d-8fa2-c35374e01af3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProvideAssembly", "ProvideModule"]

    /**
     * 
     * @param {Pointer<AssemblyBindInfo>} pBindInfo 
     * @param {Pointer<Integer>} pAssemblyId 
     * @param {Pointer<Integer>} pContext 
     * @param {Pointer<IStream>} ppStmAssemblyImage 
     * @param {Pointer<IStream>} ppStmPDB 
     * @returns {HRESULT} 
     */
    ProvideAssembly(pBindInfo, pAssemblyId, pContext, ppStmAssemblyImage, ppStmPDB) {
        result := ComCall(3, this, "ptr", pBindInfo, "uint*", pAssemblyId, "uint*", pContext, "ptr*", ppStmAssemblyImage, "ptr*", ppStmPDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ModuleBindInfo>} pBindInfo 
     * @param {Pointer<Integer>} pdwModuleId 
     * @param {Pointer<IStream>} ppStmModuleImage 
     * @param {Pointer<IStream>} ppStmPDB 
     * @returns {HRESULT} 
     */
    ProvideModule(pBindInfo, pdwModuleId, ppStmModuleImage, ppStmPDB) {
        result := ComCall(4, this, "ptr", pBindInfo, "uint*", pdwModuleId, "ptr*", ppStmModuleImage, "ptr*", ppStmPDB, "HRESULT")
        return result
    }
}

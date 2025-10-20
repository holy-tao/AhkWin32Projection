#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostAssemblyStore extends IUnknown{
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
     * 
     * @param {Pointer<AssemblyBindInfo>} pBindInfo 
     * @param {Pointer<UInt64>} pAssemblyId 
     * @param {Pointer<UInt64>} pContext 
     * @param {Pointer<IStream>} ppStmAssemblyImage 
     * @param {Pointer<IStream>} ppStmPDB 
     * @returns {HRESULT} 
     */
    ProvideAssembly(pBindInfo, pAssemblyId, pContext, ppStmAssemblyImage, ppStmPDB) {
        result := ComCall(3, this, "ptr", pBindInfo, "uint*", pAssemblyId, "uint*", pContext, "ptr", ppStmAssemblyImage, "ptr", ppStmPDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ModuleBindInfo>} pBindInfo 
     * @param {Pointer<UInt32>} pdwModuleId 
     * @param {Pointer<IStream>} ppStmModuleImage 
     * @param {Pointer<IStream>} ppStmPDB 
     * @returns {HRESULT} 
     */
    ProvideModule(pBindInfo, pdwModuleId, ppStmModuleImage, ppStmPDB) {
        result := ComCall(4, this, "ptr", pBindInfo, "uint*", pdwModuleId, "ptr", ppStmModuleImage, "ptr", ppStmPDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

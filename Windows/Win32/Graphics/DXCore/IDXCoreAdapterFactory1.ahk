#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXCoreAdapterFactory.ahk

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapterFactory1 extends IDXCoreAdapterFactory{
    /**
     * The interface identifier for IDXCoreAdapterFactory1
     * @type {Guid}
     */
    static IID => Guid("{d5682e19-6d21-401c-827a-9a51a4ea35d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} workload 
     * @param {Integer} runtimeFilter 
     * @param {Integer} hardwareTypeFilter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvAdapterList 
     * @returns {HRESULT} 
     */
    CreateAdapterListByWorkload(workload, runtimeFilter, hardwareTypeFilter, riid, ppvAdapterList) {
        result := ComCall(8, this, "uint", workload, "uint", runtimeFilter, "uint", hardwareTypeFilter, "ptr", riid, "ptr", ppvAdapterList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

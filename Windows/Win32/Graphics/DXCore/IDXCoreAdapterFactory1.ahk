#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXCoreAdapterFactory.ahk

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapterFactory1 extends IDXCoreAdapterFactory{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAdapterListByWorkload"]

    /**
     * 
     * @param {Integer} workload 
     * @param {Integer} runtimeFilter 
     * @param {Integer} hardwareTypeFilter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvAdapterList 
     * @returns {HRESULT} 
     */
    CreateAdapterListByWorkload(workload, runtimeFilter, hardwareTypeFilter, riid, ppvAdapterList) {
        ppvAdapterListMarshal := ppvAdapterList is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "uint", workload, "uint", runtimeFilter, "uint", hardwareTypeFilter, "ptr", riid, ppvAdapterListMarshal, ppvAdapterList, "HRESULT")
        return result
    }
}

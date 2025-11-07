#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BucketParameters.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRErrorReportingManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRErrorReportingManager
     * @type {Guid}
     */
    static IID => Guid("{980d2f1a-bf79-4c08-812a-bb9778928f78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBucketParametersForCurrentException", "BeginCustomDump", "EndCustomDump"]

    /**
     * 
     * @returns {BucketParameters} 
     */
    GetBucketParametersForCurrentException() {
        pParams := BucketParameters()
        result := ComCall(3, this, "ptr", pParams, "HRESULT")
        return pParams
    }

    /**
     * 
     * @param {Integer} dwFlavor 
     * @param {Integer} dwNumItems 
     * @param {Pointer<CustomDumpItem>} items 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    BeginCustomDump(dwFlavor, dwNumItems, items, dwReserved) {
        result := ComCall(4, this, "int", dwFlavor, "uint", dwNumItems, "ptr", items, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndCustomDump() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}

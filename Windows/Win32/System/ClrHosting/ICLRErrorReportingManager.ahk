#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRErrorReportingManager extends IUnknown{
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
     * 
     * @param {Pointer<BucketParameters>} pParams 
     * @returns {HRESULT} 
     */
    GetBucketParametersForCurrentException(pParams) {
        result := ComCall(3, this, "ptr", pParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
        result := ComCall(4, this, "int", dwFlavor, "uint", dwNumItems, "ptr", items, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndCustomDump() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

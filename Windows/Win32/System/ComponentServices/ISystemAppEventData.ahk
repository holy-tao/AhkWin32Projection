#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber when a COM+ application instance is created or reconfigured.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isystemappeventdata
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISystemAppEventData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemAppEventData
     * @type {Guid}
     */
    static IID => Guid("{d6d48a3c-d5c5-49e7-8c74-99e4889ed52f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Startup", "OnDataChanged"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isystemappeventdata-startup
     */
    Startup() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPID 
     * @param {Integer} dwMask 
     * @param {Integer} dwNumberSinks 
     * @param {BSTR} bstrDwMethodMask 
     * @param {Integer} dwReason 
     * @param {Integer} u64TraceHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isystemappeventdata-ondatachanged
     */
    OnDataChanged(dwPID, dwMask, dwNumberSinks, bstrDwMethodMask, dwReason, u64TraceHandle) {
        bstrDwMethodMask := bstrDwMethodMask is String ? BSTR.Alloc(bstrDwMethodMask).Value : bstrDwMethodMask

        result := ComCall(4, this, "uint", dwPID, "uint", dwMask, "uint", dwNumberSinks, "ptr", bstrDwMethodMask, "uint", dwReason, "uint", u64TraceHandle, "HRESULT")
        return result
    }
}

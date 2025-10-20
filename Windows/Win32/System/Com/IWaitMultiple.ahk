#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IWaitMultiple extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWaitMultiple
     * @type {Guid}
     */
    static IID => Guid("{0000002b-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WaitMultiple", "AddSynchronize"]

    /**
     * 
     * @param {Integer} timeout 
     * @param {Pointer<ISynchronize>} pSync 
     * @returns {HRESULT} 
     */
    WaitMultiple(timeout, pSync) {
        result := ComCall(3, this, "uint", timeout, "ptr*", pSync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISynchronize} pSync 
     * @returns {HRESULT} 
     */
    AddSynchronize(pSync) {
        result := ComCall(4, this, "ptr", pSync, "HRESULT")
        return result
    }
}

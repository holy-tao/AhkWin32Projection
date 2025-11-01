#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostAutoEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostAutoEvent
     * @type {Guid}
     */
    static IID => Guid("{50b0cfce-4063-4278-9673-e5cb4ed0bdb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Wait", "Set"]

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    Wait(dwMilliseconds, option) {
        result := ComCall(3, this, "uint", dwMilliseconds, "uint", option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Set() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}

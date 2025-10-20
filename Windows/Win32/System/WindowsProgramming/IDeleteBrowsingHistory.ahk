#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IDeleteBrowsingHistory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeleteBrowsingHistory
     * @type {Guid}
     */
    static IID => Guid("{cf38ed4b-2be7-4461-8b5e-9a466dc82ae3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteBrowsingHistory"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    DeleteBrowsingHistory(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }
}

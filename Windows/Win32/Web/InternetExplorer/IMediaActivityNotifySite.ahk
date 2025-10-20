#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IMediaActivityNotifySite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaActivityNotifySite
     * @type {Guid}
     */
    static IID => Guid("{8165cfef-179d-46c2-bc71-3fa726dc1f8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnMediaActivityStarted", "OnMediaActivityStopped"]

    /**
     * 
     * @param {Integer} mediaActivityType 
     * @returns {HRESULT} 
     */
    OnMediaActivityStarted(mediaActivityType) {
        result := ComCall(3, this, "int", mediaActivityType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mediaActivityType 
     * @returns {HRESULT} 
     */
    OnMediaActivityStopped(mediaActivityType) {
        result := ComCall(4, this, "int", mediaActivityType, "HRESULT")
        return result
    }
}

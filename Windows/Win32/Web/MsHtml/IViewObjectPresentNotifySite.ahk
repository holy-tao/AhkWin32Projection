#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IViewObjectPresentSite.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IViewObjectPresentNotifySite extends IViewObjectPresentSite{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObjectPresentNotifySite
     * @type {Guid}
     */
    static IID => Guid("{305107fa-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestFrame"]

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestFrame() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}

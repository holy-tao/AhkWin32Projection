#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the window list.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiwindowlist
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIWindowList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIWindowList
     * @type {Guid}
     */
    static IID => Guid("{8a05ce44-715a-4116-a189-a118f30a07bd}")

    /**
     * The class identifier for RDPSRAPIWindowList
     * @type {Guid}
     */
    static CLSID => Guid("{9c21e2b8-5dd4-42cc-81ba-1c099852e6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item"]

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindowlist-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} item 
     * @param {Pointer<IRDPSRAPIWindow>} pWindow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindowlist-get_item
     */
    get_Item(item, pWindow) {
        result := ComCall(8, this, "int", item, "ptr*", pWindow, "HRESULT")
        return result
    }
}

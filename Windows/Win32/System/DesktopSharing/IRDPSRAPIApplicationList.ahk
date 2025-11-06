#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IRDPSRAPIApplication.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the application list.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiapplicationlist
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIApplicationList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIApplicationList
     * @type {Guid}
     */
    static IID => Guid("{d4b4aeb3-22dc-4837-b3b6-42ea2517849a}")

    /**
     * The class identifier for RDPSRAPIApplicationList
     * @type {Guid}
     */
    static CLSID => Guid("{9e31c815-7433-4876-97fb-ed59fe2baa22}")

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
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationlist-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @param {Integer} item 
     * @returns {IRDPSRAPIApplication} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationlist-get_item
     */
    get_Item(item) {
        result := ComCall(8, this, "int", item, "ptr*", &pApplication := 0, "HRESULT")
        return IRDPSRAPIApplication(pApplication)
    }
}

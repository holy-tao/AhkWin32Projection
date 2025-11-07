#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IRDPSRAPIAttendee.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages attendee objects.
 * @remarks
 * 
 * The lifetime of the objects in this collection is controlled by the network layer.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiattendeemanager
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIAttendeeManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIAttendeeManager
     * @type {Guid}
     */
    static IID => Guid("{ba3a37e8-33da-4749-8da0-07fa34da7944}")

    /**
     * The class identifier for RDPSRAPIAttendeeManager
     * @type {Guid}
     */
    static CLSID => Guid("{d7b13a01-f7d4-42a6-8595-12fc8c24e851}")

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
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeemanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {IRDPSRAPIAttendee} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeemanager-get_item
     */
    get_Item(id) {
        result := ComCall(8, this, "int", id, "ptr*", &ppItem := 0, "HRESULT")
        return IRDPSRAPIAttendee(ppItem)
    }
}

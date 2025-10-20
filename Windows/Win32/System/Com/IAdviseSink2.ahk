#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAdviseSink.ahk

/**
 * The IAdviseSink2 interface is an extension of the IAdviseSink interface, adding the method OnLinkSrcChange to the contract to handle a change in the moniker of a linked object.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iadvisesink2
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAdviseSink2 extends IAdviseSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdviseSink2
     * @type {Guid}
     */
    static IID => Guid("{00000125-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLinkSrcChange"]

    /**
     * 
     * @param {IMoniker} pmk 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iadvisesink2-onlinksrcchange
     */
    OnLinkSrcChange(pmk) {
        ComCall(8, this, "ptr", pmk)
    }
}

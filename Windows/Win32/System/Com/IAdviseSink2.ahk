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
     * Notifies the container that registered the advise sink that a link source has changed (either name or location), enabling the container to update the link's moniker.
     * @remarks
     * 
     * A container of linked objects implements this method to receive notification in the event of a change in the moniker of its link source.
     * 
     * <b>OnLinkSrcChange</b> is called by the OLE link object when it receives the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">OnRename</a> notification from the link-source (object) application. The link object updates its moniker and sends the <b>OnLinkSrcChange</b> notification to containers that have implemented <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink2">IAdviseSink2</a>.
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Nothing prevents a link object from notifying its container of the moniker change by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onrename">OnRename</a> instead of <b>OnLinkSrcChange</b>. In practice, however, overloading <b>OnRename</b> to mean either that a link object's moniker has changed or that an embedded object's server name has changed makes it difficult for applications to determine which of these events has occurred. If the two events trigger different processing, as will often be the case, calling a different method for each makes the job of determining which event occurred much easier.
     * 
     * 
     * @param {IMoniker} pmk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface identifying the source of a linked object.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-iadvisesink2-onlinksrcchange
     */
    OnLinkSrcChange(pmk) {
        ComCall(8, this, "ptr", pmk)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxServerNotify2 interface is used for fax notifications. (IIFaxServerNotify2)
 * @remarks
 * <h3><a id="To_Use_Fax_Notification_Events_with_Visual_Basic"></a><a id="to_use_fax_notification_events_with_visual_basic"></a><a id="TO_USE_FAX_NOTIFICATION_EVENTS_WITH_VISUAL_BASIC"></a>To Use Fax Notification Events with Visual Basic</h3>
 * Use the following syntax when creating the root FaxServer2 object:
 * 
 * 
 * 
 * ```
 * 
 * Dim WithEvents objFaxServer2 As FaxServer2
 * 
 * ```
 * 
 * 
 * 
 * 
 * For an example, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-registering-for-fax-events">Registering for Fax Events</a>.
 *             
 * 
 * <h3><a id="To_Use_Fax_Notification_Events_with_C__"></a><a id="to_use_fax_notification_events_with_c__"></a><a id="TO_USE_FAX_NOTIFICATION_EVENTS_WITH_C__"></a>To Use Fax Notification Events with C++</h3>
 * A fax client application must implement <b>IFaxServerNotify2</b> and pass the fax service the pointer to an <b>IFaxServerNotify2</b> interface.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxservernotify2
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxServerNotify extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxServerNotify
     * @type {Guid}
     */
    static IID => Guid("{2e037b27-cf8a-4abd-b1e0-5704943bea6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}

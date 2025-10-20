#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsNotifyEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsNotifyEvent
     * @type {Guid}
     */
    static IID => Guid("{412bd695-f84b-46c1-ac73-54196dbc8fa7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KsNotifyEvent"]

    /**
     * 
     * @param {Integer} Event 
     * @param {Pointer} lParam1 
     * @param {Pointer} lParam2 
     * @returns {HRESULT} 
     */
    KsNotifyEvent(Event, lParam1, lParam2) {
        result := ComCall(3, this, "uint", Event, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }
}

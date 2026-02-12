#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Profile drivers implement a Bluetooth GATT event callback to be called whenever the value of a specific characteristic changes.
 * @see https://learn.microsoft.com/windows/win32/api//content/bthledef/nc-bthledef-pfnbluetooth_gatt_event_callback
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class PFNBLUETOOTH_GATT_EVENT_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} EventType 
     * @param {Pointer<Void>} EventOutParameter 
     * @param {Pointer<Void>} Context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(EventType, EventOutParameter, Context_) {
        EventOutParameterMarshal := EventOutParameter is VarRef ? "ptr" : "ptr"
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "int", EventType, EventOutParameterMarshal, EventOutParameter, Context_Marshal, Context_)
    }
}

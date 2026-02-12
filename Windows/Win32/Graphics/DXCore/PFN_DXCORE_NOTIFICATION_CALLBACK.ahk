#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback function (implemented by your application), which is called by a DXCore object for notification events.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxcore_interface/nc-dxcore_interface-pfn_dxcore_notification_callback
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class PFN_DXCORE_NOTIFICATION_CALLBACK extends IUnknown {

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
     * @param {Integer} notificationType 
     * @param {IUnknown} object_ 
     * @param {Pointer<Void>} context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(notificationType, object_, context_) {
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", notificationType, "ptr", object_, context_Marshal, context_)
    }
}

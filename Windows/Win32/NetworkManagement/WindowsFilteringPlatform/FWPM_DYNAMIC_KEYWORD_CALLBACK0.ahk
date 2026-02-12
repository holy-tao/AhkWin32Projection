#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback function, which you implement, that is invoked with notifications regarding changes to dynamic keyword address ([FW_DYNAMIC_KEYWORD_ADDRESS0](/windows/win32/api/netfw/ns-netfw-fw_dynamic_keyword_address0)) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/fwpmu/nc-fwpmu-fwpm_dynamic_keyword_callback0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_DYNAMIC_KEYWORD_CALLBACK0 extends IUnknown {

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
     * @param {Pointer<Void>} notification_ 
     * @param {Pointer<Void>} context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(notification_, context_) {
        notification_Marshal := notification_ is VarRef ? "ptr" : "ptr"
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, notification_Marshal, notification_, context_Marshal, context_)
    }
}

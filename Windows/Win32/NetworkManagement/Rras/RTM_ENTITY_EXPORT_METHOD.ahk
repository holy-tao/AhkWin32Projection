#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RTM_ENTITY_EXPORT_METHODS structure contains the set of methods exported by a client.
 * @see https://learn.microsoft.com/windows/win32/api//content/rtmv2/ns-rtmv2-rtm_entity_export_methods
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_ENTITY_EXPORT_METHOD extends IUnknown {

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
     * @param {Pointer} CallerHandle 
     * @param {Pointer} CalleeHandle 
     * @param {Pointer<RTM_ENTITY_METHOD_INPUT>} Input_ 
     * @param {Pointer<RTM_ENTITY_METHOD_OUTPUT>} Output 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CallerHandle, CalleeHandle, Input_, Output) {
        ComCall(3, this, "ptr", CallerHandle, "ptr", CalleeHandle, "ptr", Input_, "ptr", Output)
    }
}

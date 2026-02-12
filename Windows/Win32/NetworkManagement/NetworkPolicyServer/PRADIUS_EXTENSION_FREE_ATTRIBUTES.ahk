#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RadiusExtensionFreeAttributes function is an application-defined function and is called by NPS to free the memory occupied by attributes returned by RadiusExtensionProcessEx.
 * @remarks
 * If you implement 
 * <a href="https://docs.microsoft.com/windows/desktop/api/authif/nc-authif-pradius_extension_process_ex">RadiusExtensionProcessEx</a>, you must also implement 
 * <b>RadiusExtensionFreeAttributes</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/authif/nc-authif-pradius_extension_free_attributes
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class PRADIUS_EXTENSION_FREE_ATTRIBUTES extends IUnknown {

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
     * @param {Pointer<RADIUS_ATTRIBUTE>} pAttrs 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pAttrs) {
        ComCall(3, this, "ptr", pAttrs)
    }
}

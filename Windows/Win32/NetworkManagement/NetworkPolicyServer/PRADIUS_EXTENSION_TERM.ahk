#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RadiusExtensionTerm function is an application-defined function and is called by NPS prior to unloading the Extension DLL. Use RadiusExtensionTerm to perform any clean-up operations for the Extension DLL.
 * @remarks
 * **RadiusExtensionTerm** is an optional function. The RADIUS Extension DLL need not implement **RadiusExtensionTerm**.
 * @see https://learn.microsoft.com/windows/win32/api//content/authif/nc-authif-pradius_extension_term
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class PRADIUS_EXTENSION_TERM extends IUnknown {

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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke() {
        ComCall(3, this)
    }
}

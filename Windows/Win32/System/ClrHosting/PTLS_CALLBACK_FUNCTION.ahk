#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class PTLS_CALLBACK_FUNCTION extends IUnknown {

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
     * @param {Pointer<Void>} __MIDL____MIDL_itf_mscoree_0000_00040005 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(__MIDL____MIDL_itf_mscoree_0000_00040005) {
        __MIDL____MIDL_itf_mscoree_0000_00040005Marshal := __MIDL____MIDL_itf_mscoree_0000_00040005 is VarRef ? "ptr" : "ptr"

        ComCall(3, this, __MIDL____MIDL_itf_mscoree_0000_00040005Marshal, __MIDL____MIDL_itf_mscoree_0000_00040005)
    }
}

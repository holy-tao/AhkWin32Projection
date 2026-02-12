#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents an application-defined proxy change callback function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/winhttp/nc-winhttp-winhttp_proxy_change_callback
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_CHANGE_CALLBACK extends IUnknown {

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
     * @param {Integer} ullFlags 
     * @param {Pointer<Void>} pvContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ullFlags, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "uint", ullFlags, pvContextMarshal, pvContext)
    }
}

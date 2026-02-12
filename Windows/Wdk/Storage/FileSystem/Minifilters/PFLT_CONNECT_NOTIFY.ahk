#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class PFLT_CONNECT_NOTIFY extends IUnknown {

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
     * @param {PFLT_PORT} ClientPort 
     * @param {Pointer<Void>} ServerPortCookie 
     * @param {Pointer} ConnectionContext 
     * @param {Integer} SizeOfContext 
     * @param {Pointer<Pointer<Void>>} ConnectionPortCookie 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ClientPort, ServerPortCookie, ConnectionContext, SizeOfContext, ConnectionPortCookie) {
        ClientPort := ClientPort is Win32Handle ? NumGet(ClientPort, "ptr") : ClientPort

        ServerPortCookieMarshal := ServerPortCookie is VarRef ? "ptr" : "ptr"
        ConnectionPortCookieMarshal := ConnectionPortCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", ClientPort, ServerPortCookieMarshal, ServerPortCookie, "ptr", ConnectionContext, "uint", SizeOfContext, ConnectionPortCookieMarshal, ConnectionPortCookie, "int")
        return result
    }
}

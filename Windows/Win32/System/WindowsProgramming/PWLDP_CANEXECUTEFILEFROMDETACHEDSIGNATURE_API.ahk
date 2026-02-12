#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class PWLDP_CANEXECUTEFILEFROMDETACHEDSIGNATURE_API extends IUnknown {

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
     * @param {Pointer<Guid>} host 
     * @param {Integer} options 
     * @param {HANDLE} contentFileHandle 
     * @param {HANDLE} signatureFileHandle 
     * @param {PWSTR} auditInfo 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(host, options, contentFileHandle, signatureFileHandle, auditInfo) {
        contentFileHandle := contentFileHandle is Win32Handle ? NumGet(contentFileHandle, "ptr") : contentFileHandle
        signatureFileHandle := signatureFileHandle is Win32Handle ? NumGet(signatureFileHandle, "ptr") : signatureFileHandle
        auditInfo := auditInfo is String ? StrPtr(auditInfo) : auditInfo

        result := ComCall(3, this, "ptr", host, "int", options, "ptr", contentFileHandle, "ptr", signatureFileHandle, "ptr", auditInfo, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

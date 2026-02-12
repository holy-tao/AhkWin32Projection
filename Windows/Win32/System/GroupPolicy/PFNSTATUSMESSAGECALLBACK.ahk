#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The StatusMessageCallback function is an application-defined callback function used to display status messages when applying policy.
 * @remarks
 * Pass a pointer to the 
 * <b>StatusMessageCallback</b> function when the system calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnprocessgrouppolicy">ProcessGroupPolicy</a> or the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnprocessgrouppolicyex">ProcessGroupPolicyEx</a> callback function.
 * 
 * The status user interface has two modes: standard and verbose. Verbose messages are displayed only when the computer is in verbose mode. To enable verbose mode, set the following registry value to 1, log out, and log on. There is no need to restart the computer.
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>Software</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>Winlogon</b>&#92;<b>VerboseStatus</b>
 * 
 * 
 * 
 * <div class="alert"><b>Warning</b>  Do not call the 
 * <b>StatusMessageCallback</b> function from a background thread because you may overwrite another thread's status message.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/userenv/nc-userenv-pfnstatusmessagecallback
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class PFNSTATUSMESSAGECALLBACK extends IUnknown {

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
     * @param {BOOL} bVerbose 
     * @param {PWSTR} lpMessage 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(bVerbose, lpMessage) {
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        result := ComCall(3, this, "int", bVerbose, "ptr", lpMessage, "uint")
        return result
    }
}

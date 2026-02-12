#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Logs messages to the configuration log file or analysis log file.
 * @see https://learn.microsoft.com/windows/win32/api//content/scesvc/nc-scesvc-pfsce_log_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class PFSCE_LOG_INFO extends IUnknown {

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
     * @param {Integer} ErrLevel 
     * @param {Integer} Win32rc 
     * @param {Pointer<Integer>} pErrFmt 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ErrLevel, Win32rc, pErrFmt) {
        pErrFmtMarshal := pErrFmt is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", ErrLevel, "uint", Win32rc, pErrFmtMarshal, pErrFmt, "uint")
        return result
    }
}

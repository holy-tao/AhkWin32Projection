#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ORASADFunc function is an application-defined callback function that is used to provide a customized user interface for autodialing.
 * @remarks
 * If the 
 * <b>ORASADFunc</b> function performs the dialing operation, it presents its own user interface for dialing and calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function to do the actual dialing. The 
 * <b>ORASADFunc</b> then returns <b>TRUE</b> to indicate that it took over the dialing. When the dialing operation has been completed, set the variable pointed to by <i>lpdwRetCode</i> to indicate success or failure.
 * 
 * To enable an 
 * <b>ORASADFunc</b> handler for a phone-book entry, use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure in a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> function. The <b>szAutodialDll</b> member specifies the name of the DLL that contains the handler, and the <b>szAutodialDll</b> member specifies the exported name of the handler.
 * 
 * The 
 * <b>ORASADFunc</b> function is a placeholder for the library-defined function name. The <b>ORASADFUNC</b> type is a pointer to an 
 * <b>ORASADFunc</b> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-orasadfunc
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class ORASADFUNC extends IUnknown {

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
     * @param {HWND} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "uint", param2, param3Marshal, param3, "int")
        return result
    }
}

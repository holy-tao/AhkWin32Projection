#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RASADFunc function is an application-defined callback function that is used to provide a customized user interface for autodialing. (ANSI)
 * @remarks
 * When the system starts an AutoDial operation for a phone-book entry with a custom AutoDial handler, it calls the specified 
 * <b>RASADFunc</b>. The 
 * <b>RASADFunc</b> can start a thread to perform the custom-dialing operation. The 
 * <b>RASADFunc</b> function returns <b>TRUE</b> to indicate that it took over the dialing, or <b>FALSE</b> to allow the system to perform the dialing.
 * 
 * If the 
 * <b>RASADFunc</b> function performs the dialing operation, it presents its own user interface for dialing and calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function to do the actual dialing. The 
 * <b>RASADFunc</b> then returns <b>TRUE</b> to indicate that it took over the dialing. When the dialing operation has been completed, set the variable pointed to by the <i>lpdwRetCode</i> parameter to indicate success or failure.
 * 
 * The AutoDial DLL must provide both a <b>RASADFUNCA</b> (ANSI) and a <b>RASADFUNCW</b> (Unicode) version of the 
 * <b>RASADFunc</b> handler. To enable a 
 * <b>RASADFunc</b> AutoDial handler for a phone-book entry, use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure in a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> function. The <b>szAutodialDll</b> member specifies the name of the DLL that contains the handler, and the <b>szAutodialFunc</b> member specifies the exported name of the handler. The <b>szAutodialFunc</b> member should not include the "A" or "W" suffix.
 * 
 * <b>RASADFunc</b> is a placeholder for the library-defined function name. The <b>RASADFUNC</b> type is a pointer to a 
 * <b>RASADFunc</b> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ras.h header defines RASADFUNC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-rasadfunca
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASADFUNCA extends IUnknown {

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
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASADPARAMS>} param2 
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
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "ptr", param2, param3Marshal, param3, "int")
        return result
    }
}

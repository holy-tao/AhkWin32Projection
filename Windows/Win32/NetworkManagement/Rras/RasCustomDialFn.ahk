#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RasCustomDial function is an application-defined function that is exported by a third-party custom-dialing DLL. This function allows third-party vendors to implement custom remote-access dialing routines.
 * @remarks
 * RAS calls this entry point from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>, if the <b>szCustomDialDll</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry being dialed specifies a custom-dialing DLL.
 * 
 * If this entry point calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>, the <i>lpRasDialExtensions</i> parameter must not be <b>NULL</b>, and the <b>dwFlags</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377029(v=vs.85)">RASDIALEXTENSIONS</a> structure must have the RDEOPT_CustomDial flag set.
 * 
 * If the custom-dial DLL does not support this entry point, RAS returns ERROR_CANNOT_DO_CUSTOMDIAL to the caller of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-rascustomdialfn
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RasCustomDialFn extends IUnknown {

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
     * @param {HINSTANCE} hInstDll 
     * @param {Pointer<RASDIALEXTENSIONS>} lpRasDialExtensions 
     * @param {PWSTR} lpszPhonebook 
     * @param {Pointer<RASDIALPARAMSA>} lpRasDialParams 
     * @param {Integer} dwNotifierType 
     * @param {Pointer<Void>} lpvNotifier 
     * @param {Pointer<HRASCONN>} lphRasConn 
     * @param {Integer} dwFlags 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hInstDll, lpRasDialExtensions, lpszPhonebook, lpRasDialParams, dwNotifierType, lpvNotifier, lphRasConn, dwFlags) {
        hInstDll := hInstDll is Win32Handle ? NumGet(hInstDll, "ptr") : hInstDll
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook

        lpvNotifierMarshal := lpvNotifier is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hInstDll, "ptr", lpRasDialExtensions, "ptr", lpszPhonebook, "ptr", lpRasDialParams, "uint", dwNotifierType, lpvNotifierMarshal, lpvNotifier, "ptr", lphRasConn, "uint", dwFlags, "uint")
        return result
    }
}

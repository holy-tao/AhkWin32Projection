#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function that processes enumerated geographical location information provided by the EnumSystemGeoNames function.
 * @remarks
 * An <i>Geo_EnumNameProc</i> function can carry out any desired task, and can use the information passed to it in the <i>data</i> parameter for any desired purpose. The application registers this function by passing its address to the <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-enumsystemgeonames">EnumSystemGeoNames</a> function.
 * 
 * For information about two-letter ISO 3166-1 codes, see <a href="https://www.iso.org/iso-3166-country-codes.html">Country Codes - ISO 3166</a>.  For information about numeric UN M.49 codes, see <a href="https://unstats.un.org/unsd/methodology/m49/">Standard country or area codes for statistical use (M49)</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winnls/nc-winnls-geo_enumnameproc
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class GEO_ENUMNAMEPROC extends IUnknown {

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
     * @param {PWSTR} param0 
     * @param {LPARAM} param1 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "int")
        return result
    }
}

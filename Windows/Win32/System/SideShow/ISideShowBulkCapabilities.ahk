#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISideShowCapabilities.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowBulkCapabilities extends ISideShowCapabilities{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowBulkCapabilities
     * @type {Guid}
     */
    static IID => Guid("{3a2b7fbc-3ad5-48bd-bbf1-0e6cfbd10807}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities"]

    /**
     * Retrieves the length of a monitor's capabilities string.
     * @remarks
     * This function usually returns quickly, but sometimes it can take several seconds to complete.
     * @param {ISideShowKeyCollection} in_keyCollection 
     * @param {Pointer<ISideShowPropVariantCollection>} inout_pValues 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getcapabilitiesstringlength
     */
    GetCapabilities(in_keyCollection, inout_pValues) {
        result := ComCall(4, this, "ptr", in_keyCollection, "ptr*", inout_pValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

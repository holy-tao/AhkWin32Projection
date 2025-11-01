#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdate3.ahk

/**
 * Contains the properties and methods that are available to an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdate4
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdate4 extends IUpdate3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdate4
     * @type {Guid}
     */
    static IID => Guid("{27e94b0d-5139-49a2-9a61-93522dc54652}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PerUser"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate4-get_peruser
     */
    get_PerUser(retval) {
        result := ComCall(57, this, "ptr", retval, "HRESULT")
        return result
    }
}

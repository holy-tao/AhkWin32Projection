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
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_PerUser(retval) {
        result := ComCall(57, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

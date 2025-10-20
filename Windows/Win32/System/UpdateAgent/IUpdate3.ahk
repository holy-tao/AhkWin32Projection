#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdate2.ahk

/**
 * Contains the properties and methods that are available to an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdate3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdate3 extends IUpdate2{
    /**
     * The interface identifier for IUpdate3
     * @type {Guid}
     */
    static IID => Guid("{112eda6b-95b3-476f-9d90-aee82c6b8181}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 56

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_BrowseOnly(retval) {
        result := ComCall(56, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

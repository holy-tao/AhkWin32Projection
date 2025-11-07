#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStringCollection.ahk
#Include .\IUpdate.ahk

/**
 * Contains the properties and methods that are available to an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdate2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdate2 extends IUpdate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdate2
     * @type {Guid}
     */
    static IID => Guid("{144fe9b0-d23d-4a8b-8634-fb4457533b7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 52

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RebootRequired", "get_IsPresent", "get_CveIDs", "CopyToCache"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(52, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-get_ispresent
     */
    get_IsPresent() {
        result := ComCall(53, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-get_cveids
     */
    get_CveIDs() {
        result := ComCall(54, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @param {IStringCollection} pFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-copytocache
     */
    CopyToCache(pFiles) {
        result := ComCall(55, this, "ptr", pFiles, "HRESULT")
        return result
    }
}

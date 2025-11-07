#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the properties and the methods that are available to the status of an installation or uninstallation of an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateinstallationresult
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateInstallationResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateInstallationResult
     * @type {Guid}
     */
    static IID => Guid("{d940f0f8-3cbb-4fd0-993f-471e7f2328ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HResult", "get_RebootRequired", "get_ResultCode"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstallationresult-get_hresult
     */
    get_HResult() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstallationresult-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateinstallationresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}

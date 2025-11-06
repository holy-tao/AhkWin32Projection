#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWindowsDriverUpdate2.ahk

/**
 * Contains the properties and methods that are available only from a Windows driver update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdate3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdate3 extends IWindowsDriverUpdate2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDriverUpdate3
     * @type {Guid}
     */
    static IID => Guid("{49ebd502-4a96-41bd-9e3e-4c5057f4250c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 64

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BrowseOnly"]

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate3-get_browseonly
     */
    get_BrowseOnly() {
        result := ComCall(64, this, "short*", &retval := 0, "HRESULT")
        return retval
    }
}

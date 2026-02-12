#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdate2.ahk

/**
 * Contains the properties and methods that are available to an update. (IUpdate3)
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iupdate3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdate3 extends IUpdate2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BrowseOnly"]

    /**
     * @type {VARIANT_BOOL} 
     */
    BrowseOnly {
        get => this.get_BrowseOnly()
    }

    /**
     * Gets a Boolean value that indicates whether an update can be discovered only by browsing through the available updates. (IUpdate3.get_BrowseOnly)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nf-wuapi-iupdate3-get_browseonly
     */
    get_BrowseOnly() {
        result := ComCall(56, this, "short*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }
}

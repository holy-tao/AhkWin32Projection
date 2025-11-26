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
     * @type {VARIANT_BOOL} 
     */
    PerUser {
        get => this.get_PerUser()
    }

    /**
     * Gets a Boolean value that indicates whether this is a per-user update.
     * @remarks
     * 
     * Per-user updates are  designed to alter the current user’s environment only; not the environment of the machine as a whole. For example, an update which only alters files in the current user’s user directory could be a per-user update; an update which alters files in the Program Files directory or the Windows directory would not be a per-user update. Per-user updates are currently not processed by Automatic Updates or displayed in the Windows Update user interface. Instead, they are only available to callers who specifically request them in searches by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher3">IUpdateSearcher3</a> interface.  On computers running versions of Windows Update Agent that do not implement the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate4">IUpdate4</a> interface, only per-machine updates will be available; per-user updates will never be detected.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate4-get_peruser
     */
    get_PerUser() {
        result := ComCall(57, this, "short*", &retval := 0, "HRESULT")
        return retval
    }
}

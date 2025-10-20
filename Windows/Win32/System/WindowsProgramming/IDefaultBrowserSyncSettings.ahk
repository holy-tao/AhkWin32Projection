#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IDefaultBrowserSyncSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDefaultBrowserSyncSettings
     * @type {Guid}
     */
    static IID => Guid("{7a27faad-5ae6-4255-9030-c530936292e3}")

    /**
     * The class identifier for DefaultBrowserSyncSettings
     * @type {Guid}
     */
    static CLSID => Guid("{3ac83423-3112-4aa6-9b5b-1feb23d0c5f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEnabled"]

    /**
     * 
     * @returns {BOOL} 
     */
    IsEnabled() {
        result := ComCall(3, this, "int")
        return result
    }
}

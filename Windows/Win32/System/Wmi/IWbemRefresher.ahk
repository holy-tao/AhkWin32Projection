#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides an entry point through which refreshable objects such as enumerators or refresher objects, can be refreshed.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nn-wbemcli-iwbemrefresher
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemRefresher extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemRefresher
     * @type {Guid}
     */
    static IID => Guid("{49353c99-516b-11d1-aea6-00c04fb68820}")

    /**
     * The class identifier for WbemRefresher
     * @type {Guid}
     */
    static CLSID => Guid("{c71566f2-561e-11d1-ad87-00c04fd8fdff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Refresh"]

    /**
     * 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemrefresher-refresh
     */
    Refresh(lFlags) {
        result := ComCall(3, this, "int", lFlags, "HRESULT")
        return result
    }
}

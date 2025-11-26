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
     * The IWbemRefresher::Refresh method updates all refreshable objects, enumerators, and nested refreshers. The WMI Refresher calls this function in response to a client request to Refresh.
     * @param {Integer} lFlags Bitmask of flags that modify the behavior of this method.
     * 
     * If <b>WBEM_FLAG_REFRESH_AUTO_RECONNECT</b> is specified and if the connection is broken, the refresher attempts to reconnect to the provider automatically. This is the default behavior for this method.
     * 
     * If you do not want the refresher to attempt to reconnect to the provider, specify <b>WBEM_FLAG_REFRESH_NO_AUTO_RECONNECT</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemcli/nf-wbemcli-iwbemrefresher-refresh
     */
    Refresh(lFlags) {
        result := ComCall(3, this, "int", lFlags, "HRESULT")
        return result
    }
}

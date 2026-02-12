#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DhcpServerCalloutEntry function is called by Microsoft DHCP Server to initialize a third-party DLL, and to discover for which events the third-party DLL wants notification. The DhcpServerCalloutEntry function is implemented by third-party DLLs.
 * @remarks
 * Upon successful loading of a third-party DLL, Microsoft DHCP Server calls the DLL's 
 * <b>DhcpServerCalloutEntry</b> function. If this function call succeeds, Microsoft DHCP Server does not attempt to load any further third-party DLLs, and instead passes the list of remaining third-party DLLs in the <i>ChainDlls</i> parameter. It is the responsibility of the loaded third-party DLL to ensure that:
 * 
 * <ul>
 * <li>other third-party DLLs are loaded</li>
 * <li>their 
 * <b>DhcpServerCalloutEntry</b> function called</li>
 * <li>the merged list of requested notification entry points are returned to Microsoft DHCP Server in the <i>CalloutTbl</i> parameter.</li>
 * </ul>
 * The initially loaded third-party DLL is responsible for maintaining a table of cumulative notification entry points, and upon notification of a particular event, must call all chained third-party DLLs before returning to Microsoft DHCP Server.
 * 
 * <div class="alert"><b>Note</b>  For version negotiation, Microsoft DHCP Server may call the 
 * <b>DhcpServerCalloutEntry</b> function until a compatible version is found.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/dhcpssdk/nc-dhcpssdk-lpdhcp_entry_point_func
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class LPDHCP_ENTRY_POINT_FUNC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {PWSTR} ChainDlls 
     * @param {Integer} CalloutVersion 
     * @param {Pointer<DHCP_CALLOUT_TABLE>} CalloutTbl 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ChainDlls, CalloutVersion, CalloutTbl) {
        ChainDlls := ChainDlls is String ? StrPtr(ChainDlls) : ChainDlls

        result := ComCall(3, this, "ptr", ChainDlls, "uint", CalloutVersion, "ptr", CalloutTbl, "uint")
        return result
    }
}

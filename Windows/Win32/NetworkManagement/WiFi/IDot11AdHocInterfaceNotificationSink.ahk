#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the notifications supported by IDot11AdHocInterface.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocinterfacenotificationsink
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocInterfaceNotificationSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocInterfaceNotificationSink
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2f-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnectionStatusChange"]

    /**
     * 
     * @param {Integer} eStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterfacenotificationsink-onconnectionstatuschange
     */
    OnConnectionStatusChange(eStatus) {
        result := ComCall(3, this, "int", eStatus, "HRESULT")
        return result
    }
}

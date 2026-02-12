#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxOpenPort function returns a fax port handle to a fax client application. The port handle is required when the application calls other fax client functions that facilitate device management and fax document routing.
 * @remarks
 * Call the <b>FaxOpenPort</b> function to obtain the handle to a fax port. Use the handle when you call the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetporta">FaxSetPort</a> to change the configuration of the port</li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumroutingmethodsa">FaxEnumRoutingMethods</a> to retrieve information about the fax routing methods associated with a device</li>
 * </ul>
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumportsa">FaxEnumPorts</a> function returns an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structures. Each structure contains detailed information for one port, including a valid value to pass in the <i>DeviceId</i> parameter. An application should not save this device identifier in a persistent manner, because the identifier can change between function calls to the fax server.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-ports">Fax Ports</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-device-management">Fax Device Management</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-managing-fax-routing-data">Managing Fax Routing Data</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfaxopenport
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXOPENPORT extends IUnknown {

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
     * @param {HANDLE} FaxHandle 
     * @param {Integer} DeviceId 
     * @param {Integer} Flags 
     * @param {Pointer<HANDLE>} FaxPortHandle 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, DeviceId, Flags, FaxPortHandle) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := ComCall(3, this, "ptr", FaxHandle, "uint", DeviceId, "uint", Flags, "ptr", FaxPortHandle, "int")
        return result
    }
}

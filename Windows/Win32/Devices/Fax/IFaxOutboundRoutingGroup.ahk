#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutboundRoutingGroup interface describes a configuration object that is used by a fax client application to retrieve information about an individual fax outbound routing group.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutboundRoutingGroup</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutinggroup">FaxOutboundRoutingGroup</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutboundroutinggroup
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutboundRoutingGroup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxOutboundRoutingGroup
     * @type {Guid}
     */
    static IID => Guid("{ca6289a1-7e25-4f87-9a0b-93365734962c}")

    /**
     * The class identifier for FaxOutboundRoutingGroup
     * @type {Guid}
     */
    static CLSID => Guid("{0213f3e0-6791-4d77-a271-04d2357c50d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Status", "get_DeviceIds"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroup-get_name
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroup-get_status
     */
    get_Status(pStatus) {
        result := ComCall(8, this, "int*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFaxDeviceIds>} pFaxDeviceIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxoutboundroutinggroup-get_deviceids
     */
    get_DeviceIds(pFaxDeviceIds) {
        result := ComCall(9, this, "ptr*", pFaxDeviceIds, "HRESULT")
        return result
    }
}

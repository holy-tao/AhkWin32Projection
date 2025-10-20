#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxOutboundRoutingRule interface describes a configuration object that is used by a fax client application to set and retrieve information about an individual fax outbound routing rule.
 * @remarks
 * 
  * A default implementation of <b>IFaxOutboundRoutingRule</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxoutboundroutingrule">FaxOutboundRoutingRule</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxoutboundroutingrule
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxOutboundRoutingRule extends IDispatch{
    /**
     * The interface identifier for IFaxOutboundRoutingRule
     * @type {Guid}
     */
    static IID => Guid("{e1f795d5-07c2-469f-b027-acacc23219da}")

    /**
     * The class identifier for FaxOutboundRoutingRule
     * @type {Guid}
     */
    static CLSID => Guid("{6549eebf-08d1-475a-828b-3bf105952fa0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCountryCode 
     * @returns {HRESULT} 
     */
    get_CountryCode(plCountryCode) {
        result := ComCall(7, this, "int*", plCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAreaCode 
     * @returns {HRESULT} 
     */
    get_AreaCode(plAreaCode) {
        result := ComCall(8, this, "int*", plAreaCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(9, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbUseDevice 
     * @returns {HRESULT} 
     */
    get_UseDevice(pbUseDevice) {
        result := ComCall(10, this, "ptr", pbUseDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bUseDevice 
     * @returns {HRESULT} 
     */
    put_UseDevice(bUseDevice) {
        result := ComCall(11, this, "short", bUseDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDeviceId 
     * @returns {HRESULT} 
     */
    get_DeviceId(plDeviceId) {
        result := ComCall(12, this, "int*", plDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DeviceId 
     * @returns {HRESULT} 
     */
    put_DeviceId(DeviceId) {
        result := ComCall(13, this, "int", DeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGroupName 
     * @returns {HRESULT} 
     */
    get_GroupName(pbstrGroupName) {
        result := ComCall(14, this, "ptr", pbstrGroupName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGroupName 
     * @returns {HRESULT} 
     */
    put_GroupName(bstrGroupName) {
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName

        result := ComCall(15, this, "ptr", bstrGroupName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

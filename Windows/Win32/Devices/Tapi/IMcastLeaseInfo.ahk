#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMcastLeaseInfo interface exposes methods that can get or set information concerning a multicast address allocation. The IMcastLease object is created by calling IMcastAddressAllocation::CreateLeaseInfo.
 * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nn-mdhcp-imcastleaseinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IMcastLeaseInfo extends IDispatch{
    /**
     * The interface identifier for IMcastLeaseInfo
     * @type {Guid}
     */
    static IID => Guid("{df0daefd-a289-11d1-8697-006008b0e5d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} ppRequestID 
     * @returns {HRESULT} 
     */
    get_RequestID(ppRequestID) {
        result := ComCall(7, this, "ptr", ppRequestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pTime 
     * @returns {HRESULT} 
     */
    get_LeaseStartTime(pTime) {
        result := ComCall(8, this, "double*", pTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     */
    put_LeaseStartTime(time) {
        result := ComCall(9, this, "double", time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pTime 
     * @returns {HRESULT} 
     */
    get_LeaseStopTime(pTime) {
        result := ComCall(10, this, "double*", pTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} time 
     * @returns {HRESULT} 
     */
    put_LeaseStopTime(time) {
        result := ComCall(11, this, "double", time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    get_AddressCount(pCount) {
        result := ComCall(12, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppAddress 
     * @returns {HRESULT} 
     */
    get_ServerAddress(ppAddress) {
        result := ComCall(13, this, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTTL 
     * @returns {HRESULT} 
     */
    get_TTL(pTTL) {
        result := ComCall(14, this, "int*", pTTL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_Addresses(pVariant) {
        result := ComCall(15, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumBstr>} ppEnumAddresses 
     * @returns {HRESULT} 
     */
    EnumerateAddresses(ppEnumAddresses) {
        result := ComCall(16, this, "ptr", ppEnumAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

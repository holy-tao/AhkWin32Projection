#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Gets information from a FileExpiryDate event.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESFileExpiryDateEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesfileexpirydateevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESFileExpiryDateEvent extends IESEvent{
    /**
     * The interface identifier for IESFileExpiryDateEvent
     * @type {Guid}
     */
    static IID => Guid("{ba9edcb6-4d36-4cfe-8c56-87a6b0ca48e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<Guid>} pguidTunerId 
     * @returns {HRESULT} 
     */
    GetTunerId(pguidTunerId) {
        result := ComCall(8, this, "ptr", pguidTunerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwExpiryDate 
     * @returns {HRESULT} 
     */
    GetExpiryDate(pqwExpiryDate) {
        result := ComCall(9, this, "uint*", pqwExpiryDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwExpiryDate 
     * @returns {HRESULT} 
     */
    GetFinalExpiryDate(pqwExpiryDate) {
        result := ComCall(10, this, "uint*", pqwExpiryDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} dwMaxRenewalCount 
     * @returns {HRESULT} 
     */
    GetMaxRenewalCount(dwMaxRenewalCount) {
        result := ComCall(11, this, "uint*", dwMaxRenewalCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEntTokenPresent 
     * @returns {HRESULT} 
     */
    IsEntitlementTokenPresent(pfEntTokenPresent) {
        result := ComCall(12, this, "ptr", pfEntTokenPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfExpireAfterFirstUse 
     * @returns {HRESULT} 
     */
    DoesExpireAfterFirstUse(pfExpireAfterFirstUse) {
        result := ComCall(13, this, "ptr", pfExpireAfterFirstUse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

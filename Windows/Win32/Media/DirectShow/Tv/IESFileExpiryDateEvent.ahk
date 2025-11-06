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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTunerId", "GetExpiryDate", "GetFinalExpiryDate", "GetMaxRenewalCount", "IsEntitlementTokenPresent", "DoesExpireAfterFirstUse"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-gettunerid
     */
    GetTunerId() {
        pguidTunerId := Guid()
        result := ComCall(8, this, "ptr", pguidTunerId, "HRESULT")
        return pguidTunerId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-getexpirydate
     */
    GetExpiryDate() {
        result := ComCall(9, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-getfinalexpirydate
     */
    GetFinalExpiryDate() {
        result := ComCall(10, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-getmaxrenewalcount
     */
    GetMaxRenewalCount() {
        result := ComCall(11, this, "uint*", &dwMaxRenewalCount := 0, "HRESULT")
        return dwMaxRenewalCount
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-isentitlementtokenpresent
     */
    IsEntitlementTokenPresent() {
        result := ComCall(12, this, "int*", &pfEntTokenPresent := 0, "HRESULT")
        return pfEntTokenPresent
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesfileexpirydateevent-doesexpireafterfirstuse
     */
    DoesExpireAfterFirstUse() {
        result := ComCall(13, this, "int*", &pfExpireAfterFirstUse := 0, "HRESULT")
        return pfExpireAfterFirstUse
    }
}

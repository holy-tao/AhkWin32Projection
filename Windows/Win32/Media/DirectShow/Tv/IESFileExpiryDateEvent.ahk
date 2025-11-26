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
     * Gets a globally unique identifier (GUID) from a FileExpiryDate event that identifies the media transform device (MTD) that originated the event.
     * @returns {Guid} Receives the GUID for the MTD.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesfileexpirydateevent-gettunerid
     */
    GetTunerId() {
        pguidTunerId := Guid()
        result := ComCall(8, this, "ptr", pguidTunerId, "HRESULT")
        return pguidTunerId
    }

    /**
     * Gets the date from a FileExpiryDate event that indicates when a license for protected content expires.
     * @returns {Integer} Receives the expiry date from the event.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesfileexpirydateevent-getexpirydate
     */
    GetExpiryDate() {
        result := ComCall(9, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }

    /**
     * Gets the date from a FileExpiryDate event that indicates when a renewable license for protected content finally expires.
     * @returns {Integer} Receives the final expiry date.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesfileexpirydateevent-getfinalexpirydate
     */
    GetFinalExpiryDate() {
        result := ComCall(10, this, "uint*", &pqwExpiryDate := 0, "HRESULT")
        return pqwExpiryDate
    }

    /**
     * Gets the maximum number of times that a license for protected content can be renewed from a FileExpiryDate event.
     * @returns {Integer} Receives the maximum renewal count.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesfileexpirydateevent-getmaxrenewalcount
     */
    GetMaxRenewalCount() {
        result := ComCall(11, this, "uint*", &dwMaxRenewalCount := 0, "HRESULT")
        return dwMaxRenewalCount
    }

    /**
     * Gets a flag from FileExpiryDate event that indicates whether a license for protected content contains an entitlement token.
     * @returns {BOOL} Receives the flag, which is true if the license for protected content contains an entitlement token or false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesfileexpirydateevent-isentitlementtokenpresent
     */
    IsEntitlementTokenPresent() {
        result := ComCall(12, this, "int*", &pfEntTokenPresent := 0, "HRESULT")
        return pfEntTokenPresent
    }

    /**
     * Gets a flag from a FileExpiryDate event that indicates whether a license for protected content expires after its first use.
     * @returns {BOOL} Receives the flag, which is true if the license expires after first use or false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iesfileexpirydateevent-doesexpireafterfirstuse
     */
    DoesExpireAfterFirstUse() {
        result := ComCall(13, this, "int*", &pfExpireAfterFirstUse := 0, "HRESULT")
        return pfExpireAfterFirstUse
    }
}

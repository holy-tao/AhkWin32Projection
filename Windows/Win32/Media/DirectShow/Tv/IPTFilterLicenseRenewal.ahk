#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPTFilterLicenseRenewal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPTFilterLicenseRenewal
     * @type {Guid}
     */
    static IID => Guid("{26d836a5-0c15-44c7-ac59-b0da8728f240}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenewLicenses", "CancelLicenseRenewal"]

    /**
     * 
     * @param {PWSTR} wszFileName 
     * @param {PWSTR} wszExpiredKid 
     * @param {Integer} dwCallersId 
     * @param {BOOL} bHighPriority 
     * @returns {HRESULT} 
     */
    RenewLicenses(wszFileName, wszExpiredKid, dwCallersId, bHighPriority) {
        wszFileName := wszFileName is String ? StrPtr(wszFileName) : wszFileName
        wszExpiredKid := wszExpiredKid is String ? StrPtr(wszExpiredKid) : wszExpiredKid

        result := ComCall(3, this, "ptr", wszFileName, "ptr", wszExpiredKid, "uint", dwCallersId, "int", bHighPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelLicenseRenewal() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}

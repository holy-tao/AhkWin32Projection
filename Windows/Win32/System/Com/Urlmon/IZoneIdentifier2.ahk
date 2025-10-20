#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IZoneIdentifier.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IZoneIdentifier2 extends IZoneIdentifier{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IZoneIdentifier2
     * @type {Guid}
     */
    static IID => Guid("{eb5e760c-09ef-45c0-b510-70830ce31e6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastWriterPackageFamilyName", "SetLastWriterPackageFamilyName", "RemoveLastWriterPackageFamilyName", "GetAppZoneId", "SetAppZoneId", "RemoveAppZoneId"]

    /**
     * 
     * @param {Pointer<PWSTR>} packageFamilyName 
     * @returns {HRESULT} 
     */
    GetLastWriterPackageFamilyName(packageFamilyName) {
        result := ComCall(6, this, "ptr", packageFamilyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} packageFamilyName 
     * @returns {HRESULT} 
     */
    SetLastWriterPackageFamilyName(packageFamilyName) {
        packageFamilyName := packageFamilyName is String ? StrPtr(packageFamilyName) : packageFamilyName

        result := ComCall(7, this, "ptr", packageFamilyName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveLastWriterPackageFamilyName() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} zone 
     * @returns {HRESULT} 
     */
    GetAppZoneId(zone) {
        result := ComCall(9, this, "uint*", zone, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} zone 
     * @returns {HRESULT} 
     */
    SetAppZoneId(zone) {
        result := ComCall(10, this, "uint", zone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAppZoneId() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}

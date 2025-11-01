#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows the Windows Store to install a Windows product that the user purchased, to perform either an upgrade to the edition of Windows that the user currently has installed, or to replace a non-genuine copy of Windows with a genuine copy of Windows.
 * @remarks
 * 
  * The methods of this interface do not download the binaries or bits necessary to perform the upgrade.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//editionupgradehelper/nn-editionupgradehelper-ieditionupgradehelper
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IEditionUpgradeHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEditionUpgradeHelper
     * @type {Guid}
     */
    static IID => Guid("{d3e9e342-5deb-43b6-849e-6913b85d503a}")

    /**
     * The class identifier for EditionUpgradeHelper
     * @type {Guid}
     */
    static CLSID => Guid("{01776df3-b9af-4e50-9b1c-56e93116d704}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanUpgrade", "UpdateOperatingSystem", "ShowProductKeyUI", "GetOsProductContentId", "GetGenuineLocalStatus"]

    /**
     * 
     * @param {Pointer<BOOL>} isAllowed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-canupgrade
     */
    CanUpgrade(isAllowed) {
        result := ComCall(3, this, "ptr", isAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} contentId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-updateoperatingsystem
     */
    UpdateOperatingSystem(contentId) {
        contentId := contentId is String ? StrPtr(contentId) : contentId

        result := ComCall(4, this, "ptr", contentId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-showproductkeyui
     */
    ShowProductKeyUI() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} contentId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-getosproductcontentid
     */
    GetOsProductContentId(contentId) {
        result := ComCall(6, this, "ptr", contentId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isGenuine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-getgenuinelocalstatus
     */
    GetGenuineLocalStatus(isGenuine) {
        result := ComCall(7, this, "ptr", isGenuine, "HRESULT")
        return result
    }
}

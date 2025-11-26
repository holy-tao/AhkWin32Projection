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
     * Checks if the user has sufficient permissions to upgrade the operating system, and prompts the user to run as an administrator if needed.
     * @returns {BOOL} TRUE if the user has sufficient permissions to upgrade the operating system; otherwise FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-canupgrade
     */
    CanUpgrade() {
        result := ComCall(3, this, "int*", &isAllowed := 0, "HRESULT")
        return isAllowed
    }

    /**
     * Upgrades the installed edition of the operating system to the edition that the user purchased in the Windows Store, or gets a genuine copy of the operating system.
     * @param {PWSTR} contentId The content identifier of the edition of the operating system that the user purchased and which the method should install.
     * 
     * If this edition is a higher edition that the currently installed edition of Windows, this method performs an upgrade to that edition, If this edition is the same edition as the currently installed edition, this method installs a genuine copy of that edition.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-updateoperatingsystem
     */
    UpdateOperatingSystem(contentId) {
        contentId := contentId is String ? StrPtr(contentId) : contentId

        result := ComCall(4, this, "ptr", contentId, "HRESULT")
        return result
    }

    /**
     * Displays the user interface through which the user can provide a product key to upgrade or get a genuine copy of the operating system.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-showproductkeyui
     */
    ShowProductKeyUI() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the content identifier that corresponds to the current installation of the operating system. The content identifier is used to look up the operating system product in the store catalog.
     * @returns {PWSTR} The content identifier that corresponds to the current installation of the operating system.
     * @see https://docs.microsoft.com/windows/win32/api//editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-getosproductcontentid
     */
    GetOsProductContentId() {
        result := ComCall(6, this, "ptr*", &contentId := 0, "HRESULT")
        return contentId
    }

    /**
     * Retrieves whether the currently installed operating system is activated.
     * @returns {BOOL} TRUE is the currently installed operating system is activated; otherwise, FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-getgenuinelocalstatus
     */
    GetGenuineLocalStatus() {
        result := ComCall(7, this, "int*", &isGenuine := 0, "HRESULT")
        return isGenuine
    }
}

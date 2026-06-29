#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows the Windows Store to install a Windows product that the user purchased, to perform either an upgrade to the edition of Windows that the user currently has installed, or to replace a non-genuine copy of Windows with a genuine copy of Windows.
 * @remarks
 * The methods of this interface do not download the binaries or bits necessary to perform the upgrade.
 * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nn-editionupgradehelper-ieditionupgradehelper
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct IEditionUpgradeHelper extends IUnknown {
    /**
     * The interface identifier for IEditionUpgradeHelper
     * @type {Guid}
     */
    static IID := Guid("{d3e9e342-5deb-43b6-849e-6913b85d503a}")

    /**
     * The class identifier for EditionUpgradeHelper
     * @type {Guid}
     */
    static CLSID := Guid("{01776df3-b9af-4e50-9b1c-56e93116d704}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEditionUpgradeHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CanUpgrade            : IntPtr
        UpdateOperatingSystem : IntPtr
        ShowProductKeyUI      : IntPtr
        GetOsProductContentId : IntPtr
        GetGenuineLocalStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEditionUpgradeHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks if the user has sufficient permissions to upgrade the operating system, and prompts the user to run as an administrator if needed.
     * @returns {BOOL} TRUE if the user has sufficient permissions to upgrade the operating system; otherwise FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-canupgrade
     */
    CanUpgrade() {
        result := ComCall(3, this, BOOL.Ptr, &isAllowed := 0, "HRESULT")
        return isAllowed
    }

    /**
     * Upgrades the installed edition of the operating system to the edition that the user purchased in the Windows Store, or gets a genuine copy of the operating system.
     * @remarks
     * When this method performs an upgrade from the currently installed edition, the method takes the following steps:
     * 
     * <ul>
     * <li>Upgrades the edition of the operating system to the product that the user purchased from the Windows Store.</li>
     * <li>Displays a user interface that informs the user of the progress of the upgrade.</li>
     * <li>Restarts the computer when the upgrade is complete.</li>
     * <li>Relies on other system components to check the license to when the computer restarts.</li>
     * </ul>
     * When this method installs a genuine copy of the operating system, the method takes the following steps:
     * 
     * <ul>
     * <li>Checks the license that was download from the store before <b>UpdateOperatingSystem</b> was called.</li>
     * <li>Turns off any user experience that is not genuine for the current edition of Windows.</li>
     * </ul>
     * @param {PWSTR} contentId The content identifier of the edition of the operating system that the user purchased and which the method should install.
     * 
     * If this edition is a higher edition that the currently installed edition of Windows, this method performs an upgrade to that edition, If this edition is the same edition as the currently installed edition, this method installs a genuine copy of that edition.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-updateoperatingsystem
     */
    UpdateOperatingSystem(contentId) {
        contentId := contentId is String ? StrPtr(contentId) : contentId

        result := ComCall(4, this, "ptr", contentId, "HRESULT")
        return result
    }

    /**
     * Displays the user interface through which the user can provide a product key to upgrade or get a genuine copy of the operating system.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-showproductkeyui
     */
    ShowProductKeyUI() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the content identifier that corresponds to the current installation of the operating system. The content identifier is used to look up the operating system product in the store catalog.
     * @returns {PWSTR} The content identifier that corresponds to the current installation of the operating system.
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-getosproductcontentid
     */
    GetOsProductContentId() {
        result := ComCall(6, this, PWSTR.Ptr, &contentId := 0, "HRESULT")
        return contentId
    }

    /**
     * Retrieves whether the currently installed operating system is activated.
     * @returns {BOOL} TRUE is the currently installed operating system is activated; otherwise, FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/editionupgradehelper/nf-editionupgradehelper-ieditionupgradehelper-getgenuinelocalstatus
     */
    GetGenuineLocalStatus() {
        result := ComCall(7, this, BOOL.Ptr, &isGenuine := 0, "HRESULT")
        return isGenuine
    }

    Query(iid) {
        if (IEditionUpgradeHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CanUpgrade := CallbackCreate(GetMethod(implObj, "CanUpgrade"), flags, 2)
        this.vtbl.UpdateOperatingSystem := CallbackCreate(GetMethod(implObj, "UpdateOperatingSystem"), flags, 2)
        this.vtbl.ShowProductKeyUI := CallbackCreate(GetMethod(implObj, "ShowProductKeyUI"), flags, 1)
        this.vtbl.GetOsProductContentId := CallbackCreate(GetMethod(implObj, "GetOsProductContentId"), flags, 2)
        this.vtbl.GetGenuineLocalStatus := CallbackCreate(GetMethod(implObj, "GetGenuineLocalStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CanUpgrade)
        CallbackFree(this.vtbl.UpdateOperatingSystem)
        CallbackFree(this.vtbl.ShowProductKeyUI)
        CallbackFree(this.vtbl.GetOsProductContentId)
        CallbackFree(this.vtbl.GetGenuineLocalStatus)
    }
}

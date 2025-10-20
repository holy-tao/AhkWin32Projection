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
     * 
     * @param {Pointer<BOOL>} isAllowed 
     * @returns {HRESULT} 
     */
    CanUpgrade(isAllowed) {
        result := ComCall(3, this, "ptr", isAllowed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} contentId 
     * @returns {HRESULT} 
     */
    UpdateOperatingSystem(contentId) {
        contentId := contentId is String ? StrPtr(contentId) : contentId

        result := ComCall(4, this, "ptr", contentId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowProductKeyUI() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} contentId 
     * @returns {HRESULT} 
     */
    GetOsProductContentId(contentId) {
        result := ComCall(6, this, "ptr", contentId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isGenuine 
     * @returns {HRESULT} 
     */
    GetGenuineLocalStatus(isGenuine) {
        result := ComCall(7, this, "ptr", isGenuine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

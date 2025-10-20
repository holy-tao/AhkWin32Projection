#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to manage the Windows Desktop.
 * @remarks
 * 
  * Despite its name, this interface does not inherit from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nn-shlobj-iactivedesktopp">IActiveDesktopP</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-iadesktopp2
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class IADesktopP2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADesktopP2
     * @type {Guid}
     */
    static IID => Guid("{b22754e2-4574-11d1-9888-006097deacf9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReReadWallpaper", "GetADObjectFlags", "UpdateAllDesktopSubscriptions", "MakeDynamicChanges"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ReReadWallpaper() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     */
    GetADObjectFlags(pdwFlags, dwMask) {
        result := ComCall(4, this, "uint*", pdwFlags, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-iadesktopp2-updatealldesktopsubscriptions
     */
    UpdateAllDesktopSubscriptions() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOleObject} pOleObj 
     * @returns {HRESULT} 
     */
    MakeDynamicChanges(pOleObj) {
        result := ComCall(6, this, "ptr", pOleObj, "HRESULT")
        return result
    }
}

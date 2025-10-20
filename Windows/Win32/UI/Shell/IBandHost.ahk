#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create and destroy bands and specifiy their availability.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ibandhost
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBandHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBandHost
     * @type {Guid}
     */
    static IID => Guid("{b9075c7c-d48e-403f-ab99-d6c77a1084ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBand", "SetBandAvailability", "DestroyBand"]

    /**
     * 
     * @param {Pointer<Guid>} rclsidBand 
     * @param {BOOL} fAvailable 
     * @param {BOOL} fVisible 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ibandhost-createband
     */
    CreateBand(rclsidBand, fAvailable, fVisible, riid, ppv) {
        result := ComCall(3, this, "ptr", rclsidBand, "int", fAvailable, "int", fVisible, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsidBand 
     * @param {BOOL} fAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ibandhost-setbandavailability
     */
    SetBandAvailability(rclsidBand, fAvailable) {
        result := ComCall(4, this, "ptr", rclsidBand, "int", fAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsidBand 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ibandhost-destroyband
     */
    DestroyBand(rclsidBand) {
        result := ComCall(5, this, "ptr", rclsidBand, "HRESULT")
        return result
    }
}

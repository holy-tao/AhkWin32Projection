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
     * Creates a specified band.
     * @param {Pointer<Guid>} rclsidBand Type: <b>REFCLSID</b>
     * 
     * A reference to a CLSID. Used to ensure a duplicate band is not created.
     * @param {BOOL} fAvailable Type: <b>BOOL</b>
     * 
     * Specifies band availability.
     * @param {BOOL} fVisible Type: <b>BOOL</b>
     * 
     * Specifies band visibility.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Contains the address of a pointer to a band specified by <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ibandhost-createband
     */
    CreateBand(rclsidBand, fAvailable, fVisible, riid) {
        result := ComCall(3, this, "ptr", rclsidBand, "int", fAvailable, "int", fVisible, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Sets the availability of a specified band.
     * @param {Pointer<Guid>} rclsidBand Type: <b>REFCLSID</b>
     * 
     * A reference to a CLSID.
     * @param {BOOL} fAvailable Type: <b>BOOL</b>
     * 
     * Specifies band availability.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ibandhost-setbandavailability
     */
    SetBandAvailability(rclsidBand, fAvailable) {
        result := ComCall(4, this, "ptr", rclsidBand, "int", fAvailable, "HRESULT")
        return result
    }

    /**
     * Destroys a specified band.
     * @param {Pointer<Guid>} rclsidBand Type: <b>REFCLSID</b>
     * 
     * A reference to the CLSID of a band.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ibandhost-destroyband
     */
    DestroyBand(rclsidBand) {
        result := ComCall(5, this, "ptr", rclsidBand, "HRESULT")
        return result
    }
}

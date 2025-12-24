#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IShellFolderBand may be altered or unavailable.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-ishellfolderband
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolderBand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolderBand
     * @type {Guid}
     */
    static IID => Guid("{7fe80cc8-c247-11d0-b93a-00a0c90312e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeSFB", "SetBandInfoSFB", "GetBandInfoSFB"]

    /**
     * Initializes an IShellFolderBand object.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * A PIDL.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-ishellfolderband-initializesfb
     */
    InitializeSFB(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * Uses the information in a BANDINFOSFB structure to set the band information for a IShellFolderBand object.
     * @param {Pointer<BANDINFOSFB>} pbi Type: <b>PBANDINFOSFB</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-bandinfosfb">BANDINFOSFB</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-ishellfolderband-setbandinfosfb
     */
    SetBandInfoSFB(pbi) {
        result := ComCall(4, this, "ptr", pbi, "HRESULT")
        return result
    }

    /**
     * Gets information concerning an IShellFolderBand object and places it in a BANDINFOSFB structure.
     * @param {Pointer<BANDINFOSFB>} pbi Type: <b>PBANDINFOSFB</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/ns-shlobj-bandinfosfb">BANDINFOSFB</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj/nf-shlobj-ishellfolderband-getbandinfosfb
     */
    GetBandInfoSFB(pbi) {
        result := ComCall(5, this, "ptr", pbi, "HRESULT")
        return result
    }
}

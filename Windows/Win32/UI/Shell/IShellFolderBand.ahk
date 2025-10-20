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
     * 
     * @param {IShellFolder} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ishellfolderband-initializesfb
     */
    InitializeSFB(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BANDINFOSFB>} pbi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ishellfolderband-setbandinfosfb
     */
    SetBandInfoSFB(pbi) {
        result := ComCall(4, this, "ptr", pbi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BANDINFOSFB>} pbi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-ishellfolderband-getbandinfosfb
     */
    GetBandInfoSFB(pbi) {
        result := ComCall(5, this, "ptr", pbi, "HRESULT")
        return result
    }
}

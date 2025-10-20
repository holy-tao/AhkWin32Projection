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
     * 
     * @param {Pointer<IShellFolder>} psf 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    InitializeSFB(psf, pidl) {
        result := ComCall(3, this, "ptr", psf, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BANDINFOSFB>} pbi 
     * @returns {HRESULT} 
     */
    SetBandInfoSFB(pbi) {
        result := ComCall(4, this, "ptr", pbi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BANDINFOSFB>} pbi 
     * @returns {HRESULT} 
     */
    GetBandInfoSFB(pbi) {
        result := ComCall(5, this, "ptr", pbi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The ISnapinAbout interface enables the console to get copyright and version information from a snap-in. The console also uses this interface to obtain images for the static folder from the snap-in.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-isnapinabout
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ISnapinAbout extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISnapinAbout
     * @type {Guid}
     */
    static IID => Guid("{1245208c-a151-11d0-a7d7-00c04fd909dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSnapinDescription", "GetProvider", "GetSnapinVersion", "GetSnapinImage", "GetStaticFolderImage"]

    /**
     * 
     * @param {Pointer<PWSTR>} lpDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapindescription
     */
    GetSnapinDescription(lpDescription) {
        result := ComCall(3, this, "ptr", lpDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getprovider
     */
    GetProvider(lpName) {
        result := ComCall(4, this, "ptr", lpName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapinversion
     */
    GetSnapinVersion(lpVersion) {
        result := ComCall(5, this, "ptr", lpVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HICON>} hAppIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapinimage
     */
    GetSnapinImage(hAppIcon) {
        result := ComCall(6, this, "ptr", hAppIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HBITMAP>} hSmallImage 
     * @param {Pointer<HBITMAP>} hSmallImageOpen 
     * @param {Pointer<HBITMAP>} hLargeImage 
     * @param {Pointer<COLORREF>} cMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getstaticfolderimage
     */
    GetStaticFolderImage(hSmallImage, hSmallImageOpen, hLargeImage, cMask) {
        result := ComCall(7, this, "ptr", hSmallImage, "ptr", hSmallImageOpen, "ptr", hLargeImage, "ptr", cMask, "HRESULT")
        return result
    }
}

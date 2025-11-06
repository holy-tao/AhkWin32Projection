#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapindescription
     */
    GetSnapinDescription() {
        result := ComCall(3, this, "ptr*", &lpDescription := 0, "HRESULT")
        return lpDescription
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getprovider
     */
    GetProvider() {
        result := ComCall(4, this, "ptr*", &lpName := 0, "HRESULT")
        return lpName
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapinversion
     */
    GetSnapinVersion() {
        result := ComCall(5, this, "ptr*", &lpVersion := 0, "HRESULT")
        return lpVersion
    }

    /**
     * 
     * @returns {HICON} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapinimage
     */
    GetSnapinImage() {
        hAppIcon := HICON()
        result := ComCall(6, this, "ptr", hAppIcon, "HRESULT")
        return hAppIcon
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
        cMaskMarshal := cMask is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", hSmallImage, "ptr", hSmallImageOpen, "ptr", hLargeImage, cMaskMarshal, cMask, "HRESULT")
        return result
    }
}

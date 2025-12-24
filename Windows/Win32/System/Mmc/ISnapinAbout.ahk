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
     * Enables the console to obtain the text for the snap-in's description box.
     * @returns {PWSTR} A pointer to the text for the description box on an <b>About</b> property page.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-isnapinabout-getsnapindescription
     */
    GetSnapinDescription() {
        result := ComCall(3, this, "ptr*", &lpDescription := 0, "HRESULT")
        return lpDescription
    }

    /**
     * The ISnapinAbout::GetProvider method enables the console to obtain the snap-in provider name.
     * @returns {PWSTR} A pointer to the text of the snap-in provider name.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-isnapinabout-getprovider
     */
    GetProvider() {
        result := ComCall(4, this, "ptr*", &lpName := 0, "HRESULT")
        return lpName
    }

    /**
     * Enables the console to obtain the snap-in's version number.
     * @returns {PWSTR} A pointer to the text of the snap-in version number.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-isnapinabout-getsnapinversion
     */
    GetSnapinVersion() {
        result := ComCall(5, this, "ptr*", &lpVersion := 0, "HRESULT")
        return lpVersion
    }

    /**
     * Enables the console to obtain the snap-in's main icon to be used in the About box.
     * @returns {HICON} A pointer to the handle to the main icon of the snap-in that is to be used in the About property page.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-isnapinabout-getsnapinimage
     */
    GetSnapinImage() {
        hAppIcon := HICON()
        result := ComCall(6, this, "ptr", hAppIcon, "HRESULT")
        return hAppIcon
    }

    /**
     * The ISnapinAbout::GetStaticFolderImage method allows the console to obtain the static folder images for the scope and result panes.
     * @param {Pointer<HBITMAP>} hSmallImage A pointer to the handle to a small icon (16x16 pixels) in either the scope or result view pane.
     * @param {Pointer<HBITMAP>} hSmallImageOpen A pointer to the handle to a small open-folder icon (16x16 pixels).
     * @param {Pointer<HBITMAP>} hLargeImage A pointer to the handle to a large icon (32x32 pixels).
     * @param {Pointer<COLORREF>} cMask A pointer to a 
     * COLORREF structure that specifies the color used to generate a mask.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-isnapinabout-getstaticfolderimage
     */
    GetStaticFolderImage(hSmallImage, hSmallImageOpen, hLargeImage, cMask) {
        cMaskMarshal := cMask is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", hSmallImage, "ptr", hSmallImageOpen, "ptr", hLargeImage, cMaskMarshal, cMask, "HRESULT")
        return result
    }
}

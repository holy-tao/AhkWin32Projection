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
     * 
     * @param {Pointer<PWSTR>} lpDescription 
     * @returns {HRESULT} 
     */
    GetSnapinDescription(lpDescription) {
        result := ComCall(3, this, "ptr", lpDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpName 
     * @returns {HRESULT} 
     */
    GetProvider(lpName) {
        result := ComCall(4, this, "ptr", lpName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} lpVersion 
     * @returns {HRESULT} 
     */
    GetSnapinVersion(lpVersion) {
        result := ComCall(5, this, "ptr", lpVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HICON>} hAppIcon 
     * @returns {HRESULT} 
     */
    GetSnapinImage(hAppIcon) {
        result := ComCall(6, this, "ptr", hAppIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HBITMAP>} hSmallImage 
     * @param {Pointer<HBITMAP>} hSmallImageOpen 
     * @param {Pointer<HBITMAP>} hLargeImage 
     * @param {Pointer<COLORREF>} cMask 
     * @returns {HRESULT} 
     */
    GetStaticFolderImage(hSmallImage, hSmallImageOpen, hLargeImage, cMask) {
        result := ComCall(7, this, "ptr", hSmallImage, "ptr", hSmallImageOpen, "ptr", hLargeImage, "ptr", cMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

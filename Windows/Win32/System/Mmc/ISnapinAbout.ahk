#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISnapinAbout interface enables the console to get copyright and version information from a snap-in. The console also uses this interface to obtain images for the static folder from the snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-isnapinabout
 * @namespace Windows.Win32.System.Mmc
 */
export default struct ISnapinAbout extends IUnknown {
    /**
     * The interface identifier for ISnapinAbout
     * @type {Guid}
     */
    static IID := Guid("{1245208c-a151-11d0-a7d7-00c04fd909dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISnapinAbout interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSnapinDescription : IntPtr
        GetProvider          : IntPtr
        GetSnapinVersion     : IntPtr
        GetSnapinImage       : IntPtr
        GetStaticFolderImage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISnapinAbout.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables the console to obtain the text for the snap-in's description box.
     * @remarks
     * The description should be limited to four lines of text to fit the description windows on the Snap-in Manager property pages.
     * 
     * Memory for out parameters must be allocated using the COM API function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>.
     * @returns {PWSTR} A pointer to the text for the description box on an <b>About</b> property page.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapindescription
     */
    GetSnapinDescription() {
        result := ComCall(3, this, PWSTR.Ptr, &lpDescription := 0, "HRESULT")
        return lpDescription
    }

    /**
     * The ISnapinAbout::GetProvider method enables the console to obtain the snap-in provider name.
     * @remarks
     * Memory for out parameters must be allocated using the COM API function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>.
     * @returns {PWSTR} A pointer to the text of the snap-in provider name.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getprovider
     */
    GetProvider() {
        result := ComCall(4, this, PWSTR.Ptr, &lpName := 0, "HRESULT")
        return lpName
    }

    /**
     * Enables the console to obtain the snap-in's version number.
     * @remarks
     * Memory for out parameters must be allocated using the COM function 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>.
     * @returns {PWSTR} A pointer to the text of the snap-in version number.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapinversion
     */
    GetSnapinVersion() {
        result := ComCall(5, this, PWSTR.Ptr, &lpVersion := 0, "HRESULT")
        return lpVersion
    }

    /**
     * Enables the console to obtain the snap-in's main icon to be used in the About box.
     * @remarks
     * For bitmaps, MMC requires a specific background color so it can generate a transparency mask. Icons, however, have built-in transparency so MMC does not require a specific background color.
     * 
     * MMC creates a copy of the returned icon. The snap-in can free the icon when the 
     * ISnapinAbout interface is released.
     * @returns {HICON} A pointer to the handle to the main icon of the snap-in that is to be used in the About property page.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getsnapinimage
     */
    GetSnapinImage() {
        hAppIcon := HICON.Owned()
        result := ComCall(6, this, HICON.Ptr, hAppIcon, "HRESULT")
        return hAppIcon
    }

    /**
     * The ISnapinAbout::GetStaticFolderImage method allows the console to obtain the static folder images for the scope and result panes.
     * @remarks
     * MMC creates copies of the returned bitmaps. The snap-in can free the originals when the 
     * ISnapinAbout interface is released.
     * 
     * MMC uses default static folder images and icons if it cannot obtain the snap-in icons.
     * @param {Pointer<HBITMAP>} hSmallImage A pointer to the handle to a small icon (16x16 pixels) in either the scope or result view pane.
     * @param {Pointer<HBITMAP>} hSmallImageOpen A pointer to the handle to a small open-folder icon (16x16 pixels).
     * @param {Pointer<HBITMAP>} hLargeImage A pointer to the handle to a large icon (32x32 pixels).
     * @param {Pointer<COLORREF>} cMask A pointer to a 
     * COLORREF structure that specifies the color used to generate a mask.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-isnapinabout-getstaticfolderimage
     */
    GetStaticFolderImage(hSmallImage, hSmallImageOpen, hLargeImage, cMask) {
        cMaskMarshal := cMask is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, HBITMAP.Ptr, hSmallImage, HBITMAP.Ptr, hSmallImageOpen, HBITMAP.Ptr, hLargeImage, cMaskMarshal, cMask, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISnapinAbout.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSnapinDescription := CallbackCreate(GetMethod(implObj, "GetSnapinDescription"), flags, 2)
        this.vtbl.GetProvider := CallbackCreate(GetMethod(implObj, "GetProvider"), flags, 2)
        this.vtbl.GetSnapinVersion := CallbackCreate(GetMethod(implObj, "GetSnapinVersion"), flags, 2)
        this.vtbl.GetSnapinImage := CallbackCreate(GetMethod(implObj, "GetSnapinImage"), flags, 2)
        this.vtbl.GetStaticFolderImage := CallbackCreate(GetMethod(implObj, "GetStaticFolderImage"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSnapinDescription)
        CallbackFree(this.vtbl.GetProvider)
        CallbackFree(this.vtbl.GetSnapinVersion)
        CallbackFree(this.vtbl.GetSnapinImage)
        CallbackFree(this.vtbl.GetStaticFolderImage)
    }
}

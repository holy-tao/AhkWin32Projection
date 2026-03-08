#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\HLBWINFO.ahk
#Include .\IEnumHLITEM.ahk
#Include .\IHlink.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlinkBrowseContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHlinkBrowseContext
     * @type {Guid}
     */
    static IID => Guid("{79eac9c7-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "GetObject", "Revoke", "SetBrowseWindowInfo", "GetBrowseWindowInfo", "SetInitialHlink", "OnNavigateHlink", "UpdateHlink", "EnumNavigationStack", "QueryHlink", "GetHlink", "SetCurrentHlink", "Clone", "Close"]

    /**
     * The expert must implement the Register expert function. Network Monitor calls the Register expert function to obtain information about the expert.
     * @remarks
     * The **Version** member of the [**EXPERTENUMINFO**](expertenuminfo.md) structure must be zero.
     * @param {Integer} reserved 
     * @param {IUnknown} piunk 
     * @param {IMoniker} pimk 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/register-expert
     */
    Register(reserved, piunk, pimk) {
        result := ComCall(3, this, "uint", reserved, "ptr", piunk, "ptr", pimk, "uint*", &pdwRegister := 0, "HRESULT")
        return pdwRegister
    }

    /**
     * The GetObject function (wingdi.h) retrieves information for the specified graphics object.
     * @remarks
     * The buffer pointed to by the <i>lpvObject</i> parameter must be sufficiently large to receive the information about the graphics object. Depending on the graphics object, the function uses a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-extlogpen">EXTLOGPEN</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpen">LOGPEN</a> structure, or a count of table entries (for a logical palette).
     * 
     * If <i>hgdiobj</i> is a handle to a bitmap created by calling <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a>, and the specified buffer is large enough, the <b>GetObject</b> function returns a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a> structure. In addition, the <b>bmBits</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> structure contained within the <b>DIBSECTION</b> will contain a pointer to the bitmap's bit values.
     * 
     * If <i>hgdiobj</i> is a handle to a bitmap created by any other means, <b>GetObject</b> returns only the width, height, and color format information of the bitmap. You can obtain the bitmap's bit values by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdibits">GetDIBits</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getbitmapbits">GetBitmapBits</a> function.
     * 
     * If <i>hgdiobj</i> is a handle to a logical palette, <b>GetObject</b> retrieves a 2-byte integer that specifies the number of entries in the palette. The function does not retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpalette">LOGPALETTE</a> structure defining the palette. To retrieve information about palette entries, an application can call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getpaletteentries">GetPaletteEntries</a> function.
     * 
     * If <i>hgdiobj</i> is a handle to a font, the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> that is returned is the <b>LOGFONT</b> used to create the font. If Windows had to make some interpolation of the font because the precise <b>LOGFONT</b> could not be represented, the interpolation will not be reflected in the <b>LOGFONT</b>. For example, if you ask for a vertical version of a font that doesn't support vertical painting, the <b>LOGFONT</b> indicates the font is vertical, but Windows will paint it horizontally.
     * @param {IMoniker} pimk 
     * @param {BOOL} fBindIfRootRegistered 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getobject
     */
    GetObject(pimk, fBindIfRootRegistered) {
        result := ComCall(4, this, "ptr", pimk, "int", fBindIfRootRegistered, "ptr*", &ppiunk := 0, "HRESULT")
        return IUnknown(ppiunk)
    }

    /**
     * Ends an object's status as active.
     * @param {Integer} dwRegister A handle previously returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-registeractiveobject">RegisterActiveObject</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-revokeactiveobject
     */
    Revoke(dwRegister) {
        result := ComCall(5, this, "uint", dwRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HLBWINFO>} phlbwi 
     * @returns {HRESULT} 
     */
    SetBrowseWindowInfo(phlbwi) {
        result := ComCall(6, this, "ptr", phlbwi, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HLBWINFO} 
     */
    GetBrowseWindowInfo() {
        phlbwi := HLBWINFO()
        result := ComCall(7, this, "ptr", phlbwi, "HRESULT")
        return phlbwi
    }

    /**
     * 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    SetInitialHlink(pimkTarget, pwzLocation, pwzFriendlyName) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(8, this, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {Integer} 
     */
    OnNavigateHlink(grfHLNF, pimkTarget, pwzLocation, pwzFriendlyName) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(9, this, "uint", grfHLNF, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "uint*", &puHLID := 0, "HRESULT")
        return puHLID
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    UpdateHlink(uHLID, pimkTarget, pwzLocation, pwzFriendlyName) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(10, this, "uint", uHLID, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Integer} grfHLFNAMEF 
     * @returns {IEnumHLITEM} 
     */
    EnumNavigationStack(dwReserved, grfHLFNAMEF) {
        result := ComCall(11, this, "uint", dwReserved, "uint", grfHLFNAMEF, "ptr*", &ppienumhlitem := 0, "HRESULT")
        return IEnumHLITEM(ppienumhlitem)
    }

    /**
     * 
     * @param {Integer} grfHLQF 
     * @param {Integer} uHLID 
     * @returns {HRESULT} 
     */
    QueryHlink(grfHLQF, uHLID) {
        result := ComCall(12, this, "uint", grfHLQF, "uint", uHLID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @returns {IHlink} 
     */
    GetHlink(uHLID) {
        result := ComCall(13, this, "uint", uHLID, "ptr*", &ppihl := 0, "HRESULT")
        return IHlink(ppihl)
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @returns {HRESULT} 
     */
    SetCurrentHlink(uHLID) {
        result := ComCall(14, this, "uint", uHLID, "HRESULT")
        return result
    }

    /**
     * Creates a recognizer context that contains the same settings as the original. The new recognizer context does not include the ink or recognition results of the original.
     * @remarks
     * The settings  for this context include the recognition guide, character Autocomplete mode, and any factoids that improve the recognition results. An example of a factoid may include whether the ink is a phone number, a name, or a URL. The TextContext and Wordlists are preserved in the new context.
     * @param {IUnknown} piunkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-clonecontext
     */
    Clone(piunkOuter, riid) {
        result := ComCall(15, this, "ptr", piunkOuter, "ptr", riid, "ptr*", &ppiunkObj := 0, "HRESULT")
        return IUnknown(ppiunkObj)
    }

    /**
     * Use the Close-Session packet to tell the BITS server that file upload is complete and to end the session.
     * @remarks
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * For upload-reply jobs, you must download the reply before sending **Close-Session**. Otherwise, the reply is lost.
     * 
     * If you send this packet before uploading all fragments, the upload file is deleted; you cannot upload a partial file.
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/close-session
     */
    Close(reserved) {
        result := ComCall(16, this, "uint", reserved, "HRESULT")
        return result
    }
}

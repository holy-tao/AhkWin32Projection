#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HLBWINFO.ahk" { HLBWINFO }
#Import ".\IEnumHLITEM.ahk" { IEnumHLITEM }
#Import ".\IHlink.ahk" { IHlink }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHlinkBrowseContext extends IUnknown {
    /**
     * The interface identifier for IHlinkBrowseContext
     * @type {Guid}
     */
    static IID := Guid("{79eac9c7-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHlinkBrowseContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Register            : IntPtr
        GetObject           : IntPtr
        Revoke              : IntPtr
        SetBrowseWindowInfo : IntPtr
        GetBrowseWindowInfo : IntPtr
        SetInitialHlink     : IntPtr
        OnNavigateHlink     : IntPtr
        UpdateHlink         : IntPtr
        EnumNavigationStack : IntPtr
        QueryHlink          : IntPtr
        GetHlink            : IntPtr
        SetCurrentHlink     : IntPtr
        Clone               : IntPtr
        Close               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHlinkBrowseContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(4, this, "ptr", pimk, BOOL, fBindIfRootRegistered, "ptr*", &ppiunk := 0, "HRESULT")
        return IUnknown(ppiunk)
    }

    /**
     * 
     * @param {Integer} dwRegister 
     * @returns {HRESULT} 
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
        result := ComCall(6, this, HLBWINFO.Ptr, phlbwi, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HLBWINFO} 
     */
    GetBrowseWindowInfo() {
        phlbwi := HLBWINFO()
        result := ComCall(7, this, HLBWINFO.Ptr, phlbwi, "HRESULT")
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
     * 
     * @param {IUnknown} piunkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    Clone(piunkOuter, riid) {
        result := ComCall(15, this, "ptr", piunkOuter, Guid.Ptr, riid, "ptr*", &ppiunkObj := 0, "HRESULT")
        return IUnknown(ppiunkObj)
    }

    /**
     * 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     */
    Close(reserved) {
        result := ComCall(16, this, "uint", reserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHlinkBrowseContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 5)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 4)
        this.vtbl.Revoke := CallbackCreate(GetMethod(implObj, "Revoke"), flags, 2)
        this.vtbl.SetBrowseWindowInfo := CallbackCreate(GetMethod(implObj, "SetBrowseWindowInfo"), flags, 2)
        this.vtbl.GetBrowseWindowInfo := CallbackCreate(GetMethod(implObj, "GetBrowseWindowInfo"), flags, 2)
        this.vtbl.SetInitialHlink := CallbackCreate(GetMethod(implObj, "SetInitialHlink"), flags, 4)
        this.vtbl.OnNavigateHlink := CallbackCreate(GetMethod(implObj, "OnNavigateHlink"), flags, 6)
        this.vtbl.UpdateHlink := CallbackCreate(GetMethod(implObj, "UpdateHlink"), flags, 5)
        this.vtbl.EnumNavigationStack := CallbackCreate(GetMethod(implObj, "EnumNavigationStack"), flags, 4)
        this.vtbl.QueryHlink := CallbackCreate(GetMethod(implObj, "QueryHlink"), flags, 3)
        this.vtbl.GetHlink := CallbackCreate(GetMethod(implObj, "GetHlink"), flags, 3)
        this.vtbl.SetCurrentHlink := CallbackCreate(GetMethod(implObj, "SetCurrentHlink"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 4)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.Revoke)
        CallbackFree(this.vtbl.SetBrowseWindowInfo)
        CallbackFree(this.vtbl.GetBrowseWindowInfo)
        CallbackFree(this.vtbl.SetInitialHlink)
        CallbackFree(this.vtbl.OnNavigateHlink)
        CallbackFree(this.vtbl.UpdateHlink)
        CallbackFree(this.vtbl.EnumNavigationStack)
        CallbackFree(this.vtbl.QueryHlink)
        CallbackFree(this.vtbl.GetHlink)
        CallbackFree(this.vtbl.SetCurrentHlink)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.Close)
    }
}

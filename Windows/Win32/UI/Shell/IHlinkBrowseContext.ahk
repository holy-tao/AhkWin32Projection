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
     * The Register export function must be implemented in all parser DLLs. The implementation of Register creates and fills-in a property database for a protocol. Network Monitor uses the database to determine which properties the protocol supports.
     * @remarks
     * Network Monitor starts calling the **Register** function as soon as a capture is loaded. Network Monitor calls the **Register** function for each protocol it can identify. The [CreateProtocol](createprotocol.md) function passes a pointer to the **Register** function.
     * 
     * The implementation of **Register** includes calls to the following functions.
     * 
     * -   A call to the [CreatePropertyDatabase](createpropertydatabase.md) and [AddProperty](/previous-versions/bb251873(v=msdn.10)) functions to create a database of all the properties that the protocol supports.
     * -   A call to the [CreateHandoffTable](createhandofftable.md) function is required if the protocol uses a [*handoff set*](h.md).
     * 
     * If the parser DLL contains multiple parsers, and the parser can detect more than one protocol, you must implement a **Register** function for each protocol.
     * 
     * 
     * 
     * | For Information on                                        | See                                                    |
     * |-----------------------------------------------------------|--------------------------------------------------------|
     * | What parsers are, and how they work with Network Monitor. | [Parsers](parsers.md)                                 |
     * | Which entry points are included in the parser DLL.        | [Parser DLL Architecture](parser-dll-architecture.md) |
     * | How to implement **Register**  includes an example.       | [Implementing Register](implementing-register.md)     |
     * @param {Integer} reserved 
     * @param {IUnknown} piunk 
     * @param {IMoniker} pimk 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/register-parser
     */
    Register(reserved, piunk, pimk) {
        result := ComCall(3, this, "uint", reserved, "ptr", piunk, "ptr", pimk, "uint*", &pdwRegister := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getobject
     */
    GetObject(pimk, fBindIfRootRegistered) {
        result := ComCall(4, this, "ptr", pimk, "int", fBindIfRootRegistered, "ptr*", &ppiunk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppiunk)
    }

    /**
     * Ends an object's status as active.
     * @param {Integer} dwRegister A handle previously returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-registeractiveobject">RegisterActiveObject</a>.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleauto/nf-oleauto-revokeactiveobject
     */
    Revoke(dwRegister) {
        result := ComCall(5, this, "uint", dwRegister, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<HLBWINFO>} phlbwi 
     * @returns {HRESULT} 
     */
    SetBrowseWindowInfo(phlbwi) {
        result := ComCall(6, this, "ptr", phlbwi, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HLBWINFO} 
     */
    GetBrowseWindowInfo() {
        phlbwi := HLBWINFO()
        result := ComCall(7, this, "ptr", phlbwi, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(8, this, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(9, this, "uint", grfHLNF, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "uint*", &puHLID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(10, this, "uint", uHLID, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Integer} grfHLFNAMEF 
     * @returns {IEnumHLITEM} 
     */
    EnumNavigationStack(dwReserved, grfHLFNAMEF) {
        result := ComCall(11, this, "uint", dwReserved, "uint", grfHLFNAMEF, "ptr*", &ppienumhlitem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumHLITEM(ppienumhlitem)
    }

    /**
     * 
     * @param {Integer} grfHLQF 
     * @param {Integer} uHLID 
     * @returns {HRESULT} 
     */
    QueryHlink(grfHLQF, uHLID) {
        result := ComCall(12, this, "uint", grfHLQF, "uint", uHLID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @returns {IHlink} 
     */
    GetHlink(uHLID) {
        result := ComCall(13, this, "uint", uHLID, "ptr*", &ppihl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHlink(ppihl)
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @returns {HRESULT} 
     */
    SetCurrentHlink(uHLID) {
        result := ComCall(14, this, "uint", uHLID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clone Method Example (VC++)
     * @param {IUnknown} piunkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<IUnknown>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone(piunkOuter, riid) {
        result := ComCall(15, this, "ptr", piunkOuter, "ptr", riid, "ptr*", &ppiunkObj := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppiunkObj
    }

    /**
     * MSSQLSERVER_4064
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close(reserved) {
        result := ComCall(16, this, "uint", reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

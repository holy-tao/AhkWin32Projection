#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IMachineGlobalObjectTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMachineGlobalObjectTable
     * @type {Guid}
     */
    static IID => Guid("{26d709ac-f70b-4421-a96f-d2878fafb00d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterObject", "GetObject", "RevokeObject"]

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {PWSTR} identifier 
     * @param {IUnknown} _object 
     * @returns {MachineGlobalObjectTableRegistrationToken} 
     */
    RegisterObject(clsid, identifier, _object) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(3, this, "ptr", clsid, "ptr", identifier, "ptr", _object, "ptr*", &token := 0, "HRESULT")
        return token
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
     * @param {Pointer<Guid>} clsid 
     * @param {PWSTR} identifier 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getobject
     */
    GetObject(clsid, identifier, riid) {
        identifier := identifier is String ? StrPtr(identifier) : identifier

        result := ComCall(4, this, "ptr", clsid, "ptr", identifier, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {MachineGlobalObjectTableRegistrationToken} token 
     * @returns {HRESULT} 
     */
    RevokeObject(token) {
        result := ComCall(5, this, "ptr", token, "HRESULT")
        return result
    }
}

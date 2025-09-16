#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class ColorSystem {

;@region Constants

    /**
     * @type {String}
     */
    static CATID_WcsPlugin => "{a0b402e0-8240-405f-8a16-8a5b4df2f0dd}"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_COLOR_CHANNELS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTENT_PERCEPTUAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTENT_RELATIVE_COLORIMETRIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTENT_SATURATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTENT_ABSOLUTE_COLORIMETRIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_EMBEDDEDPROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_DEPENDENTONDATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_ENABLE_CHROMATIC_ADAPTATION => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static ATTRIB_TRANSPARENCY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ATTRIB_MATTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_FILENAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_MEMBUFFER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILE_READWRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INDEX_DONT_CARE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_FROM_PROFILE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ENUM_TYPE_VERSION => 768

    /**
     * @type {Integer (UInt32)}
     */
    static ET_DEVICENAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ET_MEDIATYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ET_DITHERMODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ET_RESOLUTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ET_CMMTYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ET_CLASS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ET_DATACOLORSPACE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ET_CONNECTIONSPACE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ET_SIGNATURE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ET_PLATFORM => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ET_PROFILEFLAGS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ET_MANUFACTURER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ET_MODEL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ET_ATTRIBUTES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ET_RENDERINGINTENT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ET_CREATOR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ET_DEVICECLASS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ET_STANDARDDISPLAYCOLOR => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static ET_EXTENDEDDISPLAYCOLOR => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PROOF_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NORMAL_MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BEST_MODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_GAMUT_CHECKING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static USE_RELATIVE_COLORIMETRIC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_TRANSLATE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PRESERVEBLACK => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WCS_ALWAYS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SEQUENTIAL_TRANSFORM => 2155872256

    /**
     * @type {Integer (UInt32)}
     */
    static RESERVED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_A => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_ABC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_DEF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_DEFG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_GRAY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_RGB => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_CMYK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CSA_Lab => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_WIN_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_IDENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_DRIVER_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_DLL_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_DESCRIPTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_LOGOICON => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_FORWARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_BACKWARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COLOR_MATCH_VERSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_DISABLEICM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_ENABLEPROOFING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_SETRENDERINTENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_SETPROOFINTENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_SETMONITORPROFILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_SETPRINTERPROFILE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_SETTARGETPROFILE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_USEHOOK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_USEAPPLYCALLBACK => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_USEDESCRIPTION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_DISABLEINTENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CMS_DISABLERENDERINTENT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static CMS_MONITOROVERFLOW => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static CMS_PRINTEROVERFLOW => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static CMS_TARGETOVERFLOW => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DONT_USE_EMBEDDED_WCS_PROFILES => 1

    /**
     * @type {Integer (Int32)}
     */
    static WCS_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static WCS_ICCONLY => 65536
;@endregion Constants

;@region Methods
    /**
     * The SetICMMode function causes Image Color Management to be enabled, disabled, or queried on a given device context (DC).
     * @remarks
     * If the system cannot find an ICC color profile to match the state of the device, <b>SetICMMode</b> fails and returns zero.
     * 
     * Once WCS is enabled for a device context (DC), colors passed into the DC using most Win32 API functions are color matched. The primary exceptions are <b>BitBlt</b> and <b>StretchBlt</b>. The assumption is that when performing a bit block transfer (blit) from one DC to another, the two DCs are already compatible and need no color correction. If this is not the case, color correction may be performed. Specifically, if a device independent bitmap (DIB) is used as the source for a blit, and the blit is performed into a DC that has WCS enabled, color matching will be performed. If this is not what you want, turn WCS off for the destination DC by calling <b>SetICMMode</b> before calling <b>BitBlt</b> or <b>StretchBlt</b>.
     * 
     * If the <b>CreateCompatibleDC</b> function is used to create a bitmap in a DC, it is possible for the bitmap to be color matched twice, once when it is created and once when a blit is performed. The reason is that a bitmap in a DC created by the <b>CreateCompatibleDC</b> function acquires the current brush, pens, and palette of the source DC. However, WCS will be disabled by default for the new DC. If WCS is later enabled for the new DC by using the <b>SetICMMode</b> function, a color correction will be done. To prevent double color corrections through the use of the <b>CreateCompatibleDC</b> function, use the <b>SetICMMode</b> function to turn WCS off for the source DC before the <b>CreateCompatibleDC</b> function is called.
     * 
     * When a compatible DC is created from a printer's DC (see <b>CreateCompatibleDC</b> ), the default is for color matching to always be performed if it is enabled for the printer's DC. The default color profile for the printer is used when a blit is performed into the printer's DC using <b>SetDIBitsToDevice</b> or <b>StretchDIBits</b>. If this is not what you want, turn WCS off for the printer's DC by calling <b>SetICMMode</b> before calling <b>SetDIBitsToDevice</b> or <b>StretchDIBits</b>.
     * 
     * Also, when printing to a printer's DC with WCS turned on, the <b>SetICMMode</b> function needs to be called after every call to the <b>StartPage</b> function to turn back on WCS. The <b>StartPage</b> function calls the <b>RestoreDC</b> and <b>SaveDC</b> functions, which result in WCS being turned off for the printer's DC.
     * @param {Pointer<HDC>} hdc Identifies handle to the device context.
     * @param {Integer} mode Turns on and off image color management. This parameter can take one of the following constant values.<div> </div>
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICM_ON"></a><a id="icm_on"></a><dl>
     * <dt><b>ICM_ON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turns on color management. Turns off old-style color correction of halftones.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICM_OFF"></a><a id="icm_off"></a><dl>
     * <dt><b>ICM_OFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turns off color management. Turns on old-style color correction of halftones.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICM_QUERY"></a><a id="icm_query"></a><dl>
     * <dt><b>ICM_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the current state of color management.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICM_DONE_OUTSIDEDC"></a><a id="icm_done_outsidedc"></a><dl>
     * <dt><b>ICM_DONE_OUTSIDEDC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turns off color management inside DC. Under Windows 2000, also turns off old-style color correction of halftones. Not supported under Windows 95.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-seticmmode
     * @since windows5.0
     */
    static SetICMMode(hdc, mode) {
        DllCall("GDI32.dll\SetICMMode", "ptr", hdc, "int", mode)
    }

    /**
     * The CheckColorsInGamut function determines whether a specified set of RGB triples lies in the output gamut of a specified device. The RGB triples are interpreted in the input logical color space.
     * @remarks
     * The function places the test results in the buffer pointed to by <i>lpBuffer</i>. Each byte in the buffer corresponds to an <i>RGB triple</i>, and has an unsigned value between CM_IN_GAMUT (= 0) and CM_OUT_OF_GAMUT (= 255). The value 0 denotes that the color is in gamut, while a nonzero value denotes that it is out of gamut. For any integer <i>n</i> such that 0 &lt; <i>n</i> &lt; 255, a result value of <i>n</i> + 1 indicates that the corresponding color is at least as far out of gamut as would be indicated by a result value of <i>n</i>, as specified by the ICC Profile Format Specification. For more information on the ICC Profile Format Specification, see the sources listed in [Further information](/windows/win32/wcs/further-information)
     * .
     * 
     * Note that for this function to succeed, WCS must be enabled for the device context handle that is passed in through the <i>hDC</i> parameter. WCS can be enabled for a device context handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-seticmmode">SetICMMode</a> function.
     * @param {Pointer<HDC>} hdc Handle to the device context whose output gamut to be checked.
     * @param {Pointer<RGBTRIPLE>} lpRGBTriple Pointer to an array of RGB triples to check.
     * @param {Pointer<Void>} dlpBuffer Pointer to the buffer in which the results are to be placed. This buffer must be at least as large as <i>nCount</i> bytes.
     * @param {Integer} nCount The number of elements in the array of triples.
     * @returns {Integer} If this function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-checkcolorsingamut
     * @since windows5.0
     */
    static CheckColorsInGamut(hdc, lpRGBTriple, dlpBuffer, nCount) {
        result := DllCall("GDI32.dll\CheckColorsInGamut", "ptr", hdc, "ptr", lpRGBTriple, "ptr", dlpBuffer, "uint", nCount, "int")
        return result
    }

    /**
     * The GetColorSpace function retrieves the handle to the input color space from a specified device context.
     * @remarks
     * <b>GetColorSpace</b> obtains the handle to the input color space regardless of whether color management is enabled for the device context.
     * @param {Pointer<HDC>} hdc Specifies a device context that is to have its input color space handle retrieved.
     * @returns {Pointer<HCOLORSPACE>} If the function succeeds, the return value is the current input color space handle.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getcolorspace
     * @since windows5.0
     */
    static GetColorSpace(hdc) {
        result := DllCall("GDI32.dll\GetColorSpace", "ptr", hdc, "ptr")
        return result
    }

    /**
     * The GetLogColorSpace function retrieves the color space definition identified by a specified handle. (ANSI)
     * @remarks
     * <b>Windows 95/98/Me: </b><b>GetLogColorSpaceW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines GetLogColorSpace as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HCOLORSPACE>} hColorSpace Specifies the handle to a color space.
     * @param {Pointer<LOGCOLORSPACEA>} lpBuffer Points to a buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> structure.
     * @param {Integer} nSize Specifies the maximum size of the buffer.
     * @returns {Integer} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getlogcolorspacea
     * @since windows5.0
     */
    static GetLogColorSpaceA(hColorSpace, lpBuffer, nSize) {
        result := DllCall("GDI32.dll\GetLogColorSpaceA", "ptr", hColorSpace, "ptr", lpBuffer, "uint", nSize, "int")
        return result
    }

    /**
     * The GetLogColorSpace function retrieves the color space definition identified by a specified handle. (Unicode)
     * @remarks
     * <b>Windows 95/98/Me: </b><b>GetLogColorSpaceW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines GetLogColorSpace as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HCOLORSPACE>} hColorSpace Specifies the handle to a color space.
     * @param {Pointer<LOGCOLORSPACEW>} lpBuffer Points to a buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> structure.
     * @param {Integer} nSize Specifies the maximum size of the buffer.
     * @returns {Integer} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getlogcolorspacew
     * @since windows5.0
     */
    static GetLogColorSpaceW(hColorSpace, lpBuffer, nSize) {
        result := DllCall("GDI32.dll\GetLogColorSpaceW", "ptr", hColorSpace, "ptr", lpBuffer, "uint", nSize, "int")
        return result
    }

    /**
     * The CreateColorSpace function creates a logical color space. (ANSI)
     * @remarks
     * When the color space is no longer needed, use <b>DeleteColorSpace</b> to delete it.
     * 
     * <b>Windows 95/98/Me: </b><b>CreateColorSpaceW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * > [!NOTE]
     * > The wingdi.h header defines CreateColorSpace as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LOGCOLORSPACEA>} lplcs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> data structure.
     * @returns {Pointer<HCOLORSPACE>} If this function succeeds, the return value is a handle that identifies a color space.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-createcolorspacea
     * @since windows5.0
     */
    static CreateColorSpaceA(lplcs) {
        result := DllCall("GDI32.dll\CreateColorSpaceA", "ptr", lplcs, "ptr")
        return result
    }

    /**
     * The CreateColorSpace function creates a logical color space. (Unicode)
     * @remarks
     * When the color space is no longer needed, use <b>DeleteColorSpace</b> to delete it.
     * 
     * <b>Windows 95/98/Me: </b><b>CreateColorSpaceW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines CreateColorSpace as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<LOGCOLORSPACEW>} lplcs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> data structure.
     * @returns {Pointer<HCOLORSPACE>} If this function succeeds, the return value is a handle that identifies a color space.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-createcolorspacew
     * @since windows5.0
     */
    static CreateColorSpaceW(lplcs) {
        result := DllCall("GDI32.dll\CreateColorSpaceW", "ptr", lplcs, "ptr")
        return result
    }

    /**
     * The SetColorSpace function defines the input color space for a given device context.
     * @param {Pointer<HDC>} hdc Specifies the handle to a device context.
     * @param {Pointer<HCOLORSPACE>} hcs Identifies handle to the color space to set.
     * @returns {Pointer<HCOLORSPACE>} If this function succeeds, the return value is a handle to the <i>hColorSpace</i> being replaced.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setcolorspace
     * @since windows5.0
     */
    static SetColorSpace(hdc, hcs) {
        result := DllCall("GDI32.dll\SetColorSpace", "ptr", hdc, "ptr", hcs, "ptr")
        return result
    }

    /**
     * The DeleteColorSpace function removes and destroys a specified color space.
     * @param {Pointer<HCOLORSPACE>} hcs Specifies the handle to a color space to delete.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-deletecolorspace
     * @since windows5.0
     */
    static DeleteColorSpace(hcs) {
        result := DllCall("GDI32.dll\DeleteColorSpace", "ptr", hcs, "int")
        return result
    }

    /**
     * The GetICMProfile function retrieves the file name of the current output color profile for a specified device context. (ANSI)
     * @remarks
     * <b>GetICMProfile</b> obtains the file name of the current output profile regardless of whether or not color management is enabled for the device context.
     * 
     * Given a device context, <b>GetICMProfile</b> will output, through the parameter <i>lpszFilename</i>, the path name of the file containing the color profile currently being used by the device context. It will also output, through the parameter <i>lpcbName</i>, the length of the string containing the path name.
     * 
     * It is possible that the profile name returned by <b>GetICMProfile</b> will not be in the list of profiles returned by <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumicmprofilesa">EnumICMProfiles</a>. The <b>EnumICMProfiles</b> function returns all color space profiles that are associated with a device context (DC) whose settings match that of the DC. If the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-seticmprofilea">SetICMProfile</a> function is used to set the current profile, a profile may be associated with the DC that does not match its settings. For instance, the <b>SetICMProfile</b> function can be used to associate the device-independent sRGB profile with a DC. This profile will be used as the current WCS profile for that DC, and calls to <b>GetICMProfile</b> will return its file name. However, the profile will not appear in the list of profiles that is returned from <b>EnumICMProfiles</b>.
     * 
     * If this function is called before any calls to the <b>SetICMProfile</b> function, it can be used to get the default profile for a device context.
     * 
     * <b>Windows 95/98/Me: </b><b>GetICMProfileW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines GetICMProfile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HDC>} hdc Specifies a device context from which to retrieve the color profile.
     * @param {Pointer<UInt32>} pBufSize Pointer to a <b>DWORD</b> that contains the size of the buffer pointed to by <i>lpszFilename</i>. For the ANSI version of this function, the size is in bytes. For the Unicode version, the size is in WCHARs. If this function is successful, on return this parameter contains the size of the buffer actually used. However, if the buffer is not large enough, this function returns <b>FALSE</b>. In this case, the <b>GetLastError()</b> function returns ERROR_INSUFFICIENT_BUFFER and the <b>DWORD</b> pointed to by this parameter contains the size needed for the <i>lpszFilename</i> buffer.
     * @param {Pointer<PSTR>} pszFilename Points to the buffer that receives the path name of the profile.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>. It also returns <b>TRUE</b> if the <i>lpszFilename</i> parameter is <b>NULL</b> and the size required for the buffer is copied into <i>lpcbName.</i>
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-geticmprofilea
     * @since windows5.0
     */
    static GetICMProfileA(hdc, pBufSize, pszFilename) {
        pszFilename := pszFilename is String? StrPtr(pszFilename) : pszFilename

        result := DllCall("GDI32.dll\GetICMProfileA", "ptr", hdc, "ptr", pBufSize, "ptr", pszFilename, "int")
        return result
    }

    /**
     * The GetICMProfile function retrieves the file name of the current output color profile for a specified device context. (Unicode)
     * @remarks
     * <b>GetICMProfile</b> obtains the file name of the current output profile regardless of whether or not color management is enabled for the device context.
     * 
     * Given a device context, <b>GetICMProfile</b> will output, through the parameter <i>lpszFilename</i>, the path name of the file containing the color profile currently being used by the device context. It will also output, through the parameter <i>lpcbName</i>, the length of the string containing the path name.
     * 
     * It is possible that the profile name returned by <b>GetICMProfile</b> will not be in the list of profiles returned by <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumicmprofilesa">EnumICMProfiles</a>. The <b>EnumICMProfiles</b> function returns all color space profiles that are associated with a device context (DC) whose settings match that of the DC. If the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-seticmprofilea">SetICMProfile</a> function is used to set the current profile, a profile may be associated with the DC that does not match its settings. For instance, the <b>SetICMProfile</b> function can be used to associate the device-independent sRGB profile with a DC. This profile will be used as the current WCS profile for that DC, and calls to <b>GetICMProfile</b> will return its file name. However, the profile will not appear in the list of profiles that is returned from <b>EnumICMProfiles</b>.
     * 
     * If this function is called before any calls to the <b>SetICMProfile</b> function, it can be used to get the default profile for a device context.
     * 
     * <b>Windows 95/98/Me: </b><b>GetICMProfileW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines GetICMProfile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HDC>} hdc Specifies a device context from which to retrieve the color profile.
     * @param {Pointer<UInt32>} pBufSize Pointer to a <b>DWORD</b> that contains the size of the buffer pointed to by <i>lpszFilename</i>. For the ANSI version of this function, the size is in bytes. For the Unicode version, the size is in WCHARs. If this function is successful, on return this parameter contains the size of the buffer actually used. However, if the buffer is not large enough, this function returns <b>FALSE</b>. In this case, the <b>GetLastError()</b> function returns ERROR_INSUFFICIENT_BUFFER and the <b>DWORD</b> pointed to by this parameter contains the size needed for the <i>lpszFilename</i> buffer.
     * @param {Pointer<PWSTR>} pszFilename Points to the buffer that receives the path name of the profile.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>. It also returns <b>TRUE</b> if the <i>lpszFilename</i> parameter is <b>NULL</b> and the size required for the buffer is copied into <i>lpcbName.</i>
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-geticmprofilew
     * @since windows5.0
     */
    static GetICMProfileW(hdc, pBufSize, pszFilename) {
        pszFilename := pszFilename is String? StrPtr(pszFilename) : pszFilename

        result := DllCall("GDI32.dll\GetICMProfileW", "ptr", hdc, "ptr", pBufSize, "ptr", pszFilename, "int")
        return result
    }

    /**
     * The SetICMProfile function sets a specified color profile as the output profile for a specified device context (DC). (ANSI)
     * @remarks
     * <b>SetICMProfile</b> associates a color profile with a device context. It becomes the output profile for that device context. The color profile does not have to be associated with any particular device. Device-independent profiles such as sRGB can also be used. If the color profile is not associated with a hardware device, it will be returned by <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-geticmprofilea">GetICMProfile</a>, but not by <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumicmprofilesa">EnumICMProfiles</a>.
     * 
     * Note that under Windows 95 or later, the PostScript device driver for printers assumes a CMYK color model. Therefore, all PostScript printers must use a CMYK color profile. Windows 2000 does not have this limitation.
     * 
     * <b>SetICMProfile</b> supports only RGB profiles in compatible DCs.
     * 
     * <b>Windows 95/98/Me: </b><b>SetICMProfileW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines SetICMProfile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HDC>} hdc Specifies a device context in which to set the color profile.
     * @param {Pointer<PSTR>} lpFileName Specifies the path name of the color profile to be set.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-seticmprofilea
     * @since windows5.0
     */
    static SetICMProfileA(hdc, lpFileName) {
        lpFileName := lpFileName is String? StrPtr(lpFileName) : lpFileName

        result := DllCall("GDI32.dll\SetICMProfileA", "ptr", hdc, "ptr", lpFileName, "int")
        return result
    }

    /**
     * The SetICMProfile function sets a specified color profile as the output profile for a specified device context (DC). (Unicode)
     * @remarks
     * <b>SetICMProfile</b> associates a color profile with a device context. It becomes the output profile for that device context. The color profile does not have to be associated with any particular device. Device-independent profiles such as sRGB can also be used. If the color profile is not associated with a hardware device, it will be returned by <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-geticmprofilea">GetICMProfile</a>, but not by <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumicmprofilesa">EnumICMProfiles</a>.
     * 
     * Note that under Windows 95 or later, the PostScript device driver for printers assumes a CMYK color model. Therefore, all PostScript printers must use a CMYK color profile. Windows 2000 does not have this limitation.
     * 
     * <b>SetICMProfile</b> supports only RGB profiles in compatible DCs.
     * 
     * <b>Windows 95/98/Me: </b><b>SetICMProfileW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines SetICMProfile as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HDC>} hdc Specifies a device context in which to set the color profile.
     * @param {Pointer<PWSTR>} lpFileName Specifies the path name of the color profile to be set.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-seticmprofilew
     * @since windows5.0
     */
    static SetICMProfileW(hdc, lpFileName) {
        lpFileName := lpFileName is String? StrPtr(lpFileName) : lpFileName

        result := DllCall("GDI32.dll\SetICMProfileW", "ptr", hdc, "ptr", lpFileName, "int")
        return result
    }

    /**
     * The GetDeviceGammaRamp function gets the gamma ramp on direct color display boards having drivers that support downloadable gamma ramps in hardware.
     * @remarks
     * Direct color display modes do not use color lookup tables and are usually 16, 24, or 32 bit. Not all direct color video boards support loadable gamma ramps. <b>GetDeviceGammaRamp</b> succeeds only for devices with drivers that support downloadable gamma ramps in hardware.
     * @param {Pointer<HDC>} hdc Specifies the device context of the direct color display board in question.
     * @param {Pointer<Void>} lpRamp Points to a buffer where the function can place the current gamma ramp of the color display board. The gamma ramp is specified in three arrays of 256 <b>WORD</b> elements each, which contain the mapping between RGB values in the frame buffer and digital-analog-converter (DAC) values. The sequence of the arrays is red, green, blue.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getdevicegammaramp
     * @since windows5.0
     */
    static GetDeviceGammaRamp(hdc, lpRamp) {
        result := DllCall("GDI32.dll\GetDeviceGammaRamp", "ptr", hdc, "ptr", lpRamp, "int")
        return result
    }

    /**
     * The SetDeviceGammaRamp function sets the gamma ramp on direct color display boards having drivers that support downloadable gamma ramps in hardware.
     * @remarks
     * Direct color display modes do not use color lookup tables and are usually 16, 24, or 32 bit. Not all direct color video boards support loadable gamma ramps. <b>SetDeviceGammaRamp</b> succeeds only for devices with drivers that support downloadable gamma ramps in hardware.
     * 
     * > [!NOTE]
     * > This API can take a non-trivial amount of time to execute. It may take as long as 200ms to return on some hardware.
     * @param {Pointer<HDC>} hdc Specifies the device context of the direct color display board in question.
     * @param {Pointer<Void>} lpRamp Pointer to a buffer containing the gamma ramp to be set. The gamma ramp is specified in three arrays of 256 <b>WORD</b> elements each, which contain the mapping between RGB values in the frame buffer and digital-analog-converter (<i>DAC</i> ) values. The sequence of the arrays is red, green, blue. The RGB values must be stored in the most significant bits of each WORD to increase DAC independence.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setdevicegammaramp
     * @since windows5.0
     */
    static SetDeviceGammaRamp(hdc, lpRamp) {
        result := DllCall("GDI32.dll\SetDeviceGammaRamp", "ptr", hdc, "ptr", lpRamp, "int")
        return result
    }

    /**
     * The ColorMatchToTarget function enables you to preview colors as they would appear on the target device.
     * @remarks
     * <b>ColorMatchToTarget</b> can be used to proof the colors of a color output device on another color output device. Setting the <i>uiAction</i> parameter to CS_ENABLE causes all subsequent drawing commands to the DC to render colors as they would appear on the target device. If <i>uiAction</i> is set to CS_DISABLE, proofing is turned off. However, the current color transform is not deleted from the DC. It is just inactive.
     * 
     * When <b>ColorMatchToTarget</b> is called, the color transform for the target device is performed first, and then the transform to the preview device is applied to the results of the first transform. This is used primarily for checking gamut mapping conditions. Before using this function, you must enable WCS for both device contexts.
     * 
     * This function cannot be cascaded. While color mapping to the target is enabled by setting <i>uiAction</i> to CS_ENABLE, application changes to the color space or gamut mapping method are ignored. Those changes then take effect when color mapping to the target is disabled.
     * 
     * <div class="alert"><b>Note</b>  A memory leak will not occur if an application does not delete a transform using CS_DELETE_TRANSFORM. The transform will be deleted when either the device context (DC) is closed, or when the application color space is deleted. However if the transform is not going to be used again, or if the application will not be performing any more color matching on the DC, it should explicitly delete the transform to free the memory it occupies.</div>
     * <div> </div>
     * The <i>uiAction</i> parameter should only be set to CS_DELETE_TRANSFORM if color management is enabled before the <b>ColorMatchToTarget</b> function is called.
     * @param {Pointer<HDC>} hdc Specifies the device context for previewing, generally the screen.
     * @param {Pointer<HDC>} hdcTarget Specifies the target device context, generally a printer.
     * @param {Integer} action 
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-colormatchtotarget
     * @since windows5.0
     */
    static ColorMatchToTarget(hdc, hdcTarget, action) {
        result := DllCall("GDI32.dll\ColorMatchToTarget", "ptr", hdc, "ptr", hdcTarget, "uint", action, "int")
        return result
    }

    /**
     * The EnumICMProfiles function enumerates the different output color profiles that the system supports for a given device context. (ANSI)
     * @remarks
     * The <b>EnumICMProfiles</b> function returns a list of profiles that are associated with a device context (DC), and whose settings match those of the DC. It is possible for a device context to contain device profiles that are not associated with particular hardware devices, or device profiles that do not match the settings of the DC. The sRGB profile is an example. The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-seticmprofilea">SetICMProfile</a> function is used to associate these types of profiles with a DC. The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-geticmprofilea">GetICMProfile</a> function can be used to retrieve a profile that is not enumerated by the <b>EnumICMProfiles</b> function.
     * 
     * <b>Windows 95/98/Me:</b><b>EnumICMProfilesW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines EnumICMProfiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HDC>} hdc Specifies the device context.
     * @param {Pointer<ICMENUMPROCA>} proc Specifies the procedure instance address of a callback function defined by the application. (See <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nc-wingdi-icmenumproca">EnumICMProfilesProcCallback</a>.)
     * @param {Pointer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-enumicmprofilesa
     * @since windows5.0
     */
    static EnumICMProfilesA(hdc, proc, param2) {
        DllCall("GDI32.dll\EnumICMProfilesA", "ptr", hdc, "ptr", proc, "ptr", param2)
    }

    /**
     * The EnumICMProfiles function enumerates the different output color profiles that the system supports for a given device context. (Unicode)
     * @remarks
     * The <b>EnumICMProfiles</b> function returns a list of profiles that are associated with a device context (DC), and whose settings match those of the DC. It is possible for a device context to contain device profiles that are not associated with particular hardware devices, or device profiles that do not match the settings of the DC. The sRGB profile is an example. The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-seticmprofilea">SetICMProfile</a> function is used to associate these types of profiles with a DC. The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-geticmprofilea">GetICMProfile</a> function can be used to retrieve a profile that is not enumerated by the <b>EnumICMProfiles</b> function.
     * 
     * <b>Windows 95/98/Me:</b><b>EnumICMProfilesW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines EnumICMProfiles as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<HDC>} hdc Specifies the device context.
     * @param {Pointer<ICMENUMPROCW>} proc Specifies the procedure instance address of a callback function defined by the application. (See <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nc-wingdi-icmenumproca">EnumICMProfilesProcCallback</a>.)
     * @param {Pointer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-enumicmprofilesw
     * @since windows5.0
     */
    static EnumICMProfilesW(hdc, proc, param2) {
        DllCall("GDI32.dll\EnumICMProfilesW", "ptr", hdc, "ptr", proc, "ptr", param2)
    }

    /**
     * The UpdateICMRegKey function manages color profiles and Color Management Modules in the system. (ANSI)
     * @remarks
     * Not all parameters are used by all functions. The <i>nCommand</i> parameter specifies the function to execute.
     * 
     * This function is retained for backward compatibility and may be removed in future versions of ICM.
     * 
     * <b>Windows 95/98/Me: </b><b>UpdateICMRegKeyW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines UpdateICMRegKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpszCMID Points to a string that specifies the ICC profile identifier for the color management DLL to use with the profile.
     * @param {Pointer<PSTR>} lpszFileName Points to a fully qualified ICC color profile file name or to a <b>DEVMODE</b> structure.
     * @param {Integer} command 
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-updateicmregkeya
     * @since windows5.0
     */
    static UpdateICMRegKeyA(lpszCMID, lpszFileName, command) {
        static reserved := 0 ;Reserved parameters must always be NULL

        lpszCMID := lpszCMID is String? StrPtr(lpszCMID) : lpszCMID
        lpszFileName := lpszFileName is String? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("GDI32.dll\UpdateICMRegKeyA", "uint", reserved, "ptr", lpszCMID, "ptr", lpszFileName, "uint", command, "int")
        return result
    }

    /**
     * The UpdateICMRegKey function manages color profiles and Color Management Modules in the system. (Unicode)
     * @remarks
     * Not all parameters are used by all functions. The <i>nCommand</i> parameter specifies the function to execute.
     * 
     * This function is retained for backward compatibility and may be removed in future versions of ICM.
     * 
     * <b>Windows 95/98/Me: </b><b>UpdateICMRegKeyW</b> is supported by the Microsoft Layer for Unicode. To use this, you must add certain files to your application, as outlined in <a href="https://msdn.microsoft.com/library?url=/library/mslu/winprog/microsoft_layer_for_unicode_on_windows_95_98_me_systems.asp">Microsoft Layer for Unicode on Windows 95/98/Me Systems</a>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines UpdateICMRegKey as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpszCMID Points to a string that specifies the ICC profile identifier for the color management DLL to use with the profile.
     * @param {Pointer<PWSTR>} lpszFileName Points to a fully qualified ICC color profile file name or to a <b>DEVMODE</b> structure.
     * @param {Integer} command 
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-updateicmregkeyw
     * @since windows5.0
     */
    static UpdateICMRegKeyW(lpszCMID, lpszFileName, command) {
        static reserved := 0 ;Reserved parameters must always be NULL

        lpszCMID := lpszCMID is String? StrPtr(lpszCMID) : lpszCMID
        lpszFileName := lpszFileName is String? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("GDI32.dll\UpdateICMRegKeyW", "uint", reserved, "ptr", lpszCMID, "ptr", lpszFileName, "uint", command, "int")
        return result
    }

    /**
     * The ColorCorrectPalette function corrects the entries of a palette using the WCS 1.0 parameters in the specified device context.
     * @param {Pointer<HDC>} hdc Specifies a device context whose WCS parameters to use.
     * @param {Pointer<HPALETTE>} hPal Specifies the handle to the palette to be color corrected.
     * @param {Integer} deFirst Specifies the first entry in the palette to be color corrected.
     * @param {Integer} num Specifies the number of entries to color correct.
     * @returns {Integer} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-colorcorrectpalette
     * @since windows5.0
     */
    static ColorCorrectPalette(hdc, hPal, deFirst, num) {
        result := DllCall("GDI32.dll\ColorCorrectPalette", "ptr", hdc, "ptr", hPal, "uint", deFirst, "uint", num, "int")
        return result
    }

    /**
     * Creates a handle to a specified color profile. The handle can then be used in other profile management functions. (ANSI)
     * @remarks
     * If the profile data is not specified using a file name, *dwShareMode* and *dwCreationMode* are ignored.
     * 
     * *dwCreationMode* flags CREATE\_NEW, CREATE\_ALWAYS, and TRUNCATE\_EXISTING, will always return blank ICC HPROFILEs. If other *dwCreationMode* flags are present, InternalOpenColorProfile is called (using the flags as provided by the API) to determine whether the profile is ICC or WCS XML.
     * 
     * Within the ICC code path, an ICC HPROFILE is returned using the requested sharing, access and creation flags as specified in the tables above.
     * 
     * Within the WCS path, the *dwCreationMode* flag OPEN\_ALWAYS will fail if the profile doesn't exist, since WCS profiles cannot be created or edited within the WCS architecture (they must be edited outside of it, using MSXML6). For the same reason, *dwShareMode* flag FILE\_SHARE\_WRITE, and *dwDesiredAccess* flag PROFILE\_READWRITE are ignored within the WCS path.
     * 
     * When the function opens the ICC profile, it will look for a *WcsProfilesTag* and, if there is one, it will extract and use the original WCS profiles contained therein. (See [**WcsCreateIccProfile**](/windows/win32/api/icm/nf-icm-wcscreateiccprofile).)
     * 
     * An HPROFILE with WCS profile information is derived from a DMP by acquiring the default CAMP and default GMMP from the registry. An HPROFILE is a composition of a DMP, CAMP and GMMP.
     * 
     * Once the handle to the color profile is created, any information used to create that handle can be deleted.
     * 
     * Use the [**CloseColorProfile**](/windows/win32/api/icm/nf-icm-closecolorprofile) function to close an object handle returned by **OpenColorProfile**.
     * @param {Pointer<PROFILE>} pProfile Pointer to a color profile structure specifying the profile. The *pProfile* pointer can be freed as soon as the handle is created.
     * @param {Integer} dwDesiredAccess Specifies how to access the given profile. This parameter must take one the following constant values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | <span id="PROFILE_READ"></span><span id="profile_read"></span><dl> <dt>**PROFILE\_READ**</dt> </dl> | Opens the profile for read access.<br/> |
     * | <span id="PROFILE_READWRITE"></span><span id="profile_readwrite"></span><dl> <dt>**PROFILE\_READWRITE**</dt> </dl> | Opens the profile for both read and write access. Has no effect for WCS XML profiles.<br/> |
     * @param {Integer} dwShareMode Specifies how the profile should be shared, if the profile is contained in a file. A value of zero prevents the profile from being shared at all. The parameter can contain one or both of the following constants (combined by addition or logical OR).
     * 
     * | Value | Meaning |
     * |-|-|
     * | <span id="FILE_SHARE_READ"></span><span id="file_share_read"></span><dl> <dt>**FILE\_SHARE\_READ**</dt> </dl> | Other open operations can be performed on the profile for read access.<br/> |
     * | <span id="FILE_SHARE_WRITE"></span><span id="file_share_write"></span><dl> <dt>**FILE\_SHARE\_WRITE**</dt> </dl> | Other open operations can be performed on the profile for write access. Has no effect for WCS XML profiles.<br/> |
     * @param {Integer} dwCreationMode Specifies which actions to take on the profile while opening it, if it is contained in a file. This parameter must take one of the following constant values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | <span id="CREATE_NEW"></span><span id="create_new"></span><dl> <dt>**CREATE\_NEW**</dt> </dl> | Creates a new profile. Fails if the profile already exists.<br/> |
     * | <span id="CREATE_ALWAYS"></span><span id="create_always"></span><dl> <dt>**CREATE\_ALWAYS**</dt> </dl> | Creates a new profile. Overwrites the profile if it exists.<br/> |
     * | <span id="OPEN_EXISTING"></span><span id="open_existing"></span><dl> <dt>**OPEN\_EXISTING**</dt> </dl> | Opens the profile. Fails if it does not exist<br/> |
     * | <span id="OPEN_ALWAYS"></span><span id="open_always"></span><dl> <dt>**OPEN\_ALWAYS**</dt> </dl> | Opens the profile if it exists. For ICC profiles, if the profile does not exist, creates the profile. For WCS XML profiles, if the profile does not exist, returns an error.<br/> |
     * | <span id="TRUNCATE_EXISTING"></span><span id="truncate_existing"></span><dl> <dt>**TRUNCATE\_EXISTING**</dt> </dl> | Opens the profile, and truncates it to zero bytes, returning a blank ICC profile. Fails if the profile doesn't exist.<br/> |
     * @returns {Pointer} If this function succeeds, the return value is the handle of the color profile that is opened. For ICC and WCS profiles, a CAMP and GMMP are provided by the function based on the current default CAMP and GMMP in the registry.
     * 
     * When OpenColorProfile encounters an ICC profile with an embedded WCS profile, and if the dwType member within the Profile structure does not take the value DONT\_USE\_EMBEDDED\_WCS\_PROFILES, it should extract and use the WCS profile(s) contained in this WcsProfilesTag. The HPROFILE returned would be a WCS HPROFILE.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-opencolorprofilea
     */
    static OpenColorProfileA(pProfile, dwDesiredAccess, dwShareMode, dwCreationMode) {
        result := DllCall("mscms.dll\OpenColorProfileA", "ptr", pProfile, "uint", dwDesiredAccess, "uint", dwShareMode, "uint", dwCreationMode, "ptr")
        return result
    }

    /**
     * Creates a handle to a specified color profile. The handle can then be used in other profile management functions. (Unicode)
     * @remarks
     * If the profile data is not specified using a file name, *dwShareMode* and *dwCreationMode* are ignored.
     * 
     * *dwCreationMode* flags CREATE\_NEW, CREATE\_ALWAYS, and TRUNCATE\_EXISTING, will always return blank ICC HPROFILEs. If other *dwCreationMode* flags are present, InternalOpenColorProfile is called (using the flags as provided by the API) to determine whether the profile is ICC or WCS XML.
     * 
     * Within the ICC code path, an ICC HPROFILE is returned using the requested sharing, access and creation flags as specified in the tables above.
     * 
     * Within the WCS path, the *dwCreationMode* flag OPEN\_ALWAYS will fail if the profile doesn't exist, since WCS profiles cannot be created or edited within the WCS architecture (they must be edited outside of it, using MSXML6). For the same reason, *dwShareMode* flag FILE\_SHARE\_WRITE, and *dwDesiredAccess* flag PROFILE\_READWRITE are ignored within the WCS path.
     * 
     * When the function opens the ICC profile, it will look for a *WcsProfilesTag* and, if there is one, it will extract and use the original WCS profiles contained therein. (See [**WcsCreateIccProfile**](/windows/win32/api/icm/nf-icm-wcscreateiccprofile).)
     * 
     * An HPROFILE with WCS profile information is derived from a DMP by acquiring the default CAMP and default GMMP from the registry. An HPROFILE is a composition of a DMP, CAMP and GMMP.
     * 
     * Once the handle to the color profile is created, any information used to create that handle can be deleted.
     * 
     * Use the [**CloseColorProfile**](/windows/win32/api/icm/nf-icm-closecolorprofile) function to close an object handle returned by **OpenColorProfile**.
     * @param {Pointer<PROFILE>} pProfile Pointer to a color profile structure specifying the profile. The *pProfile* pointer can be freed as soon as the handle is created.
     * @param {Integer} dwDesiredAccess Specifies how to access the given profile. This parameter must take one the following constant values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | <span id="PROFILE_READ"></span><span id="profile_read"></span><dl> <dt>**PROFILE\_READ**</dt> </dl> | Opens the profile for read access.<br/> |
     * | <span id="PROFILE_READWRITE"></span><span id="profile_readwrite"></span><dl> <dt>**PROFILE\_READWRITE**</dt> </dl> | Opens the profile for both read and write access. Has no effect for WCS XML profiles.<br/> |
     * @param {Integer} dwShareMode Specifies how the profile should be shared, if the profile is contained in a file. A value of zero prevents the profile from being shared at all. The parameter can contain one or both of the following constants (combined by addition or logical OR).
     * 
     * | Value | Meaning |
     * |-|-|
     * | <span id="FILE_SHARE_READ"></span><span id="file_share_read"></span><dl> <dt>**FILE\_SHARE\_READ**</dt> </dl> | Other open operations can be performed on the profile for read access.<br/> |
     * | <span id="FILE_SHARE_WRITE"></span><span id="file_share_write"></span><dl> <dt>**FILE\_SHARE\_WRITE**</dt> </dl> | Other open operations can be performed on the profile for write access. Has no effect for WCS XML profiles.<br/> |
     * @param {Integer} dwCreationMode Specifies which actions to take on the profile while opening it, if it is contained in a file. This parameter must take one of the following constant values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | <span id="CREATE_NEW"></span><span id="create_new"></span><dl> <dt>**CREATE\_NEW**</dt> </dl> | Creates a new profile. Fails if the profile already exists.<br/> |
     * | <span id="CREATE_ALWAYS"></span><span id="create_always"></span><dl> <dt>**CREATE\_ALWAYS**</dt> </dl> | Creates a new profile. Overwrites the profile if it exists.<br/> |
     * | <span id="OPEN_EXISTING"></span><span id="open_existing"></span><dl> <dt>**OPEN\_EXISTING**</dt> </dl> | Opens the profile. Fails if it does not exist<br/> |
     * | <span id="OPEN_ALWAYS"></span><span id="open_always"></span><dl> <dt>**OPEN\_ALWAYS**</dt> </dl> | Opens the profile if it exists. For ICC profiles, if the profile does not exist, creates the profile. For WCS XML profiles, if the profile does not exist, returns an error.<br/> |
     * | <span id="TRUNCATE_EXISTING"></span><span id="truncate_existing"></span><dl> <dt>**TRUNCATE\_EXISTING**</dt> </dl> | Opens the profile, and truncates it to zero bytes, returning a blank ICC profile. Fails if the profile doesn't exist.<br/> |
     * @returns {Pointer} If this function succeeds, the return value is the handle of the color profile that is opened. For ICC and WCS profiles, a CAMP and GMMP are provided by the function based on the current default CAMP and GMMP in the registry.
     * 
     * When OpenColorProfile encounters an ICC profile with an embedded WCS profile, and if the dwType member within the Profile structure does not take the value DONT\_USE\_EMBEDDED\_WCS\_PROFILES, it should extract and use the WCS profile(s) contained in this WcsProfilesTag. The HPROFILE returned would be a WCS HPROFILE.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-opencolorprofilew
     */
    static OpenColorProfileW(pProfile, dwDesiredAccess, dwShareMode, dwCreationMode) {
        result := DllCall("mscms.dll\OpenColorProfileW", "ptr", pProfile, "uint", dwDesiredAccess, "uint", dwShareMode, "uint", dwCreationMode, "ptr")
        return result
    }

    /**
     * Closes an open profile handle.
     * @param {Pointer} hProfile Handle to the profile to be closed. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-closecolorprofile
     */
    static CloseColorProfile(hProfile) {
        result := DllCall("mscms.dll\CloseColorProfile", "ptr", hProfile, "int")
        return result
    }

    /**
     * Given a handle to an open color profile, the **GetColorProfileFromHandle** function copies the contents of the profile into a buffer supplied by the application. If the handle is a Windows Color System (WCS) handle, then the DMP is returned and the CAMP and GMMP associated with the HPROFILE are ignored.
     * @param {Pointer} hProfile Handle to an open color profile. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Pointer<Byte>} pProfile Pointer to buffer to receive raw ICC or DMP profile data. Can be **NULL**. If it is, the size required for the buffer will be stored in the memory location pointed to by *pcbSize*. The buffer can be allocated to the appropriate size, and this function called again with *pBuffer* containing the address of the buffer.
     * @param {Pointer<UInt32>} pcbProfile Pointer to a **DWORD** that holds the size of buffer pointed at by *pBuffer*. On return it is filled with size of buffer that was actually used if the function succeeds. If this function is called with *pBuffer* set to **NULL**, this parameter will contain the size of the buffer required.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**. It returns **FALSE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcolorprofilefromhandle
     */
    static GetColorProfileFromHandle(hProfile, pProfile, pcbProfile) {
        result := DllCall("mscms.dll\GetColorProfileFromHandle", "ptr", hProfile, "ptr", pProfile, "ptr", pcbProfile, "int")
        return result
    }

    /**
     * Allows you to determine whether the specified profile is a valid International Color Consortium (ICC) profile, or a valid Windows Color System (WCS) profile handle that can be used for color management.
     * @param {Pointer} hProfile Specifies a handle to the profile to be validated. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Pointer<Int32>} pbValid Pointer to a variable that is set to **TRUE** on return if the operation succeeds and the profile is a valid ICC or WCS profile. If the operation fails or the profile is not valid the variable is **FALSE**.
     * @returns {Integer} If this function succeeds and the profile is valid, the return value is **TRUE**.
     * 
     * If this function fails (or succeeds and the profile is not valid), the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-iscolorprofilevalid
     */
    static IsColorProfileValid(hProfile, pbValid) {
        result := DllCall("mscms.dll\IsColorProfileValid", "ptr", hProfile, "ptr", pbValid, "int")
        return result
    }

    /**
     * Converts a logical [color space](/windows/win32/wcs/c) to a [device profile](/windows/win32/wcs/d). (ANSI)
     * @remarks
     * This function can be used with ASCII or Unicode strings. The buffer created by this function must be freed by the caller when it is no longer needed or there will be a memory leak. The [GlobalFree](/windows/win32/api/winbase/nf-winbase-globalfree) function should be used to free this buffer.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @param {Pointer<LOGCOLORSPACEA>} pLogColorSpace A pointer to a logical color space structure. See [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) for details. The **lcsFilename** \[0\] member of the structure must be set to the **null** character ('\\0') or this function call will fail with the return value of INVALID\_PARAMETER.
     * @param {Pointer<Byte>} pProfile A pointer to a pointer to a buffer where the device profile will be created. This function allocates the buffer and fills it with profile information if it is successful. If not, the pointer is set to **NULL**. The caller is responsible for freeing this buffer when it is no longer needed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * 
     * If the **lcsFilename** \[0\] member if the [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) structure pointed to by *pLogColorSpace* is not '\\0', this function returns INVALID\_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-createprofilefromlogcolorspacea
     */
    static CreateProfileFromLogColorSpaceA(pLogColorSpace, pProfile) {
        result := DllCall("mscms.dll\CreateProfileFromLogColorSpaceA", "ptr", pLogColorSpace, "ptr", pProfile, "int")
        return result
    }

    /**
     * Converts a logical [color space](/windows/win32/wcs/c) to a [device profile](/windows/win32/wcs/d). (Unicode)
     * @remarks
     * This function can be used with ASCII or Unicode strings. The buffer created by this function must be freed by the caller when it is no longer needed or there will be a memory leak. The [GlobalFree](/windows/win32/api/winbase/nf-winbase-globalfree) function should be used to free this buffer.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @param {Pointer<LOGCOLORSPACEW>} pLogColorSpace A pointer to a logical color space structure. See [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) for details. The **lcsFilename** \[0\] member of the structure must be set to the **null** character ('\\0') or this function call will fail with the return value of INVALID\_PARAMETER.
     * @param {Pointer<Byte>} pProfile A pointer to a pointer to a buffer where the device profile will be created. This function allocates the buffer and fills it with profile information if it is successful. If not, the pointer is set to **NULL**. The caller is responsible for freeing this buffer when it is no longer needed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * 
     * If the **lcsFilename** \[0\] member if the [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) structure pointed to by *pLogColorSpace* is not '\\0', this function returns INVALID\_PARAMETER.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-createprofilefromlogcolorspacew
     */
    static CreateProfileFromLogColorSpaceW(pLogColorSpace, pProfile) {
        result := DllCall("mscms.dll\CreateProfileFromLogColorSpaceW", "ptr", pLogColorSpace, "ptr", pProfile, "int")
        return result
    }

    /**
     * Retrieves the number of tagged elements in a given color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP.
     * @param {Pointer} hProfile Specifies a handle to the profile in question.
     * @param {Pointer<UInt32>} pnElementCount Pointer to a variable in which to place the number of tagged elements in the profile.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcountcolorprofileelements
     */
    static GetCountColorProfileElements(hProfile, pnElementCount) {
        result := DllCall("mscms.dll\GetCountColorProfileElements", "ptr", hProfile, "ptr", pnElementCount, "int")
        return result
    }

    /**
     * Retrieves or derives ICC header structure from either ICC color profile or WCS XML profile. Drivers and applications should assume returning **TRUE** only indicates that a properly structured header is returned. Each tag will still need to be validated independently using either legacy ICM2 APIs or XML schema APIs.
     * @remarks
     * To determine whether the header is derived from an ICC or DMP profile handle, check the header signature (header bytes 36-39). If the signature is "acsp" (big endian) then an ICC profile was used. If the signature is "cdmp" (big-endian) then a DMP was used.
     * 
     * The distinguishing features that identify a header as having been "synthesized" for a WCS DMP are:
     * 
     * pIcmProfileHeader-&gt;phSignature = 'pmdc' (little endian = big endian 'cdmp')
     * 
     * pIcmProfileHeader-&gt;phCMMType = '1scw' (little endian = big endian 'wcs1').
     * @param {Pointer} hProfile Specifies a handle to the color profile in question.
     * @param {Pointer<PROFILEHEADER>} pHeader Points to a variable in which the ICC header structure is to be placed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. This function will fail is an invalid ICC or WCS XML profile is referenced in the hProfile parameter. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcolorprofileheader
     */
    static GetColorProfileHeader(hProfile, pHeader) {
        result := DllCall("mscms.dll\GetColorProfileHeader", "ptr", hProfile, "ptr", pHeader, "int")
        return result
    }

    /**
     * Retrieves the tag name specified by *dwIndex* in the tag table of a given International Color Consortium (ICC) color profile, where *dwIndex* is a one-based index into that table.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * **GetColorProfileElementTag** can be used to enumerate all tags in a profile after getting the number of tags in the profile using [**GetCountColorProfileElements**](/windows/win32/api/icm/nf-icm-getcountcolorprofileelements).
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because profile elements are implicitly associated with, and hard coded to, ICC tag types and there exist many robust XML parsing libraries.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} dwIndex Specifies the one-based index of the tag to retrieve.
     * @param {Pointer<UInt32>} pTag Pointer to a variable in which the tag name is to be placed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcolorprofileelementtag
     */
    static GetColorProfileElementTag(hProfile, dwIndex, pTag) {
        result := DllCall("mscms.dll\GetColorProfileElementTag", "ptr", hProfile, "uint", dwIndex, "ptr", pTag, "int")
        return result
    }

    /**
     * Reports whether a specified International Color Consortium (ICC) tag is present in the specified color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because profile elements are implicitly associated with and hard coded to ICC tag types and there exist many robust XML parsing libraries.
     * @param {Pointer} hProfile Specifies a handle to the ICC profile in question.
     * @param {Integer} tag Specifies the ICC tag to check.
     * @param {Pointer<Int32>} pbPresent Pointer to a variable that is set to **TRUE** on return if the specified ICC tag is present, or **FALSE** if not.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-iscolorprofiletagpresent
     */
    static IsColorProfileTagPresent(hProfile, tag, pbPresent) {
        result := DllCall("mscms.dll\IsColorProfileTagPresent", "ptr", hProfile, "uint", tag, "ptr", pbPresent, "int")
        return result
    }

    /**
     * Copies data from a specified tagged profile element of a specified color profile into a buffer.
     * @remarks
     * This function will fail if *hProfile* is not a valid International Color Consortium (ICC) profile.
     * 
     * If the *pBuffer* pointer is set to **NULL**, the size of the entire tagged element data in bytes is returned in the variable pointed to by *pcbSize,* and *dwOffset* is ignored.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because profile elements are implicitly associated with, and hard coded to, ICC tag types and there exist many robust XML parsing libraries.
     * @param {Pointer} hProfile Specifies a handle to the International Color Consortium (ICC) color profile in question.
     * @param {Integer} tag Identifies the tagged element from which to copy.
     * @param {Integer} dwOffset Specifies the offset from the first byte of the tagged element data at which to begin copying.
     * @param {Pointer<UInt32>} pcbElement Pointer to a variable specifying the number of bytes to copy. On return, the variable contains the number of bytes actually copied.
     * @param {Pointer<Void>} pElement Pointer to a buffer into which the tagged element data is to be copied. The buffer must contain at least as many bytes as are specified by the variable pointed to by *pcbSize*. If the *pBuffer* pointer is set to **NULL**, the size of the entire tagged element data in bytes is returned in the memory location pointed to by *pcbSize,* and *dwOffset* is ignored. In this case, the function will return **FALSE**.
     * @param {Pointer<Int32>} pbReference Points to a Boolean value that is set to **TRUE** if more than one tag in the color profile refers to the same data as the specified tag refers to, or **FALSE** if not.
     * @returns {Integer} If this function succeeds, the return value is nonzero.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcolorprofileelement
     */
    static GetColorProfileElement(hProfile, tag, dwOffset, pcbElement, pElement, pbReference) {
        result := DllCall("mscms.dll\GetColorProfileElement", "ptr", hProfile, "uint", tag, "uint", dwOffset, "ptr", pcbElement, "ptr", pElement, "ptr", pbReference, "int")
        return result
    }

    /**
     * Sets the header data in a specified ICC color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * If the color profile was not opened with read/write permission, **SetColorProfileHeader** fails.
     * 
     * **SetColorProfileHeader** overwrites the current header in the ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because profile elements are implicitly associated with and hard coded to ICC tag types and there exist many robust XML parsing libraries.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Pointer<PROFILEHEADER>} pHeader Pointer to the profile header data to write to the specified profile.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setcolorprofileheader
     */
    static SetColorProfileHeader(hProfile, pHeader) {
        result := DllCall("mscms.dll\SetColorProfileHeader", "ptr", hProfile, "ptr", pHeader, "int")
        return result
    }

    /**
     * Sets the size of a tagged element in an ICC color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * To create a new tagged element in a color profile, use **SetColorProfileElementSize** to set the size, then use [**SetColorProfileElement**](/windows/win32/api/icm/nf-icm-setcolorprofileelement) to set the element value.
     * 
     * If the specified tag already exists in the profile, **SetColorProfileElementSize** changes the size of the element by truncating it or adding zeroes at the end as the case may be.
     * 
     * If the specified tag already exists and is a reference to another tag, **SetColorProfileElementSize** creates a new data area for the tag that is not shared.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because profile elements are implicitly associated with and hard coded to ICC tag types and there exist many robust XML parsing libraries.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} tagType Identifies the tagged element.
     * @param {Integer} pcbElement Specifies the size to set the tagged element to. If *cbSize* is zero, this function deletes the specified tagged element. If the tag is a reference, only the tag table entry is deleted, not the data.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setcolorprofileelementsize
     */
    static SetColorProfileElementSize(hProfile, tagType, pcbElement) {
        result := DllCall("mscms.dll\SetColorProfileElementSize", "ptr", hProfile, "uint", tagType, "uint", pcbElement, "int")
        return result
    }

    /**
     * Sets the element data for a tagged profile element in an ICC color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * If the color profile is not opened for read/write permission, this function fails.
     * 
     * If *dwOffset* exceeds the size set for the specified tagged element, this function fails.
     * 
     * If *dwOffset* + *\*pcbSize* is greater than the size of the specified element, this function only writes as many bytes as will fit within the current size of the element.
     * 
     * Any existing data in the specified portion of the tagged element is overwritten when this function succeeds.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because profile elements are implicitly associated with and hard coded to ICC tag types and there exist many robust XML parsing libraries.
     * @param {Pointer} hProfile Specifies a handle to the ICC profile in question.
     * @param {Integer} tag Identifies the tagged element.
     * @param {Integer} dwOffset Specifies the offset from the first byte of the tagged element data at which to start writing.
     * @param {Pointer<UInt32>} pcbElement Pointer to a variable containing the number of bytes of data to write. On return, it contains the number of bytes actually written.
     * @param {Pointer<Void>} pElement Pointer to a buffer containing the data to write to the tagged element in the color profile.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setcolorprofileelement
     */
    static SetColorProfileElement(hProfile, tag, dwOffset, pcbElement, pElement) {
        result := DllCall("mscms.dll\SetColorProfileElement", "ptr", hProfile, "uint", tag, "uint", dwOffset, "ptr", pcbElement, "ptr", pElement, "int")
        return result
    }

    /**
     * Creates in a specified ICC color profile a new tag that references the same data as an existing tag.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * If *newTag* already exists or *refTag* does not exist, **SetColorProfileElementReference** fails.
     * 
     * If the color profile was not opened with read/write permission, **SetColorProfileElementReference** fails.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because profile elements are implicitly associated with and hard coded to ICC tag types and there exist many robust XML parsing libraries.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} newTag Identifies the new tag to create.
     * @param {Integer} refTag Identifies the existing tag whose data is to be referenced by the new tag.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setcolorprofileelementreference
     */
    static SetColorProfileElementReference(hProfile, newTag, refTag) {
        result := DllCall("mscms.dll\SetColorProfileElementReference", "ptr", hProfile, "uint", newTag, "uint", refTag, "int")
        return result
    }

    /**
     * Retrieves the PostScript Level 2 [color space](/windows/win32/wcs/c) array from an ICC color profile.
     * @remarks
     * If the color space array is not available in the profile, the **GetPS2ColorSpaceArray** function builds a PostScript Level 2 color space array using the profile contents. This array can then be used as the operand for the PostScript Level2 setcolorspace operator.
     * 
     * This method does not support WCS profiles.
     * @param {Pointer} hProfile Specifies a handle to the ICC profile from which to retrieve the PostScript Level 2 color space array.
     * @param {Integer} dwIntent 
     * @param {Integer} dwCSAType Specifies the type of color space array. See [Color Space Type Identifiers](/windows/win32/wcs/color-space-type-identifiers).
     * @param {Pointer<Byte>} pPS2ColorSpaceArray Pointer to a buffer in which the color space array is to be placed. If the *pBuffer* pointer is set to **NULL**, the function returns the required size of the buffer in the memory location pointed to by *pcbSize*.
     * @param {Pointer<UInt32>} pcbPS2ColorSpaceArray Pointer to a variable containing the size of the buffer in bytes. On return, it contains the number of bytes copied into the buffer.
     * @param {Pointer<Int32>} pbBinary Pointer to a Boolean variable. If set to **TRUE**, the data copied could be binary. If set to **FALSE**, data should be encoded as ASCII85. On return, the memory location pointed to by *pbBinary* indicates whether the data returned actually is binary (**TRUE**) or ASCII85 (**FALSE**).
     * @returns {Integer} If this function succeeds, the return value is **TRUE**. It also returns **TRUE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getps2colorspacearray
     */
    static GetPS2ColorSpaceArray(hProfile, dwIntent, dwCSAType, pPS2ColorSpaceArray, pcbPS2ColorSpaceArray, pbBinary) {
        result := DllCall("mscms.dll\GetPS2ColorSpaceArray", "ptr", hProfile, "uint", dwIntent, "uint", dwCSAType, "ptr", pPS2ColorSpaceArray, "ptr", pcbPS2ColorSpaceArray, "ptr", pbBinary, "int")
        return result
    }

    /**
     * Retrieves the PostScript Level 2 color [rendering intent](/windows/win32/wcs/r) from an ICC color profile.
     * @remarks
     * The rendering intent returned by **GetPS2ColorRenderingIntent** can be used as the operand for the PostScript Level 2 findcolorrendering operator.
     * 
     * This method does not support WCS profiles.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} dwIntent Specifies the desired rendering intent to retrieve. Valid values are:
     * 
     * INTENT\_PERCEPTUAL
     * 
     * INTENT\_SATURATION
     * 
     * INTENT\_RELATIVE\_COLORIMETRIC
     * 
     * INTENT\_ABSOLUTE\_COLORIMETRIC
     * 
     * For more information, see [Rendering Intents](/windows/win32/wcs/rendering-intents).
     * @param {Pointer<Byte>} pBuffer Points to a buffer in which the color rendering intent is to be placed. If the *pBuffer* pointer is set to **NULL**, the buffer size required is returned in *\*pcbSize*.
     * @param {Pointer<UInt32>} pcbPS2ColorRenderingIntent Points to a variable containing the buffer size in bytes. On return, this variable contains the number of bytes actually copied.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**. If this function succeeds, the return value is **TRUE**. It also returns **TRUE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getps2colorrenderingintent
     */
    static GetPS2ColorRenderingIntent(hProfile, dwIntent, pBuffer, pcbPS2ColorRenderingIntent) {
        result := DllCall("mscms.dll\GetPS2ColorRenderingIntent", "ptr", hProfile, "uint", dwIntent, "ptr", pBuffer, "ptr", pcbPS2ColorRenderingIntent, "int")
        return result
    }

    /**
     * Retrieves the PostScript Level 2 color rendering dictionary from the specified ICC color profile.
     * @remarks
     * If the dictionary is not available in the profile, the **GetPS2ColorRenderingDictionary** function builds one using the profile contents. This dictionary can then be used as the operand for the PostScript Level 2 **setcolorrendering** operator.
     * 
     * This method does not support WCS profiles.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} dwIntent Specifies the desired rendering intent for the color rendering dictionary. Valid values are:
     * 
     * * INTENT\_PERCEPTUAL
     * * INTENT\_SATURATION
     * * INTENT\_RELATIVE\_COLORIMETRIC
     * * INTENT\_ABSOLUTE\_COLORIMETRIC
     * 
     * For more information, see [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @param {Pointer<Byte>} pPS2ColorRenderingDictionary Pointer to a buffer in which the color rendering dictionary is to be placed. If the *pBuffer* pointer is set to **NULL**, the required buffer size is returned in *\*pcbSize*.
     * @param {Pointer<UInt32>} pcbPS2ColorRenderingDictionary Pointer to a variable containing the size of the buffer in bytes. On return, the variable contains the number of bytes actually copied.
     * @param {Pointer<Int32>} pbBinary Pointer to a Boolean variable. If **TRUE**, the color rendering dictionary could be copied in binary form. If **FALSE**, the dictionary will be encoded in ASCII85 form. On return, this Boolean variable indicates whether the dictionary was actually binary (**TRUE**) or ASCII85 (**FALSE**).
     * @returns {Integer} If this function succeeds, the return value is **TRUE**. It also returns **TRUE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getps2colorrenderingdictionary
     */
    static GetPS2ColorRenderingDictionary(hProfile, dwIntent, pPS2ColorRenderingDictionary, pcbPS2ColorRenderingDictionary, pbBinary) {
        result := DllCall("mscms.dll\GetPS2ColorRenderingDictionary", "ptr", hProfile, "uint", dwIntent, "ptr", pPS2ColorRenderingDictionary, "ptr", pcbPS2ColorRenderingDictionary, "ptr", pbBinary, "int")
        return result
    }

    /**
     * Retrieves information about the International Color Consortium (ICC) named color profile that is specified in the first parameter.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because named profiles are explicit ICC profile types.
     * @param {Pointer} hProfile The handle to the ICC profile from which the information will be retrieved.
     * @param {Pointer<NAMED_PROFILE_INFO>} pNamedProfileInfo A pointer to a **NAMED\_PROFILE\_INFO** structure.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getnamedprofileinfo
     */
    static GetNamedProfileInfo(hProfile, pNamedProfileInfo) {
        result := DllCall("mscms.dll\GetNamedProfileInfo", "ptr", hProfile, "ptr", pNamedProfileInfo, "int")
        return result
    }

    /**
     * Converts color names in a named color space to index numbers in an International Color Consortium (ICC) color profile.
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because named profiles are explicit ICC profile types.
     * @param {Pointer} hProfile The handle to an ICC named color profile.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of **DWORDS** that this function fills with the indices. The indices begin with one, not zero.
     * @param {Integer} dwCount The number of color names to convert.
     * @returns {Integer} If this function succeeds with the conversion, the return value is **TRUE**.
     * 
     * If the conversion function fails, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-convertcolornametoindex
     */
    static ConvertColorNameToIndex(hProfile, paColorName, paIndex, dwCount) {
        result := DllCall("mscms.dll\ConvertColorNameToIndex", "ptr", hProfile, "ptr", paColorName, "ptr", paIndex, "uint", dwCount, "int")
        return result
    }

    /**
     * Transforms indices in a color space to an array of names in a named color space. (ConvertIndexToColorName)
     * @remarks
     * This function will fail if *hProfile* is not a valid ICC profile.
     * 
     * This function does not support Windows Color System (WCS) profiles CAMP, DMP, and GMMP; because named profiles are explicit ICC profile types.
     * @param {Pointer} hProfile The handle to an International Color Consortium (ICC) color space profile.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of color-space index numbers. The indices begin with one, not zero.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Integer} dwCount The number of indices to convert.
     * @returns {Integer} If this conversion function succeeds, the return value is **TRUE**.
     * 
     * If this conversion function fails, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-convertindextocolorname
     */
    static ConvertIndexToColorName(hProfile, paIndex, paColorName, dwCount) {
        result := DllCall("mscms.dll\ConvertIndexToColorName", "ptr", hProfile, "ptr", paIndex, "ptr", paColorName, "uint", dwCount, "int")
        return result
    }

    /**
     * Creates an International Color Consortium (ICC) *device link profile* from a set of color profiles, using the specified intents.
     * @remarks
     * For HPROFILEs that contain WCS profile information, the HPROFILEs are converted into valid ICC profile handles and then these ICC profile handles are used in creating the device link profile.
     * 
     * The first and the last profiles in the array must be device profiles. The other profiles can be color space or abstract profiles.
     * 
     * Each profile's output color space must be the next profile's input color space.
     * 
     * The calling application must free the buffer allocated by this function and pointed to by the *pProfileData* parameter. The [**GlobalFree**](/windows/win32/api/winbase/nf-winbase-globalfree) function should be used to free the buffer.
     * @param {Pointer<IntPtr>} hProfile Pointer to an array of handles of the color profiles to be used. The function determines whether the HPROFILEs contain ICC profile information and, if so, it processes them appropriately.
     * @param {Integer} nProfiles Specifies the number of profiles in the array pointed to by *hProfile*.
     * @param {Pointer<UInt32>} padwIntent Pointer to an array of **DWORDS** containing the intents to be used. See [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @param {Integer} nIntents The number of intents in the array pointed to by *padwIntent*.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @param {Pointer<Byte>} pProfileData Pointer to a pointer to a buffer. If successful, this function allocates the buffer, places its address in *\*pProfileData*, and fills it with a device link profile. If the function succeeds, the calling application must free the buffer after it is no longer needed.
     * @param {Integer} indexPreferredCMM Specifies the one-based index of the color profile that indicates what color management module (CMM) to use. The application developer may allow Windows to choose the CMM by setting this parameter to INDEX\_DONT\_CARE. See [Using Color Management Modules (CMM)](/windows/win32/wcs/using-color-management-modules--cmm).
     * @returns {Integer} If this function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero. For extended error information, call GetLastError.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-createdevicelinkprofile
     */
    static CreateDeviceLinkProfile(hProfile, nProfiles, padwIntent, nIntents, dwFlags, pProfileData, indexPreferredCMM) {
        result := DllCall("mscms.dll\CreateDeviceLinkProfile", "ptr", hProfile, "uint", nProfiles, "ptr", padwIntent, "uint", nIntents, "uint", dwFlags, "ptr", pProfileData, "uint", indexPreferredCMM, "int")
        return result
    }

    /**
     * Creates a color transform that applications can use to perform color management. (ANSI)
     * @remarks
     * If the target profile is **NULL**, the transform goes from the source logical color space to the destination profile. If the target profile is given, the transform goes from the source logical color space to the target profile and then to the destination profile. This allows previewing output meant for the target device on the destination device.
     * 
     * The values in *dwFlags* are intended as hints only. The color management module must determine the best way to use them.
     * 
     * **Windows Vista**: Three new flags have been added that can be used with *dwFlags*:
     * 
     * | Flag | Description |
     * |-|-|
     * | **PRESERVEBLACK** | If this bit is set, the transform engine inserts the appropriate black generation GMMP as the last GMMP in the transform sequence. This flag only works in a pure WCS transform. |
     * | **SEQUENTIAL\_TRANSFORM** | If this bit is set, each step in the WCS processing pipeline is performed for every pixel in the image and no optimized color transform is built. This flag only works in a pure WCS transform.**Restrictions**: A transform created with the SEQUENTIAL\_TRANSFORM flag set may only be used in the thread on which it was created and only for one color translation call at a time. COM must be initialized prior to creating the sequential transform and must remain initialized for the lifetime of the transform object.<br/> |
     * | **WCS\_ALWAYS** | If this bit is set, even all-ICC transforms will use the WCS code path. |
     * 
     * > [!Note] 
     * > **SEQUENTIAL\_TRANSFORM** was inadvertently omitted from the icm.h header in the Windows Vista SDK. If you wish to use the **SEQUENTIAL\_TRANSFORM** flag, define it in your application as follows:\#define SEQUENTIAL\_TRANSFORM 0x80800000
     * 
     * For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags). All of the flags mentioned there are supported for all types of transforms, except for FAST\_TRANSLATE, which only works in a pure ICC-to-ICC transform.
     * 
     * The **CreateColorTransform** function is used outside of a device context. Colors may shift when transforming from a color profile to the same color profile. This is due to precision errors. Therefore, a color transform should not be performed under these circumstances.
     * 
     * The B2Ax tags are required for any profile that is the target of a transform.
     * 
     * WCS transform support for ICC ColorSpace profiles is limited to RGB colorspace profiles. The following ICC profile types cannot be used in a CITE-processed transform, either a mixed WCS/ICC transform or an all-ICC transform with **WCS\_ALWAYS** set:
     * 
     * - Non-RGB ColorSpace profiles
     * - NamedColor profiles
     * - n-channel profiles (where n &gt; 8)
     * - DeviceLink profiles
     * - Abstract profiles
     * @param {Pointer<LOGCOLORSPACEA>} pLogColorSpace Pointer to the input [**LOGCOLORSPACEA**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacea).
     * @param {Pointer} hDestProfile Handle to the profile of the destination device. The function determines whether the HPROFILE contains International Color Consortium (ICC) or Windows Color System (WCS) profile information.
     * @param {Pointer} hTargetProfile Handle to the profile of the target device. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. See Remarks.
     * @returns {Pointer} If this function succeeds, the return value is a handle to the color transform.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-createcolortransforma
     */
    static CreateColorTransformA(pLogColorSpace, hDestProfile, hTargetProfile, dwFlags) {
        result := DllCall("mscms.dll\CreateColorTransformA", "ptr", pLogColorSpace, "ptr", hDestProfile, "ptr", hTargetProfile, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Creates a color transform that applications can use to perform color management. (Unicode)
     * @remarks
     * If the target profile is **NULL**, the transform goes from the source logical color space to the destination profile. If the target profile is given, the transform goes from the source logical color space to the target profile and then to the destination profile. This allows previewing output meant for the target device on the destination device.
     * 
     * The values in *dwFlags* are intended as hints only. The color management module must determine the best way to use them.
     * 
     * **Windows Vista**: Three new flags have been added that can be used with *dwFlags*:
     * 
     * | Flag | Description |
     * |-|-|
     * | **PRESERVEBLACK** | If this bit is set, the transform engine inserts the appropriate black generation GMMP as the last GMMP in the transform sequence. This flag only works in a pure WCS transform. |
     * | **SEQUENTIAL\_TRANSFORM** | If this bit is set, each step in the WCS processing pipeline is performed for every pixel in the image and no optimized color transform is built. This flag only works in a pure WCS transform.**Restrictions**: A transform created with the SEQUENTIAL\_TRANSFORM flag set may only be used in the thread on which it was created and only for one color translation call at a time. COM must be initialized prior to creating the sequential transform and must remain initialized for the lifetime of the transform object.<br/> |
     * | **WCS\_ALWAYS** | If this bit is set, even all-ICC transforms will use the WCS code path. |
     * 
     * > [!Note] 
     * > **SEQUENTIAL\_TRANSFORM** was inadvertently omitted from the icm.h header in the Windows Vista SDK. If you wish to use the **SEQUENTIAL\_TRANSFORM** flag, define it in your application as follows:\#define SEQUENTIAL\_TRANSFORM 0x80800000
     * 
     * For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags). All of the flags mentioned there are supported for all types of transforms, except for FAST\_TRANSLATE, which only works in a pure ICC-to-ICC transform.
     * 
     * The **CreateColorTransform** function is used outside of a device context. Colors may shift when transforming from a color profile to the same color profile. This is due to precision errors. Therefore, a color transform should not be performed under these circumstances.
     * 
     * The B2Ax tags are required for any profile that is the target of a transform.
     * 
     * WCS transform support for ICC ColorSpace profiles is limited to RGB colorspace profiles. The following ICC profile types cannot be used in a CITE-processed transform, either a mixed WCS/ICC transform or an all-ICC transform with **WCS\_ALWAYS** set:
     * 
     * - Non-RGB ColorSpace profiles
     * - NamedColor profiles
     * - n-channel profiles (where n &gt; 8)
     * - DeviceLink profiles
     * - Abstract profiles
     * @param {Pointer<LOGCOLORSPACEW>} pLogColorSpace Pointer to the input [**LOGCOLORSPACEA**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacea).
     * @param {Pointer} hDestProfile Handle to the profile of the destination device. The function determines whether the HPROFILE contains International Color Consortium (ICC) or Windows Color System (WCS) profile information.
     * @param {Pointer} hTargetProfile Handle to the profile of the target device. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. See Remarks.
     * @returns {Pointer} If this function succeeds, the return value is a handle to the color transform.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-createcolortransformw
     */
    static CreateColorTransformW(pLogColorSpace, hDestProfile, hTargetProfile, dwFlags) {
        result := DllCall("mscms.dll\CreateColorTransformW", "ptr", pLogColorSpace, "ptr", hDestProfile, "ptr", hTargetProfile, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Accepts an array of profiles or a single [device link profile](/windows/win32/wcs/d) and creates a color transform that applications can use to perform color mapping.
     * @remarks
     * If a device link profile is being used, the function will fail if *nProfiles* is not set to 1.
     * 
     * The array of intents specifies how profiles should be combined. The *n*th intent is used for combining the *n*th profile in the array. If only one intent is specified, it is used for the first profile, and all other profiles are combined using [Match intent](/windows/win32/wcs/rendering-intents).
     * 
     * The values in *dwFlags* are intended as hints only. The color management module must determine the best way to use them.
     * 
     * **Windows Vista**: Three new flags have been added that can be used with *dwFlags*:
     * 
     * | Flag | Description |
     * |-|-|
     * | **PRESERVEBLACK** | If this bit is set, the transform engine inserts the appropriate black generation GMMP as the last GMMP in the transform sequence. This flag only works in a pure WCS transform. |
     * | **SEQUENTIAL\_TRANSFORM** | If this bit is set, each step in the WCS processing pipeline is performed for every pixel in the image and no optimized color transform is built. This flag only works in a pure WCS transform.**Restrictions**: A transform created with the SEQUENTIAL\_TRANSFORM flag set may only be used in the thread on which it was created and only for one color translation call at a time. COM must be initialized prior to creating the sequential transform and must remain initialized for the lifetime of the transform object.<br/> |
     * | **WCS\_ALWAYS** | If this bit is set, even all-ICC transforms will use the WCS code path. |
     * 
     * > [!Note]
     * >
     * > SEQUENTIAL\_TRANSFORM was inadvertently omitted from the icm.h header in the Windows Vista SDK. If you wish to use the SEQUENTIAL\_TRANSFORM flag, define it in your application as follows:
     * >
     * > \#define SEQUENTIAL\_TRANSFORM 0x80800000
     * 
     * For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags). All of the flags mentioned there are supported for all types of transforms, except for FAST\_TRANSLATE and USE\_RELATIVE\_COLORIMETRIC, which only work in a pure ICC-to-ICC transform.
     * 
     * The **CreateMultiProfileTransform** function is used outside of a device context. Colors may shift when transforming from a color profile to the same color profile. This is due to precision errors. Therefore, a color transform should not be performed under these circumstances.
     * 
     * We recommend that there be only one GMMP between a source and destination DMP. Gamut boundary descriptions (GBDs) are created from the DMP/CAMP combinations. The subsequent GMMPs use the GDBs prior to them in the processing chain until there exists a DMP/CAMP GBD next in the sequence to be used. For example, assume a sequence DMP1, CAMP1, GMMP1, GMMP2, GMMP3, DMP2, CAMP2, GMMP4, GMMP5, CAMP3, DMP3. Then GMMP1, GMMP2 use GBD1 as their source and destination. Then GMMP3 uses GBD1 as source and GBD2 as destination. Then GMMP4 uses GBD2 as source and destination. Finally GMMP5 uses GBD2 as source and GBD3 as destination. This assumes no GMMP is identical to one next to it.
     * 
     * For WCS profiles, we recommend that the rendering intents be set to DWORD\_MAX in order to use the GMMP within the WCS profile handle. This is because the array of rendering intents takes precedence over the rendering intents or gamut mapping models specified or contained in the profiles specified by the HPROFILEs. The array of rendering intents references the default GMMP for those rendering intents. Ideally, only one gamut mapping is performed between a source and destination device by setting one or the other GMMP to **NULL** when creating the HPROFILE with WCS profile information. Any legacy application that uses a WCS DMP will invoke a sequence of GMMPs. GDBs are chosen based on DMPs and CAMPs. For intermediate GMMP gamut boundaries, the source and destination GBDs are used.
     * 
     * In summary, if *nIntents* == 1, then the first GMM is set based on the GMMP that is set as default\* for the *padwIntent* value, unless that value is DWORD\_MAX, in which case the embedded GMM information from the second profile is used (The embedded GMM information is either a GMMP or, in the case of an ICC profile, the baseline GMM corresponding to\*\* the intent from the profile header). The remainder of the GMMs are set based on the GMMP that is set as default\* for RelativeColorimetric.
     * 
     * If *nIntents* = *nProfiles* -1, then each GMM is set based on the GMMP that is set as default\* for the value in the *padwIntent* array at the corresponding index, except where *padwIntent* values are DWORD\_MAX. For values in the *padwIntent* array that are DWORD\_MAX, the GMMs at corresponding positions are set based on the embedded GMM information from the second of the two profiles whose gamuts are mapped by the GMM. (Again, the embedded GMM information is either a GMMP or, in the case of an ICC profile, the baseline GMM corresponding to\*\* the intent from the profile header).
     * 
     * If *nIntents* = *nProfiles*, then first intent is ignored and function behaves as it does in the case when *nIntents* = *nProfiles* -1.
     * 
     * Any other combination of *padwIntents* and *nIntents* will return an error.
     * 
     * \* "set as default" means that the default GMMP is queried using **WcsGetDefaultColorProfile** with its *profileManagementScope* parameter set to WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER. This may return either current-user or system-wide defaults as described in the documentation for **WcsGetDefaultColorProfile**.
     * 
     * \*\* "GMM corresponding to" does not mean "GMM from the GMMP set as default for". Instead it means "a constant association between ICC profile intents and baseline GMM algorithms."
     * 
     * WCS transform support for ICC ColorSpace profiles is limited to RGB colorspace profiles. The following ICC profile types cannot be used in a CITE-processed transform, either a mixed WCS/ICC transform or an all-ICC transform with **WCS\_ALWAYS** set:
     * 
     * - Non-RGB ColorSpace profiles
     * - NamedColor profiles
     * - n-channel profiles (where n &gt; 8)
     * - DeviceLink profiles
     * - Abstract profiles
     * @param {Pointer<IntPtr>} pahProfiles Pointer to an array of handles to the profiles to be used. The function determines whether the HPROFILEs contain International Color Consortium (ICC) or Windows Color System (WCS) profile information and processes them appropriately. When valid WCS profiles are returned by [**OpenColorProfileW**](/windows/win32/api/icm/nf-icm-opencolorprofilew) and [**WcsOpenColorProfileW**](https://github.com/MicrosoftDocs/sdk-api/blob/docs/sdk-api-src/content/icm/nf-icm-wcsopencolorprofilew.md), these profile handles contain the combination of DMP, CAMP, and GMMP profiles.
     * @param {Integer} nProfiles Specifies the number of profiles in the array. The maximum is 10.
     * @param {Pointer<UInt32>} padwIntent 
     * @param {Integer} nIntents Specifies the number of elements in the intents array: can either be 1 or the same value as *nProfiles*. For profile arrays that contain any WCS profiles, the first rendering intent is ignored and only *nProfiles* -1 elements are used for these profile arrays. The maximum number of *nIntents* is 10.
     * @param {Integer} dwFlags Specifies flags used to control creation of the transform. See Remarks.
     * @param {Integer} indexPreferredCMM Specifies the one-based index of the color profile that indicates what color management module (CMM) to use. The application developer may allow Windows to choose the CMM by setting this parameter to INDEX\_DONT\_CARE. See [Using Color Management Modules (CMM)](/windows/win32/wcs/using-color-management-modules--cmm) Third party CMMs are only available for ICC workflows. Profile arrays containing WCS profiles will ignore this flag. It is also ignored when only ICC profiles are used and when the WCS\_ALWAYS flag is used.
     * @returns {Pointer} If this function succeeds, the return value is a handle to the color transform.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-createmultiprofiletransform
     */
    static CreateMultiProfileTransform(pahProfiles, nProfiles, padwIntent, nIntents, dwFlags, indexPreferredCMM) {
        result := DllCall("mscms.dll\CreateMultiProfileTransform", "ptr", pahProfiles, "uint", nProfiles, "ptr", padwIntent, "uint", nIntents, "uint", dwFlags, "uint", indexPreferredCMM, "ptr")
        return result
    }

    /**
     * Deletes a given color transform.
     * @param {Pointer} hxform Identifies the color transform to delete.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-deletecolortransform
     */
    static DeleteColorTransform(hxform) {
        result := DllCall("mscms.dll\DeleteColorTransform", "ptr", hxform, "int")
        return result
    }

    /**
     * Translates the colors of a bitmap having a defined format so as to produce another bitmap in a requested format.
     * @remarks
     * If the input and output formats are not compatible with the color transform, this function fails.
     * 
     * When either of the floating point BMFORMATs, BM\_32b\_scARGB or BM\_32b\_scRGB are used, the color data being translated should not contain NaN or infinity. NaN and infinity are not considered to represent legitimate color component values, and the result of translating pixels containing NaN or infinity is meaningless in color terms. NaN or infinity values in the color data being processed will be handled silently, and an error will not be returned.
     * @param {Pointer} hColorTransform Identifies the color transform to use.
     * @param {Pointer<Void>} pSrcBits Pointer to the bitmap to translate.
     * @param {Integer} bmInput Specifies the format of the input bitmap. Must be set to one of the values of the [**BMFORMAT**](/windows/win32/api/icm/ne-icm-bmformat) enumerated type.
     * 
     * > [!Note]  
     * > This function doesn't support [**BM\_XYZTRIPLETS**](/windows/win32/api/icm/ne-icm-bmformat) or **BM\_YxyTRIPLETS** as inputs.
     * @param {Integer} dwWidth Specifies the number of pixels per scan line in the input bitmap.
     * @param {Integer} dwHeight Specifies the number of scan lines in the input bitmap.
     * @param {Integer} dwInputStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the input bitmap; if set to zero, the function assumes that scan lines are padded so as to be **DWORD**-aligned.
     * @param {Pointer<Void>} pDestBits Pointer to the buffer in which to place the translated bitmap.
     * @param {Integer} bmOutput Specifies the format of the output bitmap. Must be set to one of the values of the [**BMFORMAT**](/windows/win32/api/icm/ne-icm-bmformat) enumerated type.
     * @param {Integer} dwOutputStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the output bitmap; if set to zero, the function assumes that scan lines should be padded to be **DWORD**-aligned.
     * @param {Pointer<LPBMCALLBACKFN>} pfnCallBack Pointer to a callback function called periodically by **TranslateBitmapBits** to report progress and allow the calling process to cancel the translation. (See [**ICMProgressProcCallback**](/windows/win32/wcs/icmprogressproccallback) )
     * @param {Pointer} ulCallbackData Data passed back to the callback function, for example, to identify the translation that is reporting progress.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-translatebitmapbits
     */
    static TranslateBitmapBits(hColorTransform, pSrcBits, bmInput, dwWidth, dwHeight, dwInputStride, pDestBits, bmOutput, dwOutputStride, pfnCallBack, ulCallbackData) {
        result := DllCall("mscms.dll\TranslateBitmapBits", "ptr", hColorTransform, "ptr", pSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwInputStride, "ptr", pDestBits, "int", bmOutput, "uint", dwOutputStride, "ptr", pfnCallBack, "ptr", ulCallbackData, "int")
        return result
    }

    /**
     * Checks whether the pixels in a specified bitmap lie within the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @remarks
     * If the input format is not compatible with the color transform, the **CheckBitmapBits** function fails.
     * 
     * This function places results of the tests in the buffer pointed to by *paResult*. Each byte in the buffer corresponds to a pixel in the bitmap, and has an unsigned value between 0 and 255. The value 0 denotes that the color is in gamut, while a nonzero value denotes that it is out of gamut. For any integer *n* such that 0 &lt;*n* &lt; 255, a result value of *n* + 1 indicates that the corresponding color is at least as far out of gamut as would be indicated by a result value of *n*.
     * 
     * When either of the floating point BMFORMATs, BM\_32b\_scARGB or BM\_32b\_scRGB is used, the color data being checked should not contain NaN or infinity. NaN and infinity are not considered to represent legitimate color component values, and the result of checking pixels containing NaN or infinity is meaningless in color terms. NaN or infinity values in the color data being processed will be handled silently, and an error will not be returned.
     * 
     * The out-of-gamut information in the gamut tags created in WCS use the perceptual color distance in CIECAM02, which is the mean square root in CIECAM02 Jab space. The distance in the legacy ICC profile gamut tags is the mean square root in CIELAB space. We recommend that you use the CIECAM02 space when it is available because it provides more perceptually accurate distance metrics.
     * @param {Pointer} hColorTransform Handle to the color transform to use.
     * @param {Pointer<Void>} pSrcBits Pointer to the bitmap to check against the output gamut.
     * @param {Integer} bmInput Specifies the format of the bitmap. Must be set to one of the values of the [**BMFORMAT**](/windows/win32/api/icm/ne-icm-bmformat) enumerated type.
     * @param {Integer} dwWidth Specifies the number of pixels per scan line of the bitmap.
     * @param {Integer} dwHeight Specifies the number of scan lines of the bitmap.
     * @param {Integer} dwStride Specifies the number of bytes from the beginning one scan line to the beginning of the next one. If set to zero, the bitmap scan lines are assumed to be padded so as to be **DWORD**-aligned.
     * @param {Pointer<Byte>} paResult Pointer to an array of bytes where the test results are to be placed. This results buffer must contain at least as many bytes as there are pixels in the bitmap.
     * @param {Pointer<LPBMCALLBACKFN>} pfnCallback Pointer to a callback function called periodically by **CheckBitmapBits** to report progress and allow the calling process to cancel the bitmap test. (See [**ICMProgressProcCallback**](/windows/win32/wcs/icmprogressproccallback)).
     * @param {Pointer} lpCallbackData Data passed back to the callback function, for example, to identify the bitmap test about which progress is being reported.
     * @returns {Integer} If this function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-checkbitmapbits
     */
    static CheckBitmapBits(hColorTransform, pSrcBits, bmInput, dwWidth, dwHeight, dwStride, paResult, pfnCallback, lpCallbackData) {
        result := DllCall("mscms.dll\CheckBitmapBits", "ptr", hColorTransform, "ptr", pSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwStride, "ptr", paResult, "ptr", pfnCallback, "ptr", lpCallbackData, "int")
        return result
    }

    /**
     * Translates an array of colors from the source [color space](/windows/win32/wcs/c) to the destination color space as defined by a color transform.
     * @remarks
     * If the input and the output color types are not compatible with the color transform, this function fails.
     * @param {Pointer} hColorTransform Identifies the color transform to use.
     * @param {Pointer<COLOR>} paInputColors Pointer to an array of *nColors*[**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to translate.
     * @param {Integer} nColors Contains the number of elements in the arrays pointed to by *paInputColors* and *paOutputColors*.
     * @param {Integer} ctInput Specifies the input color type.
     * @param {Pointer<COLOR>} paOutputColors Pointer to an array of *nColors* **COLOR** structures that receive the translated colors.
     * @param {Integer} ctOutput Specifies the output color type.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-translatecolors
     */
    static TranslateColors(hColorTransform, paInputColors, nColors, ctInput, paOutputColors, ctOutput) {
        result := DllCall("mscms.dll\TranslateColors", "ptr", hColorTransform, "ptr", paInputColors, "uint", nColors, "int", ctInput, "ptr", paOutputColors, "int", ctOutput, "int")
        return result
    }

    /**
     * Determines whether the colors in an array lie within the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @remarks
     * If the input color type is not compatible with the color transform, **CheckColors** fails.
     * 
     * The function places results of the tests in the array pointed to by *paResult*. Each byte in the array corresponds to a **COLOR** element in the array pointed to by *paInputColors* and has an unsigned value between 0 and 255. The value 0 denotes that the color is in gamut, while a nonzero value denotes that it is out of gamut. For any integer *n* such that 0 &lt; *n* &lt; 255, a result value of *n* +1 indicates that the corresponding color is at least as far out of gamut as would be indicated by a result value of *n*.
     * 
     * The out-of-gamut information in the gamut tags created in WCS use the perceptual color distance in CIECAM02, which is the mean square root in CIECAM02 Jab space. The distance in the legacy ICC profile gamut tags is the mean square root in CIELAB space. We recommend that you use the CIECAM02 space when it is available because it provides more perceptually accurate distance metrics.
     * @param {Pointer} hColorTransform Handle to the color transform to use.
     * @param {Pointer<COLOR>} paInputColors Pointer to an array of *nColors* [**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to translate.
     * @param {Integer} nColors Contains the number of elements in the arrays pointed to by *paInputColors* and *paResult*.
     * @param {Integer} ctInput Specifies the input color type.
     * @param {Pointer<Byte>} paResult Pointer to an array of *nColors* bytes that receives the results of the test.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-checkcolors
     */
    static CheckColors(hColorTransform, paInputColors, nColors, ctInput, paResult) {
        result := DllCall("mscms.dll\CheckColors", "ptr", hColorTransform, "ptr", paInputColors, "uint", nColors, "int", ctInput, "ptr", paResult, "int")
        return result
    }

    /**
     * Retrieves various information about the color management module (CMM) that created the specified color transform.
     * @param {Pointer} hColorTransform Identifies the transform for which to find CMM information.
     * @param {Integer} param1 
     * @returns {Integer} If this function succeeds, the return value is the information specified in *dwInfo.*
     * 
     * If this function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcmminfo
     */
    static GetCMMInfo(hColorTransform, param1) {
        result := DllCall("mscms.dll\GetCMMInfo", "ptr", hColorTransform, "uint", param1, "uint")
        return result
    }

    /**
     * Associates a specified identification value with the specified color management module dynamic link library (CMM DLL). When this ID appears in a color profile, Windows can then locate the corresponding CMM so as to create a transform. (ANSI)
     * @param {Pointer<PSTR>} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the machine on which a CMM DLL should be registered. A **NULL** pointer indicates the local machine.
     * @param {Integer} cmmID Specifies the ID signature of the CMM registered with the International Color Consortium (ICC).
     * @param {Pointer<PSTR>} pCMMdll Pointer to the fully qualified path name of the CMM DLL.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-registercmma
     */
    static RegisterCMMA(pMachineName, cmmID, pCMMdll) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pCMMdll := pCMMdll is String? StrPtr(pCMMdll) : pCMMdll

        result := DllCall("mscms.dll\RegisterCMMA", "ptr", pMachineName, "uint", cmmID, "ptr", pCMMdll, "int")
        return result
    }

    /**
     * Associates a specified identification value with the specified color management module dynamic link library (CMM DLL). When this ID appears in a color profile, Windows can then locate the corresponding CMM so as to create a transform. (Unicode)
     * @param {Pointer<PWSTR>} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the machine on which a CMM DLL should be registered. A **NULL** pointer indicates the local machine.
     * @param {Integer} cmmID Specifies the ID signature of the CMM registered with the International Color Consortium (ICC).
     * @param {Pointer<PWSTR>} pCMMdll Pointer to the fully qualified path name of the CMM DLL.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-registercmmw
     */
    static RegisterCMMW(pMachineName, cmmID, pCMMdll) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pCMMdll := pCMMdll is String? StrPtr(pCMMdll) : pCMMdll

        result := DllCall("mscms.dll\RegisterCMMW", "ptr", pMachineName, "uint", cmmID, "ptr", pCMMdll, "int")
        return result
    }

    /**
     * Dissociates a specified ID value from a given color management module dynamic-link library (CMM DLL). (ANSI)
     * @remarks
     * If the profile for creating a transform later specifies this ID, the Windows default CMM will be used rather than this CMM DLL.
     * @param {Pointer<PSTR>} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the computer on which a CMM DLLs registration should be removed. A **NULL** pointer indicates the local computer.
     * @param {Integer} cmmID Specifies the ID value identifying the CMM whose registration is to be removed. This is the signature of the CMM registered with the International Color Consortium (ICC).
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-unregistercmma
     */
    static UnregisterCMMA(pMachineName, cmmID) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\UnregisterCMMA", "ptr", pMachineName, "uint", cmmID, "int")
        return result
    }

    /**
     * Dissociates a specified ID value from a given color management module dynamic-link library (CMM DLL). (Unicode)
     * @remarks
     * If the profile for creating a transform later specifies this ID, the Windows default CMM will be used rather than this CMM DLL.
     * @param {Pointer<PWSTR>} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the computer on which a CMM DLLs registration should be removed. A **NULL** pointer indicates the local computer.
     * @param {Integer} cmmID Specifies the ID value identifying the CMM whose registration is to be removed. This is the signature of the CMM registered with the International Color Consortium (ICC).
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-unregistercmmw
     */
    static UnregisterCMMW(pMachineName, cmmID) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\UnregisterCMMW", "ptr", pMachineName, "uint", cmmID, "int")
        return result
    }

    /**
     * Allows you to select the preferred color management module (CMM) to use.
     * @remarks
     * For **SelectCMM** to succeed, the specified CMM must be registered with the system.
     * @param {Integer} dwCMMType Specifies the signature of the desired CMM as registered with the International Color Consortium (ICC).
     * 
     * **Windows 2000 only:** Setting this parameter to **NULL** causes the WCS system to select the default CMM.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-selectcmm
     */
    static SelectCMM(dwCMMType) {
        result := DllCall("mscms.dll\SelectCMM", "uint", dwCMMType, "int")
        return result
    }

    /**
     * Retrieves the path of the Windows COLOR directory on a specified machine. (ANSI)
     * @remarks
     * **Per-user/LUA support**
     * 
     * Color directory is still system-wide. This function is executable in LUA context.
     * @param {Pointer<PSTR>} pMachineName Reserved; must be **NULL**. This parameter is intended to point to the name of the machine on which the profile is to be installed. A **NULL** pointer indicates the local machine.
     * @param {Pointer<PSTR>} pBuffer Points to the buffer in which the color directory path is to be placed.
     * @param {Pointer<UInt32>} pdwSize Points to a variable containing the size in bytes of the buffer pointed to by *pBuffer*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcolordirectorya
     */
    static GetColorDirectoryA(pMachineName, pBuffer, pdwSize) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pBuffer := pBuffer is String? StrPtr(pBuffer) : pBuffer

        result := DllCall("mscms.dll\GetColorDirectoryA", "ptr", pMachineName, "ptr", pBuffer, "ptr", pdwSize, "int")
        return result
    }

    /**
     * Retrieves the path of the Windows COLOR directory on a specified machine. (Unicode)
     * @remarks
     * **Per-user/LUA support**
     * 
     * Color directory is still system-wide. This function is executable in LUA context.
     * @param {Pointer<PWSTR>} pMachineName Reserved; must be **NULL**. This parameter is intended to point to the name of the machine on which the profile is to be installed. A **NULL** pointer indicates the local machine.
     * @param {Pointer<PWSTR>} pBuffer Points to the buffer in which the color directory path is to be placed.
     * @param {Pointer<UInt32>} pdwSize Points to a variable containing the size in bytes of the buffer pointed to by *pBuffer*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getcolordirectoryw
     */
    static GetColorDirectoryW(pMachineName, pBuffer, pdwSize) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pBuffer := pBuffer is String? StrPtr(pBuffer) : pBuffer

        result := DllCall("mscms.dll\GetColorDirectoryW", "ptr", pMachineName, "ptr", pBuffer, "ptr", pdwSize, "int")
        return result
    }

    /**
     * Installs a given profile for use on a specified machine. The profile is also copied to the COLOR directory. (ANSI)
     * @param {Pointer<PSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which the profile is to be installed. A **NULL** pointer indicates the local computer.
     * @param {Pointer<PSTR>} pProfileName Pointer to the fully qualified path name of the profile to install.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-installcolorprofilea
     */
    static InstallColorProfileA(pMachineName, pProfileName) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\InstallColorProfileA", "ptr", pMachineName, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Installs a given profile for use on a specified machine. The profile is also copied to the COLOR directory. (Unicode)
     * @param {Pointer<PWSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which the profile is to be installed. A **NULL** pointer indicates the local computer.
     * @param {Pointer<PWSTR>} pProfileName Pointer to the fully qualified path name of the profile to install.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-installcolorprofilew
     */
    static InstallColorProfileW(pMachineName, pProfileName) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\InstallColorProfileW", "ptr", pMachineName, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Removes a specified color profile from a specified computer. Associated files are optionally deleted from the system. (ANSI)
     * @param {Pointer<PSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine from which to uninstall the specified profile. A **NULL** pointer indicates the local machine.
     * @param {Pointer<PSTR>} pProfileName Points to the file name of the profile to uninstall.
     * @param {Integer} bDelete If set to **TRUE**, the function deletes the profile from the COLOR directory. If set to **FALSE**, this function has no effect.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-uninstallcolorprofilea
     */
    static UninstallColorProfileA(pMachineName, pProfileName, bDelete) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\UninstallColorProfileA", "ptr", pMachineName, "ptr", pProfileName, "int", bDelete, "int")
        return result
    }

    /**
     * Removes a specified color profile from a specified computer. Associated files are optionally deleted from the system. (Unicode)
     * @param {Pointer<PWSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine from which to uninstall the specified profile. A **NULL** pointer indicates the local machine.
     * @param {Pointer<PWSTR>} pProfileName Points to the file name of the profile to uninstall.
     * @param {Integer} bDelete If set to **TRUE**, the function deletes the profile from the COLOR directory. If set to **FALSE**, this function has no effect.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-uninstallcolorprofilew
     */
    static UninstallColorProfileW(pMachineName, pProfileName, bDelete) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\UninstallColorProfileW", "ptr", pMachineName, "ptr", pProfileName, "int", bDelete, "int")
        return result
    }

    /**
     * Enumerates all the profiles satisfying the given enumeration criteria. (ANSI)
     * @remarks
     * Several profiles are typically associated with printers, based on the paper and ink types. There is a default profile for each device. For International Color Consortium (ICC) profiles, GDI selects the best one from the ICC-associated profiles when your application creates a device context (DC).
     * 
     * Do not attempt to use **EnumColorProfiles** to determine the default profile for a device. Instead, create a device context for the device and then invoke the [**GetICMProfile**](/windows/desktop/api/Wingdi/nf-wingdi-geticmprofilea) function. On Windows Vista and Windows 7, the [**WcsGetDefaultColorProfile**](/windows/win32/api/icm/nf-icm-wcsgetdefaultcolorprofile) function can also be used to determine a device's default color profile.
     * 
     * If the **dwFields** member of the structure of type **ENUMTYPE** that is pointed to by the *pEnumRecord* parameter is set to ET\_DEVICENAME, this function will enumerate all of the color profiles associated with all types of devices attached to the user's computer, regardless of the device class. If the **dwFields** member of the structure pointed to by the *pEnumRecord* parameter is set to ET\_DEVICENAME or ET\_DEVICECLASS and a device class is specified in the **dwDeviceClass** member of the structure, this function will only enumerate the profiles associated with the specified device class. If the **dwFields** member is set only to ET\_DEVICECLASS, the **EnumColorProfiles** function will enumerate all profiles that can be associated with that type of device.
     * 
     * Whenever **EnumColorProfiles** is examining the profiles associated with a specific device, the results depend on whether the user has chosen to use the system-wide list of profiles associated with that device, or his or her own ("per-user") list. Calling [**WcsSetUsePerUserProfiles**](/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles) with its *usePerUserProfiles* parameter set to **TRUE** causes future calls to **EnumColorProfiles** to look at only the current user's per-user list of profile associations for the specified device. Calling **WcsSetUsePerUserProfiles** with its *usePerUserProfiles* parameter set to **FALSE** causes future calls to **EnumColorProfiles** to look at the system-wide list of profile associations for the specified device. If **WcsSetUsePerUserProfiles** has never been called for the current user, **EnumColorProfiles** examines the system-wide list.
     * 
     * Your application can use **EnumColorProfiles** to obtain the size of the buffer in which the profiles are enumerated. It should call the **EnumColorProfiles** function with the *pBuffer* parameter set to **NULL**. When the function returns, the *pdwSize* parameter will contain the required buffer size in bytes. Your program can use that information to allocate the enumeration buffer. It can then invoke **EnumColorProfiles** again with the *pBuffer* parameter set to the address of the buffer.
     * 
     * This function will provide the information for converting WCS-specific DMP information to the legacy EnumType record in enable consistent profile enumeration. The defaults will be the same as ICC if this information is not present.
     * @param {Pointer<PSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to enumerate profiles. A **NULL** pointer indicates the local computer.
     * @param {Pointer<ENUMTYPEA>} pEnumRecord Pointer to a structure specifying the enumeration criteria.
     * @param {Pointer<Byte>} pEnumerationBuffer Pointer to a buffer in which the profiles are to be enumerated. A MULTI\_SZ string of profile names satisfying the criteria specified in *\*pEnumRecord* will be placed in this buffer.
     * @param {Pointer<UInt32>} pdwSizeOfEnumerationBuffer Pointer to a variable containing the size of the buffer pointed to by *pBuffer*. On return, *\*pdwSize* contains the size of buffer actually used or needed.
     * @param {Pointer<UInt32>} pnProfiles Pointer to a variable that will contain, on return, the number of profile names actually copied to the buffer.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-enumcolorprofilesa
     */
    static EnumColorProfilesA(pMachineName, pEnumRecord, pEnumerationBuffer, pdwSizeOfEnumerationBuffer, pnProfiles) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\EnumColorProfilesA", "ptr", pMachineName, "ptr", pEnumRecord, "ptr", pEnumerationBuffer, "ptr", pdwSizeOfEnumerationBuffer, "ptr", pnProfiles, "int")
        return result
    }

    /**
     * Enumerates all the profiles satisfying the given enumeration criteria. (Unicode)
     * @remarks
     * Several profiles are typically associated with printers, based on the paper and ink types. There is a default profile for each device. For International Color Consortium (ICC) profiles, GDI selects the best one from the ICC-associated profiles when your application creates a device context (DC).
     * 
     * Do not attempt to use **EnumColorProfiles** to determine the default profile for a device. Instead, create a device context for the device and then invoke the [**GetICMProfile**](/windows/desktop/api/Wingdi/nf-wingdi-geticmprofilea) function. On Windows Vista and Windows 7, the [**WcsGetDefaultColorProfile**](/windows/win32/api/icm/nf-icm-wcsgetdefaultcolorprofile) function can also be used to determine a device's default color profile.
     * 
     * If the **dwFields** member of the structure of type **ENUMTYPE** that is pointed to by the *pEnumRecord* parameter is set to ET\_DEVICENAME, this function will enumerate all of the color profiles associated with all types of devices attached to the user's computer, regardless of the device class. If the **dwFields** member of the structure pointed to by the *pEnumRecord* parameter is set to ET\_DEVICENAME or ET\_DEVICECLASS and a device class is specified in the **dwDeviceClass** member of the structure, this function will only enumerate the profiles associated with the specified device class. If the **dwFields** member is set only to ET\_DEVICECLASS, the **EnumColorProfiles** function will enumerate all profiles that can be associated with that type of device.
     * 
     * Whenever **EnumColorProfiles** is examining the profiles associated with a specific device, the results depend on whether the user has chosen to use the system-wide list of profiles associated with that device, or his or her own ("per-user") list. Calling [**WcsSetUsePerUserProfiles**](/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles) with its *usePerUserProfiles* parameter set to **TRUE** causes future calls to **EnumColorProfiles** to look at only the current user's per-user list of profile associations for the specified device. Calling **WcsSetUsePerUserProfiles** with its *usePerUserProfiles* parameter set to **FALSE** causes future calls to **EnumColorProfiles** to look at the system-wide list of profile associations for the specified device. If **WcsSetUsePerUserProfiles** has never been called for the current user, **EnumColorProfiles** examines the system-wide list.
     * 
     * Your application can use **EnumColorProfiles** to obtain the size of the buffer in which the profiles are enumerated. It should call the **EnumColorProfiles** function with the *pBuffer* parameter set to **NULL**. When the function returns, the *pdwSize* parameter will contain the required buffer size in bytes. Your program can use that information to allocate the enumeration buffer. It can then invoke **EnumColorProfiles** again with the *pBuffer* parameter set to the address of the buffer.
     * 
     * This function will provide the information for converting WCS-specific DMP information to the legacy EnumType record in enable consistent profile enumeration. The defaults will be the same as ICC if this information is not present.
     * @param {Pointer<PWSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to enumerate profiles. A **NULL** pointer indicates the local computer.
     * @param {Pointer<ENUMTYPEW>} pEnumRecord Pointer to a structure specifying the enumeration criteria.
     * @param {Pointer<Byte>} pEnumerationBuffer Pointer to a buffer in which the profiles are to be enumerated. A MULTI\_SZ string of profile names satisfying the criteria specified in *\*pEnumRecord* will be placed in this buffer.
     * @param {Pointer<UInt32>} pdwSizeOfEnumerationBuffer Pointer to a variable containing the size of the buffer pointed to by *pBuffer*. On return, *\*pdwSize* contains the size of buffer actually used or needed.
     * @param {Pointer<UInt32>} pnProfiles Pointer to a variable that will contain, on return, the number of profile names actually copied to the buffer.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-enumcolorprofilesw
     */
    static EnumColorProfilesW(pMachineName, pEnumRecord, pEnumerationBuffer, pdwSizeOfEnumerationBuffer, pnProfiles) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\EnumColorProfilesW", "ptr", pMachineName, "ptr", pEnumRecord, "ptr", pEnumerationBuffer, "ptr", pdwSizeOfEnumerationBuffer, "ptr", pnProfiles, "int")
        return result
    }

    /**
     * Registers a specified profile for a given standard [color space](/windows/win32/wcs/c). The profile can be queried using [GetStandardColorSpaceProfileW](/windows/win32/api/icm/nf-icm-getstandardcolorspaceprofilew). (ANSI)
     * @remarks
     * The profile must already be installed on the system before it can be registered for a standard color space.
     * 
     * This function supports Windows Color System (WCS) device model profiles (DMPs) in addition to International Color Consortium (ICC) profiles. It does not support WCS CAMP or GMMP profiles and will return an error if such profiles are used.
     * 
     * ***Per-user/LUA support***
     * 
     * This will register a specified profile for a given standard color space only for current user.
     * 
     * This uses **WcsSetDefaultColorProfile** with WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER.
     * 
     * This is executable in LUA context if the profile is already installed, fails otherwise with access denied since install is system-wide and requires administrator privileges.
     * @param {Pointer<PSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to set a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwProfileID Specifies the ID value of the standard color space that the given profile represents. This is a custom ID value used to uniquely identify the color space profile within your application.
     * @param {Pointer<PSTR>} pProfilename Points to a fully qualified path to the profile file.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setstandardcolorspaceprofilea
     */
    static SetStandardColorSpaceProfileA(pMachineName, dwProfileID, pProfilename) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfilename := pProfilename is String? StrPtr(pProfilename) : pProfilename

        result := DllCall("mscms.dll\SetStandardColorSpaceProfileA", "ptr", pMachineName, "uint", dwProfileID, "ptr", pProfilename, "int")
        return result
    }

    /**
     * Registers a specified profile for a given standard [color space](/windows/win32/wcs/c). The profile can be queried using [GetStandardColorSpaceProfileW](/windows/win32/api/icm/nf-icm-getstandardcolorspaceprofilew). (Unicode)
     * @remarks
     * The profile must already be installed on the system before it can be registered for a standard color space.
     * 
     * This function supports Windows Color System (WCS) device model profiles (DMPs) in addition to International Color Consortium (ICC) profiles. It does not support WCS CAMP or GMMP profiles and will return an error if such profiles are used.
     * 
     * ***Per-user/LUA support***
     * 
     * This will register a specified profile for a given standard color space only for current user.
     * 
     * This uses **WcsSetDefaultColorProfile** with WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER.
     * 
     * This is executable in LUA context if the profile is already installed, fails otherwise with access denied since install is system-wide and requires administrator privileges.
     * @param {Pointer<PWSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to set a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwProfileID Specifies the ID value of the standard color space that the given profile represents. This is a custom ID value used to uniquely identify the color space profile within your application.
     * @param {Pointer<PWSTR>} pProfileName 
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setstandardcolorspaceprofilew
     */
    static SetStandardColorSpaceProfileW(pMachineName, dwProfileID, pProfileName) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\SetStandardColorSpaceProfileW", "ptr", pMachineName, "uint", dwProfileID, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Retrieves the color profile registered for the specified standard [color space](/windows/win32/wcs/c). (ANSI)
     * @remarks
     * If the buffer pointed to by *pProfileName* is to be dynamically allocated by an application, the application can call the **GetStandardColorSpaceProfile** function to retrieve the size required for the buffer. If **GetStandardColorSpaceProfile** is called with *pProfileName* set to **NULL**, it will return **FALSE** and the **DWORD** pointed at by *pdwSize* will contain the number of bytes needed for the buffer pointed at by *pProfileName*. The application can then allocate the buffer and call **GetStandardColorSpaceProfile** again with *pProfileName* set to the address of the buffer.
     * 
     * This function supports Windows Color System (WCS) device model profiles (DMPs) in addition to International Color Consortium (ICC) profiles. It does not support WCS CAMP or GMMP profiles and will return an error if such profiles are used.
     * 
     * **Overview of Windows Vista Specific Functionality**
     * 
     * This will support WCS DMPs in addition to ICC profiles. It will not support WCS CAMP or GMMP profiles and will return an error if such profiles are used with this API.
     * 
     * ***Per-user/LUA support***
     * 
     * This will retrieve the color profile registered for the given standard color space for current user. If there is no such setting for the current user, it retrieves the system wide setting.
     * 
     * This uses **WcsGetDefaultColorProfile** with WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER.
     * 
     * This is executable in LUA context.
     * @param {Pointer<PSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to get a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwSCS Specifies the ID value of the standard color space for which to retrieve the profile. The only valid values for this parameter are LCS\_sRGB and LCS\_WINDOWS\_COLOR\_SPACE.
     * @param {Pointer<PSTR>} pBuffer Pointer to the buffer in which the name of the profile is to be placed. If **NULL**, the call will return **TRUE** and the required size of the buffer is placed in *pdwSize.*
     * @param {Pointer<UInt32>} pcbSize Pointer to a variable containing the size in bytes of the buffer pointed to by *pProfileName*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getstandardcolorspaceprofilea
     */
    static GetStandardColorSpaceProfileA(pMachineName, dwSCS, pBuffer, pcbSize) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pBuffer := pBuffer is String? StrPtr(pBuffer) : pBuffer

        result := DllCall("mscms.dll\GetStandardColorSpaceProfileA", "ptr", pMachineName, "uint", dwSCS, "ptr", pBuffer, "ptr", pcbSize, "int")
        return result
    }

    /**
     * Retrieves the color profile registered for the specified standard [color space](/windows/win32/wcs/c). (Unicode)
     * @remarks
     * If the buffer pointed to by *pProfileName* is to be dynamically allocated by an application, the application can call the **GetStandardColorSpaceProfile** function to retrieve the size required for the buffer. If **GetStandardColorSpaceProfile** is called with *pProfileName* set to **NULL**, it will return **FALSE** and the **DWORD** pointed at by *pdwSize* will contain the number of bytes needed for the buffer pointed at by *pProfileName*. The application can then allocate the buffer and call **GetStandardColorSpaceProfile** again with *pProfileName* set to the address of the buffer.
     * 
     * This function supports Windows Color System (WCS) device model profiles (DMPs) in addition to International Color Consortium (ICC) profiles. It does not support WCS CAMP or GMMP profiles and will return an error if such profiles are used.
     * 
     * **Overview of Windows Vista Specific Functionality**
     * 
     * This will support WCS DMPs in addition to ICC profiles. It will not support WCS CAMP or GMMP profiles and will return an error if such profiles are used with this API.
     * 
     * ***Per-user/LUA support***
     * 
     * This will retrieve the color profile registered for the given standard color space for current user. If there is no such setting for the current user, it retrieves the system wide setting.
     * 
     * This uses **WcsGetDefaultColorProfile** with WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER.
     * 
     * This is executable in LUA context.
     * @param {Pointer<PWSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to get a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwSCS Specifies the ID value of the standard color space for which to retrieve the profile. The only valid values for this parameter are LCS\_sRGB and LCS\_WINDOWS\_COLOR\_SPACE.
     * @param {Pointer<PWSTR>} pBuffer Pointer to the buffer in which the name of the profile is to be placed. If **NULL**, the call will return **TRUE** and the required size of the buffer is placed in *pdwSize.*
     * @param {Pointer<UInt32>} pcbSize Pointer to a variable containing the size in bytes of the buffer pointed to by *pProfileName*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-getstandardcolorspaceprofilew
     */
    static GetStandardColorSpaceProfileW(pMachineName, dwSCS, pBuffer, pcbSize) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pBuffer := pBuffer is String? StrPtr(pBuffer) : pBuffer

        result := DllCall("mscms.dll\GetStandardColorSpaceProfileW", "ptr", pMachineName, "uint", dwSCS, "ptr", pBuffer, "ptr", pcbSize, "int")
        return result
    }

    /**
     * Associates a specified color profile with a specified device. (ANSI)
     * @remarks
     * The **AssociateColorProfileWithDevice** function will fail if the profile has not been installed on the computer using the [**InstallColorProfileW**](/windows/win32/api/icm/nf-icm-installcolorprofilew) function.
     * 
     * Note that under Windows (Windows 95 or later), the PostScript device driver for printers assumes a CMYK color model. Therefore, all PostScript printers must use a CMYK color profile. Windows 2000 does not have this limitation.
     * 
     * If the specified device is a monitor, this function updates the default profile.
     * 
     * Several profiles are typically associated with printers, based on paper and ink types. There is no default. The GDI selects the best one from the associated profiles when your application creates a device context (DC).
     * 
     * Scanners also have no default profile. However, it is atypical to associate more than one profile with a scanner.
     * 
     * **AssociateColorProfileWithDevice** always adds the specified profile to the current user's per-user profile association list for the specified device. Before adding the profile to the list, **AssociateColorProfileWithDevice** determines whether the user has previously expressed the desire to use a per-user profile association list for the device. If so, then **AssociateColorProfileWithDevice** simply adds the specified profile to the existing per-user profile association list for the device. If not, then **AssociateColorProfileWithDevice** creates a new per-user profile association list for the device by copying the system-wide association list for that device. It then appends the specified profile to the per-user list. From that point on, the current user will be using a per-user profile association list for the specified device, as if [**WcsSetUsePerUserProfiles**](/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles) had been called for *pDevice* with the *usePerUserProfiles* parameter set to **TRUE**.
     * @param {Pointer<PSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to associate the specified profile and device. A **NULL** pointer indicates the local machine.
     * @param {Pointer<PSTR>} pProfileName Points to the file name of the profile to associate.
     * @param {Pointer<PSTR>} pDeviceName Points to the name of the device to associate.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-associatecolorprofilewithdevicea
     */
    static AssociateColorProfileWithDeviceA(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\AssociateColorProfileWithDeviceA", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Associates a specified color profile with a specified device. (Unicode)
     * @remarks
     * The **AssociateColorProfileWithDevice** function will fail if the profile has not been installed on the computer using the [**InstallColorProfileW**](/windows/win32/api/icm/nf-icm-installcolorprofilew) function.
     * 
     * Note that under Windows (Windows 95 or later), the PostScript device driver for printers assumes a CMYK color model. Therefore, all PostScript printers must use a CMYK color profile. Windows 2000 does not have this limitation.
     * 
     * If the specified device is a monitor, this function updates the default profile.
     * 
     * Several profiles are typically associated with printers, based on paper and ink types. There is no default. The GDI selects the best one from the associated profiles when your application creates a device context (DC).
     * 
     * Scanners also have no default profile. However, it is atypical to associate more than one profile with a scanner.
     * 
     * **AssociateColorProfileWithDevice** always adds the specified profile to the current user's per-user profile association list for the specified device. Before adding the profile to the list, **AssociateColorProfileWithDevice** determines whether the user has previously expressed the desire to use a per-user profile association list for the device. If so, then **AssociateColorProfileWithDevice** simply adds the specified profile to the existing per-user profile association list for the device. If not, then **AssociateColorProfileWithDevice** creates a new per-user profile association list for the device by copying the system-wide association list for that device. It then appends the specified profile to the per-user list. From that point on, the current user will be using a per-user profile association list for the specified device, as if [**WcsSetUsePerUserProfiles**](/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles) had been called for *pDevice* with the *usePerUserProfiles* parameter set to **TRUE**.
     * @param {Pointer<PWSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to associate the specified profile and device. A **NULL** pointer indicates the local machine.
     * @param {Pointer<PWSTR>} pProfileName Points to the file name of the profile to associate.
     * @param {Pointer<PWSTR>} pDeviceName Points to the name of the device to associate.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-associatecolorprofilewithdevicew
     */
    static AssociateColorProfileWithDeviceW(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\AssociateColorProfileWithDeviceW", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Disassociates a specified color profile with a specified device on a specified computer. (ANSI)
     * @remarks
     * If more than one profile is associated with a device, WCS uses the last one associated as the default. That is, if your application sequentially associates three profiles with a device, WCS will use the last one associated as the default. If your application then calls the **DisassociateColorProfileFromDevice** function to disassociate the third profile (which is the default in this example), the WCS will use the second profile as the default.
     * 
     * If your application disassociates all profiles from a device, WCS uses the sRGB profile as the default.
     * 
     * **DisassociateColorProfileFromDevice** always removes the specified profile from the current user's per-user profile association list for the specified device. Before removing the profile from the list, **DisassociateColorProfileFromDevice** determines whether the user has previously expressed the desire to use a per-user profile association list for the device. If so, then **DisassociateColorProfileFromDevice** simply removes the specified profile from the existing per-user profile association list for the device. If not, then **DisassociateColorProfileFromDevice** creates a new per-user profile association list for the device by copying the system-wide association list for that device. It then removes the specified profile from the per-user list. From that point on, the current user will be using a per-user profile association list for the specified device, as if [**WcsSetUsePerUserProfiles**](/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles) had been called for *pDevice* with the *usePerUserProfiles* parameter set to **TRUE**.
     * @param {Pointer<PSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to disassociate the specified profile and device. A **NULL** pointer indicates the local computer.
     * @param {Pointer<PSTR>} pProfileName Pointer to the file name of the profile to disassociate.
     * @param {Pointer<PSTR>} pDeviceName Pointer to the name of the device to disassociate.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-disassociatecolorprofilefromdevicea
     */
    static DisassociateColorProfileFromDeviceA(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\DisassociateColorProfileFromDeviceA", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Disassociates a specified color profile with a specified device on a specified computer. (Unicode)
     * @remarks
     * If more than one profile is associated with a device, WCS uses the last one associated as the default. That is, if your application sequentially associates three profiles with a device, WCS will use the last one associated as the default. If your application then calls the **DisassociateColorProfileFromDevice** function to disassociate the third profile (which is the default in this example), the WCS will use the second profile as the default.
     * 
     * If your application disassociates all profiles from a device, WCS uses the sRGB profile as the default.
     * 
     * **DisassociateColorProfileFromDevice** always removes the specified profile from the current user's per-user profile association list for the specified device. Before removing the profile from the list, **DisassociateColorProfileFromDevice** determines whether the user has previously expressed the desire to use a per-user profile association list for the device. If so, then **DisassociateColorProfileFromDevice** simply removes the specified profile from the existing per-user profile association list for the device. If not, then **DisassociateColorProfileFromDevice** creates a new per-user profile association list for the device by copying the system-wide association list for that device. It then removes the specified profile from the per-user list. From that point on, the current user will be using a per-user profile association list for the specified device, as if [**WcsSetUsePerUserProfiles**](/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles) had been called for *pDevice* with the *usePerUserProfiles* parameter set to **TRUE**.
     * @param {Pointer<PWSTR>} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to disassociate the specified profile and device. A **NULL** pointer indicates the local computer.
     * @param {Pointer<PWSTR>} pProfileName Pointer to the file name of the profile to disassociate.
     * @param {Pointer<PWSTR>} pDeviceName Pointer to the name of the device to disassociate.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-disassociatecolorprofilefromdevicew
     */
    static DisassociateColorProfileFromDeviceW(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\DisassociateColorProfileFromDeviceW", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Creates a Color Management dialog box that lets the user choose whether to enable color management and, if so, provides control over the color profiles used and over the [rendering intent](/windows/win32/wcs/r). (Unicode)
     * @param {Pointer<COLORMATCHSETUPW>} pcms Pointer to a [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure that on entry contains information used to initialize the dialog box.
     * 
     * When **SetupColorMatching** returns, if the user clicked the OK button, this structure contains information about the user's selection. Otherwise, if an error occurred or the user canceled the dialog box, the structure is left unchanged.
     * @returns {Integer} If this function succeeds, the return value is **TRUE** indicating that no errors occurred and the user clicked the OK button.
     * 
     * If this function fails, the return value is **FALSE** indicating that an error occurred or the dialog was canceled. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setupcolormatchingw
     */
    static SetupColorMatchingW(pcms) {
        result := DllCall("ICMUI.dll\SetupColorMatchingW", "ptr", pcms, "int")
        return result
    }

    /**
     * Creates a Color Management dialog box that lets the user choose whether to enable color management and, if so, provides control over the color profiles used and over the [rendering intent](/windows/win32/wcs/r). (ANSI)
     * @param {Pointer<COLORMATCHSETUPA>} pcms Pointer to a [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure that on entry contains information used to initialize the dialog box.
     * 
     * When **SetupColorMatching** returns, if the user clicked the OK button, this structure contains information about the user's selection. Otherwise, if an error occurred or the user canceled the dialog box, the structure is left unchanged.
     * @returns {Integer} If this function succeeds, the return value is **TRUE** indicating that no errors occurred and the user clicked the OK button.
     * 
     * If this function fails, the return value is **FALSE** indicating that an error occurred or the dialog was canceled. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-setupcolormatchinga
     */
    static SetupColorMatchingA(pcms) {
        result := DllCall("ICMUI.dll\SetupColorMatchingA", "ptr", pcms, "int")
        return result
    }

    /**
     * WcsAssociateColorProfileWithDevice associates a specified WCS color profile with a specified device.
     * @remarks
     * The **WCSAssociateColorProfileWithDevice** function fails if the profile has not been installed on the computer using the [**InstallColorProfileW**](/windows/win32/api/icm/nf-icm-installcolorprofilew) function.
     * 
     * If the *profileManagementScope* parameter is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_SYSTEM\_WIDE, the profile association is system-wide and applies to all users. If *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, the association is only for the current user.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context if *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER. Otherwise, administrative privileges are required.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation, which could be system-wide or for the current user.
     * @param {Pointer<PWSTR>} pProfileName A pointer to the file name of the profile to associate.
     * @param {Pointer<PWSTR>} pDeviceName A pointer to the name of the device with which the profile is to be associated.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsassociatecolorprofilewithdevice
     */
    static WcsAssociateColorProfileWithDevice(scope, pProfileName, pDeviceName) {
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsAssociateColorProfileWithDevice", "int", scope, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Disassociates a specified WCS color profile from a specified device on a computer.
     * @remarks
     * The WCS color profile should be installed. Moreover, you must use the same *profileManagementScope* value as when the device was associated with the profile. See [**WcsAssociateColorProfileWithDevice**](/windows/win32/api/icm/nf-icm-wcsassociatecolorprofilewithdevice).
     * 
     * If *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_SYSTEM\_WIDE, the profile disassociation is systemwide and applies to all users. If *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, the disassociation is only for the current user.
     * 
     * If more than one color profile is associated with a device, WCS uses the last associated profile as the default. For example, if your application sequentially associates three profiles with a device, WCS uses the last profile associated as the default. If your application then calls the **WcsDisassociateColorProfileFromDevice** function to disassociate the third profile (which is the default in this example), WCS uses the second profile as the default.
     * 
     * If your application disassociates all profiles from a device, WCS uses the sRGB profile as the default.
     * 
     * If *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, this function is executable in Least-Privileged User Account (LUA) context. Otherwise, administrative privileges are required.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation, which could be system-wide or for the current user.
     * @param {Pointer<PWSTR>} pProfileName A pointer to the file name of the profile to disassociate.
     * @param {Pointer<PWSTR>} pDeviceName A pointer to the name of the device from which to disassociate the profile.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsdisassociatecolorprofilefromdevice
     */
    static WcsDisassociateColorProfileFromDevice(scope, pProfileName, pDeviceName) {
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsDisassociateColorProfileFromDevice", "int", scope, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Returns the size, in bytes, of the buffer that is required by the [**WcsEnumColorProfiles**](/windows/win32/api/icm/nf-icm-wcsenumcolorprofiles) function to enumerate color profiles.
     * @remarks
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of the profile management operation that is performed by this function.
     * @param {Pointer<ENUMTYPEW>} pEnumRecord A pointer to a structure that specifies the enumeration criteria.
     * @param {Pointer<UInt32>} pdwSize A pointer to a variable that receives the size of the buffer that is required to receive all enumerated profile names. This value is used by the *dwSize* parameter of the [**WcsEnumColorProfiles**](/windows/win32/api/icm/nf-icm-wcsenumcolorprofiles) function.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsenumcolorprofilessize
     */
    static WcsEnumColorProfilesSize(scope, pEnumRecord, pdwSize) {
        result := DllCall("mscms.dll\WcsEnumColorProfilesSize", "int", scope, "ptr", pEnumRecord, "ptr", pdwSize, "int")
        return result
    }

    /**
     * Enumerates all color profiles that satisfy the enumeration criteria in the specified profile management scope.
     * @remarks
     * Use the [**WcsEnumColorProfilesSize**](/windows/win32/api/icm/nf-icm-wcsenumcolorprofilessize) function to retrieve the value for the *dwSize* parameter, which is the size, in bytes, of the buffer pointed to by the *pBuffer* parameter.
     * 
     * If the *profileManagementScope* parameter is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_SYSTEM\_WIDE, only system-wide associations of profiles to the device are considered. If *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, only per-user associations for the current user are considered. If [**WcsSetUsePerUserProfiles**](/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles) has never been called for this user, or if **WcsSetUsePerUserProfiles** was most recently called for this user with its *usePerUserProfiles* parameter set to **FALSE**, then **WCSEnumColorProfiles** returns an empty list.
     * 
     * If WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER (the current user setting) is present, it overrides the system-wide default for the *profileManagementScope* parameter.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value specifying the scope of this profile management operation.
     * @param {Pointer<ENUMTYPEW>} pEnumRecord A pointer to a structure specifying the enumeration criteria.
     * @param {Pointer<Byte>} pBuffer A pointer to a buffer in which the profile names are to be enumerated. The **WcsEnumColorProfiles** function places, in this buffer, a MULTI\_SZ string that consists of profile names that satisfy the criteria specified in *\*pEnumRecord*.
     * @param {Integer} dwSize A variable that contains the size, in bytes, of the buffer that is pointed to by *pBuffer*. See **Remarks**.
     * @param {Pointer<UInt32>} pnProfiles An optional pointer to a variable that receives the number of profile names that are copied to the buffer to which *pBuffer* points. Can be **NULL** if this information is not needed.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsenumcolorprofiles
     */
    static WcsEnumColorProfiles(scope, pEnumRecord, pBuffer, dwSize, pnProfiles) {
        result := DllCall("mscms.dll\WcsEnumColorProfiles", "int", scope, "ptr", pEnumRecord, "ptr", pBuffer, "uint", dwSize, "ptr", pnProfiles, "int")
        return result
    }

    /**
     * Returns the size, in bytes, of the default color profile name (including the **NULL** terminator), for a device.
     * @remarks
     * Use this function to return the required size of the buffer that is pointed to by the *pProfileName* parameter in the [**WcsGetDefaultColorProfile**](/windows/win32/api/icm/nf-icm-wcsgetdefaultcolorprofile) function.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation.
     * @param {Pointer<PWSTR>} pDeviceName A pointer to the name of the device for which the default color profile is to be obtained. If **NULL**, a device-independent default profile will be used.
     * @param {Integer} cptColorProfileType A [**COLORPROFILETYPE**](/windows/win32/api/icm/ne-icm-colorprofiletype) value specifying the color profile type.
     * @param {Integer} cpstColorProfileSubType A [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) value specifying the color profile subtype.
     * @param {Integer} dwProfileID The ID of the color space that the color profile represents.
     * @param {Pointer<UInt32>} pcbProfileName A pointer to a location that receives the size, in bytes, of the path name of the default color profile, including the **NULL** terminator.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsgetdefaultcolorprofilesize
     */
    static WcsGetDefaultColorProfileSize(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, pcbProfileName) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsGetDefaultColorProfileSize", "int", scope, "ptr", pDeviceName, "int", cptColorProfileType, "int", cpstColorProfileSubType, "uint", dwProfileID, "ptr", pcbProfileName, "int")
        return result
    }

    /**
     * Retrieves the default color profile for a device, or for a device-independent default if the device is not specified.
     * @remarks
     * Use the [**WcsGetDefaultColorProfileSize**](/windows/win32/api/icm/nf-icm-wcsgetdefaultcolorprofilesize) function to obtain the required size of the buffer that is pointed to by the *pProfileName* parameter.
     * 
     * If WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER is present, it overrides the system-wide default for *profileManagementScope*.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Integer} scope A [**WCS_PROFILE_MANAGEMENT_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value specifying the scope of this profile management operation.
     * @param {Pointer<PWSTR>} pDeviceName A pointer to the name of the device for which the default color profile is obtained. If **NULL**, a device-independent default profile is obtained.
     * @param {Integer} cptColorProfileType A [**COLORPROFILETYPE**](/windows/win32/api/icm/ne-icm-colorprofiletype) value specifying the color profile type.
     * @param {Integer} cpstColorProfileSubType A [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) value specifying the color profile subtype.
     * @param {Integer} dwProfileID The ID of the color space that the color profile represents.
     * @param {Integer} cbProfileName The buffer size, in bytes, of the buffer that is pointed to by *pProfileName*.
     * @param {Pointer<PWSTR>} pProfileName A pointer to a buffer to receive the name of the color profile. The size of the buffer, in bytes, will be the indicated by *cbProfileName*.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsgetdefaultcolorprofile
     */
    static WcsGetDefaultColorProfile(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, cbProfileName, pProfileName) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\WcsGetDefaultColorProfile", "int", scope, "ptr", pDeviceName, "int", cptColorProfileType, "int", cpstColorProfileSubType, "uint", dwProfileID, "uint", cbProfileName, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Sets the default color profile name for the specified profile type in the specified profile management scope.
     * @remarks
     * If the *pProfileName* parameter is **NULL** and the *profileManagementScope* parameter is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, subsequent calls to **WcsSetDefaultColorProfile** will return the system-wide default profile.
     * 
     * If *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, this function is executable in Least-Privileged User Account (LUA) context. Otherwise, administrative privileges are required. The specified profile must already be installed, but it may be not yet associated with the specified device in the specified profile management scope.
     * 
     * If *profileManagementScope* is WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, this function will not correctly function if launched from system context and not a User Account.
     * 
     * When WcsSetDefaultColorProfile is called to set a device model profile DMP as the default profile for the RGB or custom working space, only a DMP profile that is of type RGBVirtualDevice, LCD, or CRT is valid; all others are invalid.
     * 
     * When WcsSetDefaultColorProfile is called to set an International Color Consortium (ICC) profile as the default profile for the RGB or custom working space, only an ICC profile with class "spac" or "disp", and "RGB" color space is valid; all others are invalid.
     * 
     * See notes on valid profile type/subtype combinations.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation.
     * @param {Pointer<PWSTR>} pDeviceName A pointer to the name of the device for which the default color profile is to be set. If **NULL**, a device-independent default profile is used.
     * @param {Integer} cptColorProfileType A [**COLORPROFILETYPE**](/windows/win32/api/icm/ne-icm-colorprofiletype) value that specifies the color profile type.
     * @param {Integer} cpstColorProfileSubType A [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) value that specifies the color profile subtype.
     * @param {Integer} dwProfileID The ID of the color space that the color profile represents. This is a custom ID value used to uniquely identify the color space profile within your application.
     * @param {Pointer<PWSTR>} pProfileName A pointer to a buffer that holds the name of the color profile. See Remarks.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcssetdefaultcolorprofile
     */
    static WcsSetDefaultColorProfile(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, pProfileName) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName
        pProfileName := pProfileName is String? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\WcsSetDefaultColorProfile", "int", scope, "ptr", pDeviceName, "int", cptColorProfileType, "int", cpstColorProfileSubType, "uint", dwProfileID, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Sets the default rendering intent in the specified profile management scope.
     * @param {Integer} scope The profile management scope for this operation, which can be system-wide or the current user only.
     * @param {Integer} dwRenderingIntent 
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcssetdefaultrenderingintent
     */
    static WcsSetDefaultRenderingIntent(scope, dwRenderingIntent) {
        result := DllCall("mscms.dll\WcsSetDefaultRenderingIntent", "int", scope, "uint", dwRenderingIntent, "int")
        return result
    }

    /**
     * Retrieves the default rendering intent in the specified profile management scope.
     * @remarks
     * This function does not revert to the system-wide scope if you do not set the per-user default rendering intent. Instead, it fails, which allows the calling process to distinguish between the per-user and the system-wide setting. If the per-user rendering intent cannot be retrieved, call this function again with system-wide.
     * @param {Integer} scope The profile management scope for this operation, which can be system-wide or the current user only.
     * @param {Pointer<UInt32>} pdwRenderingIntent A pointer to the variable that will hold the rendering intent.
     * 
     * For more information, see [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsgetdefaultrenderingintent
     */
    static WcsGetDefaultRenderingIntent(scope, pdwRenderingIntent) {
        result := DllCall("mscms.dll\WcsGetDefaultRenderingIntent", "int", scope, "ptr", pdwRenderingIntent, "int")
        return result
    }

    /**
     * Determines whether the user chose to use a per-user profile association list for the specified device.
     * @remarks
     * This function fails if *pDeviceName* points to a device that is not of the class specified by *dwDeviceClass*.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Pointer<PWSTR>} pDeviceName A pointer to a string containing the user-friendly name of the device.
     * @param {Integer} dwDeviceClass 
     * @param {Pointer<Int32>} pUsePerUserProfiles A pointer to a location to receive a Boolean value that is **TRUE** if the user chose to use a per-user profile association list for the specified device; otherwise **FALSE**.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsgetuseperuserprofiles
     */
    static WcsGetUsePerUserProfiles(pDeviceName, dwDeviceClass, pUsePerUserProfiles) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsGetUsePerUserProfiles", "ptr", pDeviceName, "uint", dwDeviceClass, "ptr", pUsePerUserProfiles, "int")
        return result
    }

    /**
     * Enables a user to specify whether or not to use a per-user profile association list for the specified device.
     * @remarks
     * If *usePerUserProfiles* is **TRUE**, and the user is not already using a per-user profile association list for *pDeviceName*, then the per-user profile association list is initialized by making a copy of the system-wide profile association list for the same device. From then on, changes to the system-wide list are not included in the per-user list.
     * 
     * This function is executable in Least-Privileged User Account (LUA) context.
     * @param {Pointer<PWSTR>} pDeviceName A pointer to a string that contains the user-friendly name of the device.
     * @param {Integer} dwDeviceClass 
     * @param {Integer} usePerUserProfiles A Boolean value that is **TRUE** if the user wants to use a per-user profile association list for the specified device; otherwise **FALSE**.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcssetuseperuserprofiles
     */
    static WcsSetUsePerUserProfiles(pDeviceName, dwDeviceClass, usePerUserProfiles) {
        pDeviceName := pDeviceName is String? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsSetUsePerUserProfiles", "ptr", pDeviceName, "uint", dwDeviceClass, "int", usePerUserProfiles, "int")
        return result
    }

    /**
     * Translates an array of colors from the source color space to the destination color space as defined by a color transform.
     * @remarks
     * If the input and the output color data types are not compatible with the color transform, this function fails. This function will fail if an ICC transform is used.
     * @param {Pointer} hColorTransform A handle for the WCS color transform.
     * @param {Integer} nColors The number of elements in the array to which *pInputData* and *pOutputData* point.
     * @param {Integer} nInputChannels The number of channels per element in the array to which *pInputData* points.
     * @param {Integer} cdtInput The input [**COLORDATATYPE**](/windows/win32/api/icm/ne-icm-colordatatype) color data type.
     * @param {Integer} cbInput The buffer size, in bytes, of *pInputData*.
     * @param {Pointer<Void>} pInputData A pointer to an array of input colors. The size of the buffer for this array, in bytes, is the **DWORD** value of *cbInput*.
     * @param {Integer} nOutputChannels The number of channels per element in the array to which *pOutputData* points.
     * @param {Integer} cdtOutput The [**COLORDATATYPE**](/windows/win32/api/icm/ne-icm-colordatatype) output that specified the color data type.
     * @param {Integer} cbOutput The buffer size, in bytes, of *pOutputData*.
     * @param {Pointer<Void>} pOutputData A pointer to an array of colors that receives the results of the color translation.The size of the buffer for this array, in bytes, is the **DWORD** value of *cbOutput*.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcstranslatecolors
     */
    static WcsTranslateColors(hColorTransform, nColors, nInputChannels, cdtInput, cbInput, pInputData, nOutputChannels, cdtOutput, cbOutput, pOutputData) {
        result := DllCall("mscms.dll\WcsTranslateColors", "ptr", hColorTransform, "uint", nColors, "uint", nInputChannels, "int", cdtInput, "uint", cbInput, "ptr", pInputData, "uint", nOutputChannels, "int", cdtOutput, "uint", cbOutput, "ptr", pOutputData, "int")
        return result
    }

    /**
     * Determines whether the colors in an array are within the output gamut of a specified WCS color transform.
     * @remarks
     * If the input and the output color data types are not compatible with the color transform, this function will convert the input color data as required.
     * 
     * This function fails if you use an International Color Consortium (ICC) transform is used.
     * @param {Pointer} hColorTransform A handle to the specified WCS color transform.
     * @param {Integer} nColors The number of elements in the array pointed to by *pInputData* and *paResult*.
     * @param {Integer} nInputChannels The number of channels per element in the array pointed to by *pInputData*.
     * @param {Integer} cdtInput The input COLORDATATYPE color data type.
     * @param {Integer} cbInput The buffer size of *pInputData*.
     * @param {Pointer<Void>} pInputData A pointer to an array of input colors. Colors in this array correspond to the color space of the source profile. The size of the buffer for this array will be the number of bytes indicated by *cbInput*.
     * @param {Pointer<Byte>} paResult A pointer to an array of *nColors* bytes that receives the results of the test.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcscheckcolors
     */
    static WcsCheckColors(hColorTransform, nColors, nInputChannels, cdtInput, cbInput, pInputData, paResult) {
        result := DllCall("mscms.dll\WcsCheckColors", "ptr", hColorTransform, "uint", nColors, "uint", nInputChannels, "int", cdtInput, "uint", cbInput, "ptr", pInputData, "ptr", paResult, "int")
        return result
    }

    /**
     * Determines whether given colors lie within the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @remarks
     * Every CMM is required to export this function.
     * 
     * If the input color type is not compatible with the color transform **CMCheckColors** fails.
     * @param {Pointer} hcmTransform Handle to the color transform to use.
     * @param {Pointer<COLOR>} lpaInputColors Pointer to an array of [**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to check against the output gamut.
     * @param {Integer} nColors Specifies the number of elements in the array.
     * @param {Integer} ctInput Specifies the input color type.
     * @param {Pointer<Byte>} lpaResult Pointer to a buffer in which to place an array of bytes containing the test results. Each byte in the buffer corresponds to a **COLOR** structure, and on exit has been set to an unsigned value between 0 and 255. The value 0 denotes that the color is in gamut, while a nonzero value indicates that it is out of gamut. For any integer *n* such that 0 \< *n* \< 255, a result value of *n* + 1 indicates that the corresponding color is at least as far out of gamut as would be indicated by a result value of *n*. These values are usually generated from the *gamutTag* in the ICC profile.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. If the function is not successful, the CMM should call [SetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror) to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcheckcolors
     */
    static CMCheckColors(hcmTransform, lpaInputColors, nColors, ctInput, lpaResult) {
        result := DllCall("ICM32.dll\CMCheckColors", "ptr", hcmTransform, "ptr", lpaInputColors, "uint", nColors, "int", ctInput, "ptr", lpaResult, "int")
        return result
    }

    /**
     * Checks bitmap colors against an output gamut.
     * @param {Pointer} hcmTransform 
     * @param {Pointer<Void>} lpSrcBits 
     * @param {Integer} bmInput 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @param {Integer} dwStride 
     * @param {Pointer<Byte>} lpaResult 
     * @param {Pointer<LPBMCALLBACKFN>} pfnCallback 
     * @param {Pointer} ulCallbackData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcheckrgbs
     */
    static CMCheckRGBs(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwStride, lpaResult, pfnCallback, ulCallbackData) {
        result := DllCall("ICM32.dll\CMCheckRGBs", "ptr", hcmTransform, "ptr", lpSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwStride, "ptr", lpaResult, "ptr", pfnCallback, "ptr", ulCallbackData, "int")
        return result
    }

    /**
     * Converts color names in a named color space to index numbers in a color profile.
     * @remarks
     * This function is required in the default CMM. It is optional for all other CMMs.
     * @param {Pointer} hProfile The handle to a named color profile.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of **DWORDS** that this function fills with the indices.
     * @param {Integer} dwCount The number of color names to convert.
     * @returns {Integer} If this function succeeds with the conversion, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. When this occurs, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmconvertcolornametoindex
     */
    static CMConvertColorNameToIndex(hProfile, paColorName, paIndex, dwCount) {
        result := DllCall("ICM32.dll\CMConvertColorNameToIndex", "ptr", hProfile, "ptr", paColorName, "ptr", paIndex, "uint", dwCount, "int")
        return result
    }

    /**
     * Transforms indices in a color space to an array of names in a named color space. (CMConvertIndexToColorName)
     * @remarks
     * This function is required in the default CMM. It is optional for all other CMMs.
     * @param {Pointer} hProfile The handle to a color space profile.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of color-space index numbers.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Integer} dwCount The number of indices to convert.
     * @returns {Integer} If this conversion function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. When this occurs, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmconvertindextocolorname
     */
    static CMConvertIndexToColorName(hProfile, paIndex, paColorName, dwCount) {
        result := DllCall("ICM32.dll\CMConvertIndexToColorName", "ptr", hProfile, "ptr", paIndex, "ptr", paColorName, "uint", dwCount, "int")
        return result
    }

    /**
     * Creates a [device link profile](/windows/win32/wcs/d) in the format specified by the International Color Consortium in its ICC Profile Format Specification.
     * @remarks
     * Only the Windows default CMM is required to export this function; it is optional for all other CMMs.
     * 
     * If a CMM does not support **CMCreateDeviceLinkProfile**, Windows uses the default CMM to create a device link profile.
     * 
     * The first and the last profiles in the array must be [device profiles](/windows/win32/wcs/using-device-profiles-with-wcs). The other profiles can be [color space](/windows/win32/wcs/color-spaces) or abstract profiles. Each profile's output color space must be the next profile's input color space.
     * 
     * The calling application must free the buffer allocated by this function and pointed to by the *lpProfileData* parameter. Use the [GlobalFree](/windows/win32/api/winbase/nf-winbase-globalfree) function to free the buffer.
     * @param {Pointer<IntPtr>} pahProfiles Pointer to an array of profile handles.
     * @param {Integer} nProfiles Specifies the number of profiles in the array.
     * @param {Pointer<UInt32>} padwIntents An array of rendering intents.
     * @param {Integer} nIntents The number of elements in the array of intents.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @param {Pointer<Byte>} lpProfileData Pointer to a pointer to a buffer. If successful the function allocates and fills this buffer. The calling application must free this buffer when it is no longer needed. Use the **GlobalFree** function to free this buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero. If the function is not successful, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreatedevicelinkprofile
     */
    static CMCreateDeviceLinkProfile(pahProfiles, nProfiles, padwIntents, nIntents, dwFlags, lpProfileData) {
        result := DllCall("ICM32.dll\CMCreateDeviceLinkProfile", "ptr", pahProfiles, "uint", nProfiles, "ptr", padwIntents, "uint", nIntents, "uint", dwFlags, "ptr", lpProfileData, "int")
        return result
    }

    /**
     * Accepts an array of profiles or a single [device link profile](/windows/win32/wcs/d) and creates a color transform. This transform is a mapping from the color space specified by the first profile to that of the second profile and so on to the last one.
     * @remarks
     * Every CMM is required to export this function.
     * 
     * The array of intents specifies how profiles should be combined. The *n*th intent is used for combining the *n*th profile in the array. If only one intent is specified, it is used for the first profile, and all other profiles are combined using Match intent.
     * 
     * The profile handles used to create the color transform can be closed after the call to **CMCreateMultiProfileTransform** completes.
     * @param {Pointer<IntPtr>} pahProfiles Points to an array of profile handles.
     * @param {Integer} nProfiles Specifies the number of profiles in the array.
     * @param {Pointer<UInt32>} padwIntents 
     * @param {Integer} nIntents Specifies the number of intents in the intent array. Can be 1, or the same value as *nProfiles*.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @returns {Pointer} If this function succeeds, the return value is a color transform in the range 256 to 65,535. Since only the low **WORD** of the transform is retained, valid transforms cannot exceed this range.
     * 
     * If this function fails, the return value is an error code having a value less than 256. When the return value is less than 256, signaling an error, the CMM should use **SetLastError** to set the last error to a valid error value as defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreatemultiprofiletransform
     */
    static CMCreateMultiProfileTransform(pahProfiles, nProfiles, padwIntents, nIntents, dwFlags) {
        result := DllCall("ICM32.dll\CMCreateMultiProfileTransform", "ptr", pahProfiles, "uint", nProfiles, "ptr", padwIntents, "uint", nIntents, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Creates a display color profile from a [**LOGCOLORSPACEW**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacew) structure.
     * @remarks
     * Beginning with Windows Vista, CMM Implementors are no longer required to implement this method.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * The Unicode version of this function is [**CMCreateProfileW**](https://msdn.microsoft.com/en-us/library/dd371864\(v=vs.85\)).
     * 
     * Only the Windows default CMM is required to export this function; it is optional for all other CMMs.
     * 
     * If a CMM does not support **CMCreateProfileW**, Windows uses the default CMM to create the profile.
     * 
     * The CMM should set all header fields to sensible defaults. This profile should be usable as the input profile in a transform.
     * 
     * The calling application must free the buffer allocated by this function and pointed to by the *lpProfileData* parameter. Use [**GlobalFree**](../winbase/nf-winbase-globalfree.md) to free the buffer.
     * @param {Pointer<LOGCOLORSPACEW>} lpColorSpace Pointer to a color logical space, of which the **lcsFilename** member will be **NULL**.
     * @param {Pointer<Void>} lpProfileData Pointer to a pointer to a buffer. If successful the function allocates and fills this buffer. It is the calling application's responsibility to free this buffer when it is no longer needed.
     * @returns {Integer} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. Call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) to retrieve the error.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreateprofilew
     */
    static CMCreateProfileW(lpColorSpace, lpProfileData) {
        result := DllCall("ICM32.dll\CMCreateProfileW", "ptr", lpColorSpace, "ptr", lpProfileData, "int")
        return result
    }

    /**
     * Deprecated. There is no replacement API because this one was no longer being used. Developers of alternate CMM modules are not required to implement it. (CMCreateTransform)
     * @param {Pointer<LOGCOLORSPACEA>} lpColorSpace 
     * @param {Pointer<Void>} lpDevCharacter 
     * @param {Pointer<Void>} lpTargetDevCharacter 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreatetransform
     */
    static CMCreateTransform(lpColorSpace, lpDevCharacter, lpTargetDevCharacter) {
        result := DllCall("ICM32.dll\CMCreateTransform", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "ptr")
        return result
    }

    /**
     * Deprecated. There is no replacement API because this one was no longer being used. Developers of alternate CMM modules are not required to implement it. (CMCreateTransformW)
     * @param {Pointer<LOGCOLORSPACEW>} lpColorSpace 
     * @param {Pointer<Void>} lpDevCharacter 
     * @param {Pointer<Void>} lpTargetDevCharacter 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreatetransformw
     */
    static CMCreateTransformW(lpColorSpace, lpDevCharacter, lpTargetDevCharacter) {
        result := DllCall("ICM32.dll\CMCreateTransformW", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "ptr")
        return result
    }

    /**
     * Creates a color transform that maps from an input [**LOGCOLORSPACEA**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacea) to an optional target space and then to an output device, using a set of flags that define how the transform should be created.
     * @remarks
     * The Unicode equivalent of **CMCreateTransformExt** is [CMCreateTransformExtW](/windows/win32/api/icm/nf-icm-cmcreatetransformextw).
     * 
     * Every CMM is required to export this function.
     * @param {Pointer<LOGCOLORSPACEA>} lpColorSpace Pointer to an input logical color space structure.
     * @param {Pointer<Void>} lpDevCharacter Pointer to a memory-mapped device profile.
     * @param {Pointer<Void>} lpTargetDevCharacter Pointer to a memory-mapped target profile.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM transform creation flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @returns {Pointer} If this function succeeds, the return value is a color transform in the range 256 to 65,535. Since only the low **WORD** of the transform is retained, valid transforms cannot exceed this range.
     * 
     * If this function fails, the return value is an error code having a value less than 256. When the return value is less than 256, signaling an error, the CMM should use **SetLastError** to set the last error to a valid error value as defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreatetransformext
     */
    static CMCreateTransformExt(lpColorSpace, lpDevCharacter, lpTargetDevCharacter, dwFlags) {
        result := DllCall("ICM32.dll\CMCreateTransformExt", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Determines whether specified RGB triples lie in the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @remarks
     * Beginning with Windows Vista, CMM Implementors are no longer required to implement this method.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * CMM Implementors are required to implement this method.
     * 
     * Every CMM is required to export this function.
     * 
     * If the function is not successful, custom CMMs should call [SetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror) to set the last error to a valid error value defined in Winerror.h.
     * @param {Pointer} hcmTransform Specifies the transform to use.
     * @param {Pointer<RGBTRIPLE>} lpaRGBTriple Points to an array of RGB triples to check.
     * @param {Pointer<Byte>} lpaResult Points to the buffer in which to put results.
     *     
     * The results are represented by an array of bytes. Each byte in the array corresponds to an RGB triple and has an unsigned value between 0 and 255. The value 0 denotes that the color is in gamut, while a nonzero value denotes that it is out of gamut. For any integer *n* in the range 0 \< *n* \< 255, a result value of *n* + 1 indicates that the corresponding color is at least as far out of gamut as would be indicated by a result value of *n*.
     * @param {Integer} nCount Specifies the number of elements in the array.
     * @returns {Integer} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. Call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) to retrieve the error.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcheckcolorsingamut
     */
    static CMCheckColorsInGamut(hcmTransform, lpaRGBTriple, lpaResult, nCount) {
        result := DllCall("ICM32.dll\CMCheckColorsInGamut", "ptr", hcmTransform, "ptr", lpaRGBTriple, "ptr", lpaResult, "uint", nCount, "int")
        return result
    }

    /**
     * Creates a display color profile from a [**LOGCOLORSPACEA**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacea) structure.
     * @remarks
     * Beginning with Windows Vista, CMM Implementors are no longer required to implement this method.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * The Unicode version of this function is [**CMCreateProfileW**](https://msdn.microsoft.com/en-us/library/dd371864\(v=vs.85\)).
     * 
     * Only the Windows default CMM is required to export this function; it is optional for all other CMMs.
     * 
     * If a CMM does not support **CMCreateProfile**, Windows uses the default CMM to create the profile.
     * 
     * The CMM should set all header fields to sensible defaults. This profile should be usable as the input profile in a transform.
     * 
     * The calling application must free the buffer allocated by this function and pointed to by the *lpProfileData* parameter. Use [**GlobalFree**](../winbase/nf-winbase-globalfree.md) to free the buffer.
     * @param {Pointer<LOGCOLORSPACEA>} lpColorSpace Pointer to a color logical space, of which the **lcsFilename** member will be **NULL**.
     * @param {Pointer<Void>} lpProfileData Pointer to a pointer to a buffer. If successful the function allocates and fills this buffer. It is the calling application's responsibility to free this buffer when it is no longer needed.
     * @returns {Integer} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. Call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) to retrieve the error.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreateprofile
     */
    static CMCreateProfile(lpColorSpace, lpProfileData) {
        result := DllCall("ICM32.dll\CMCreateProfile", "ptr", lpColorSpace, "ptr", lpProfileData, "int")
        return result
    }

    /**
     * Translates an application-supplied RGBQuad into the device [color space](https://msdn.microsoft.com/en-us/library/dd371818\(v=vs.85\)).
     * @remarks
     * Every CMM is required to export this function.
     * @param {Pointer} hcmTransform Specifies the transform to be used.
     * @param {Integer} ColorRef The RGBQuad to translate.
     * @param {Pointer<UInt32>} lpColorRef Points to a buffer in which to place the translation.
     * @param {Integer} dwFlags Specifies how the transform should be used to make the translation. This parameter can take one of the following meanings.
     * 
     * <table>
     * <colgroup>
     * <col />
     * <col />
     * </colgroup>
     * <thead>
     * <tr class="header">
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * </thead>
     * <tbody>
     * <tr class="odd">
     * <td><span id="CMS_FORWARD"></span><span id="cms_forward"></span>
     * <strong>CMS_FORWARD</strong></td>
     * <td><p>Use forward transform</p></td>
     * </tr>
     * <tr class="even">
     * <td><span id="CMS_BACKWARD"></span><span id="cms_backward"></span>
     * <strong>CMS_BACKWARD</strong></td>
     * <td><p>Use reverse transform</p></td>
     * </tr>
     * </tbody>
     * </table>
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. The CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmtranslatergb
     */
    static CMTranslateRGB(hcmTransform, ColorRef, lpColorRef, dwFlags) {
        result := DllCall("ICM32.dll\CMTranslateRGB", "ptr", hcmTransform, "uint", ColorRef, "ptr", lpColorRef, "uint", dwFlags, "int")
        return result
    }

    /**
     * Translates a bitmap from one [color space](https://msdn.microsoft.com/en-us/library/dd371818\(v=vs.85\)) to another using a color transform.
     * @remarks
     * Beginning with Windows Vista, CMM Implementors are no longer required to implement this method.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * Every CMM is required to export this function.
     * 
     * When writing into the destination buffer, the CMM should make sure that scan lines are padded to be **DWORD**-aligned.
     * 
     * If the input and output formats are not compatible with the color transform, this function fails.
     * 
     * If both input and output bitmap formats are 3-channel, 4 bytes-per-pixel as in the case of BM\_xRGBQUADS, the 4th byte should be preserved and copied to the output buffer.
     * 
     * Note that this function must support in-place translation. That is, whenever the memory footprint of the output is less than or equal to the memory footprint of the input, this function must be able to translate the bitmap colors even if the source and destination buffers are the same.
     * @param {Pointer} hcmTransform Specifies the color transform to use.
     * @param {Pointer<Void>} lpSrcBits Points to the bitmap to translate.
     * @param {Integer} bmInput Specifies the input bitmap format.
     * @param {Integer} dwWidth Specifies the number of pixels per scan line in the input bitmap.
     * @param {Integer} dwHeight Specifies the number of scan lines in the input bitmap.
     * @param {Integer} dwStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the input bitmap. If *dwStride* is set to zero, the CMM should assume that scan lines are padded so as to be **DWORD**-aligned.
     * @param {Pointer<Void>} lpDestBits Points to a destination buffer in which to place the translated bitmap.
     * @param {Integer} bmOutput Specifies the output bitmap format.
     * @param {Integer} dwTranslateDirection 
     * @returns {Integer} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. If the function is not successful, the CMM should call [SetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror) to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmtranslatergbs
     */
    static CMTranslateRGBs(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwStride, lpDestBits, bmOutput, dwTranslateDirection) {
        result := DllCall("ICM32.dll\CMTranslateRGBs", "ptr", hcmTransform, "ptr", lpSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwStride, "ptr", lpDestBits, "int", bmOutput, "uint", dwTranslateDirection, "int")
        return result
    }

    /**
     * Creates a color transform that maps from an input [**LOGCOLORSPACEW**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacew) to an optional target space and then to an output device, using a set of flags that define how the transform should be created.
     * @remarks
     * Every CMM is required to export this function.
     * @param {Pointer<LOGCOLORSPACEW>} lpColorSpace Pointer to an input logical color space structure.
     * @param {Pointer<Void>} lpDevCharacter Pointer to a memory-mapped device profile.
     * @param {Pointer<Void>} lpTargetDevCharacter Pointer to a memory-mapped target profile.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM transform creation flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @returns {Pointer} If this function succeeds, the return value is a color transform in the range 256 to 65,535. Since only the low **WORD** of the transform is retained, valid transforms cannot exceed this range.
     * 
     * If this function fails, the return value is an error code having a value less than 256. When the return value is less than 256, signaling an error, the CMM should use **SetLastError** to set the last error to a valid error value as defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmcreatetransformextw
     */
    static CMCreateTransformExtW(lpColorSpace, lpDevCharacter, lpTargetDevCharacter, dwFlags) {
        result := DllCall("ICM32.dll\CMCreateTransformExtW", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Deletes a specified color transform, and frees any memory associated with it.
     * @remarks
     * Every CMM is required to export this function.
     * @param {Pointer} hcmTransform Identifies the color transform to be deleted.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If the function fails, the return value is **FALSE**. If the **CMDeleteTransform** function is not successful, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmdeletetransform
     */
    static CMDeleteTransform(hcmTransform) {
        result := DllCall("ICM32.dll\CMDeleteTransform", "ptr", hcmTransform, "int")
        return result
    }

    /**
     * Retrieves various information about the color management module (CMM).
     * @remarks
     * The **CMGetInfo** function can be called by applications directly to obtain information about the CMM. Applications should not call other CMM functions directly. To obtain CMM information, get the path to the CMM from the registry. Invoke the Windows API function [GetModuleHandle](../libloaderapi/nf-libloaderapi-getmodulehandlea.md) and pass the file name of the CMM as the value of its parameter. Call the **CMGetInfo** function and pass it the constant CMM\_DESCRIPTION as the value of its parameter. Call the [LoadString](../winuser/nf-winuser-loadstringa.md) function. Pass the module handle as the first parameter, and the return value of the **CMGetInfo** function as the value of the second parameter.
     * 
     * CMMs that do not run on Windows 95 should return 0x0050000 for CMM\_WIN\_VERSION.
     * @param {Integer} dwInfo Specifies what information should be retrieved. This parameter can take one of the following constant values.
     * 
     * <table>
     * <colgroup>
     * <col />
     * <col />
     * </colgroup>
     * <thead>
     * <tr class="header">
     * <th>Constant</th>
     * <th>Significance of the function's return value</th>
     * </tr>
     * </thead>
     * <tbody>
     * <tr class="odd">
     * <td><span id="CMM_DESCRIPTION"></span><span id="cmm_description"></span>
     * <strong>CMM_DESCRIPTION</strong></td>
     * <td><p>A text string that describes the color management module.</p></td>
     * </tr>
     * <tr class="even">
     * <td><span id="CMM_DLL_VERSION"></span><span id="cmm_dll_version"></span>
     * <strong>CMM_DLL_VERSION</strong></td>
     * <td><p>Version number of the CMM DLL.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><span id="CMM_DRIVER_LEVEL"></span><span id="cmm_driver_level"></span>
     * <strong>CMM_DRIVER_LEVEL</strong></td>
     * <td><p>Driver compatibility information.</p></td>
     * </tr>
     * <tr class="even">
     * <td><span id="CMM_IDENT"></span><span id="cmm_ident"></span>
     * <strong>CMM_IDENT</strong></td>
     * <td><p>The CMM identification signature registered with the International Color Consortium (ICC).</p></td>
     * </tr>
     * <tr class="odd">
     * <td><span id="CMM_LOGOICON"></span><span id="cmm_logoicon"></span>
     * <strong>CMM_LOGOICON</strong></td>
     * <td><p>The logo icon for this CMM.</p></td>
     * </tr>
     * <tr class="even">
     * <td><span id="CMM_VERSION"></span><span id="cmm_version"></span>
     * <strong>CMM_VERSION</strong></td>
     * <td><p>Version of Windows supported.</p></td>
     * </tr>
     * <tr class="odd">
     * <td><span id="CMM_WIN_VERSION"></span><span id="cmm_win_version"></span>
     * <strong>CMM_WIN_VERSION</strong></td>
     * <td><p>Backward compatibility with Windows 95.</p></td>
     * </tr>
     * </tbody>
     * </table>
     * @returns {Integer} If this function succeeds, the return value is the same nonzero value that was passed in through the *dwInfo* parameter. If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmgetinfo
     */
    static CMGetInfo(dwInfo) {
        result := DllCall("ICM32.dll\CMGetInfo", "uint", dwInfo, "uint")
        return result
    }

    /**
     * Retrieves information about the specified named color profile.
     * @remarks
     * This function is required in the default CMM. It is optional for all other CMMs.
     * @param {Pointer} hProfile The handle to the profile from which the information will be retrieved.
     * @param {Pointer<NAMED_PROFILE_INFO>} pNamedProfileInfo A pointer to a **NAMED_PROFILE_INFO** structure.
     * @returns {Integer} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. When this occurs, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmgetnamedprofileinfo
     */
    static CMGetNamedProfileInfo(hProfile, pNamedProfileInfo) {
        result := DllCall("ICM32.dll\CMGetNamedProfileInfo", "ptr", hProfile, "ptr", pNamedProfileInfo, "int")
        return result
    }

    /**
     * Reports whether the given profile is a valid ICC profile that can be used for color management.
     * @remarks
     * Only the Windows default CMM is required to export this function; it is optional for all other CMMs.
     * 
     * If a CMM does not support this function, Windows uses the default CMM to validate the profile.
     * @param {Pointer} hProfile Specifies the profile to check.
     * @param {Pointer<Int32>} lpbValid Pointer to a variable that is set on exit to TRUE if the profile is a valid ICC profile, or FALSE if not.
     * @returns {Integer} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. If the function fails, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmisprofilevalid
     */
    static CMIsProfileValid(hProfile, lpbValid) {
        result := DllCall("ICM32.dll\CMIsProfileValid", "ptr", hProfile, "ptr", lpbValid, "int")
        return result
    }

    /**
     * Translates an array of colors from a source [color space](/windows/win32/wcs/c) to a destination color space using a color transform.
     * @remarks
     * Every CMM is required to export this function.
     * 
     * If the input and the output color types are not compatible with the color transform, this function should fail.
     * 
     * Note that this function must support in-place translation. That is, whenever the memory footprint of the output is less than or equal to the memory footprint of the input, this function must be able to translate the bitmap colors even if the source and destination buffers are the same.
     * @param {Pointer} hcmTransform Specifies the color transform to use.
     * @param {Pointer<COLOR>} lpaInputColors Points to an array of [**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to translate.
     * @param {Integer} nColors Specifies the number of elements in the array.
     * @param {Integer} ctInput Specifies the color type of the input.
     * @param {Pointer<COLOR>} lpaOutputColors Points to a buffer in which an array of translated **COLOR** structures is to be placed.
     * @param {Integer} ctOutput Specifies the output color type.
     * @returns {Integer} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. The CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmtranslatecolors
     */
    static CMTranslateColors(hcmTransform, lpaInputColors, nColors, ctInput, lpaOutputColors, ctOutput) {
        result := DllCall("ICM32.dll\CMTranslateColors", "ptr", hcmTransform, "ptr", lpaInputColors, "uint", nColors, "int", ctInput, "ptr", lpaOutputColors, "int", ctOutput, "int")
        return result
    }

    /**
     * Translates a bitmap from one defined format into a different defined format and calls a callback function periodically, if one is specified, to report progress and permit the calling application to terminate the translation.
     * @remarks
     * Every CMM is required to export this function.
     * 
     * When writing into the destination buffer, the CMM should make sure that scan lines are padded to be **DWORD**-aligned.
     * 
     * If the input and output formats are not compatible with the color transform, this function fails.
     * 
     * If both input and output bitmap formats are 3 channel, 4 bytes per pixel as in the case of BM\_xRGBQUADS, the fourth bytes should be preserved and copied to the output buffer.
     * 
     * If the callback function returns zero, processing should be cancelled and **CMTranslateRGBsExt** should return zero to indicate failure; the output buffer may be partially filled.
     * 
     * Note that this function must support in-place translation. That is, whenever the memory footprint of the output is less than or equal to the memory footprint of the input, this function must be able to translate the bitmap colors even if the source and destination buffers are the same.
     * @param {Pointer} hcmTransform Specifies the color transform to use.
     * @param {Pointer<Void>} lpSrcBits Pointer to the bitmap to translate.
     * @param {Integer} bmInput Specifies the input bitmap format.
     * @param {Integer} dwWidth Specifies the number of pixels per scan line in the input bitmap.
     * @param {Integer} dwHeight Specifies the number of scan lines in the input bitmap.
     * @param {Integer} dwInputStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the input bitmap. If *dwInputStride* is set to zero, the CMM should assume that scan lines are padded so as to be **DWORD**-aligned.
     * @param {Pointer<Void>} lpDestBits Points to a destination buffer in which to place the translated bitmap.
     * @param {Integer} bmOutput Specifies the output bitmap format.
     * @param {Integer} dwOutputStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the input bitmap. If *dwOutputStride* is set to zero, the CMM should pad scan lines so that they are **DWORD**-aligned.
     * @param {Pointer<LPBMCALLBACKFN>} lpfnCallback Pointer to an application-supplied callback function called periodically by **CMTranslateRGBsExt** to report progress and allow the calling process to cancel the translation. (See [**ICMProgressProcCallback**](/windows/win32/wcs/icmprogressproccallback).)
     * @param {Pointer} ulCallbackData Data passed back to the callback function, for example to identify the translation that is reporting progress.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE** and the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-cmtranslatergbsext
     */
    static CMTranslateRGBsExt(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwInputStride, lpDestBits, bmOutput, dwOutputStride, lpfnCallback, ulCallbackData) {
        result := DllCall("ICM32.dll\CMTranslateRGBsExt", "ptr", hcmTransform, "ptr", lpSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwInputStride, "ptr", lpDestBits, "int", bmOutput, "uint", dwOutputStride, "ptr", lpfnCallback, "ptr", ulCallbackData, "int")
        return result
    }

    /**
     * Creates a handle to a specified color profile. (ANSI)
     * @remarks
     * This API will take a set of DMP, CAMP, and GMMP and return a WCS profile handle. **NULL** values for GMMP are valid. A **NULL** value for CAMP will be replaced with the default CAMP value.
     * 
     * This API will also accept ICC profiles. Using an ICC profile does not guarantee processing by the WCS CITE engine. The WCS engine will only be used if it is passed at least one WCS profile. Pure ICC workflows will be consistent with legacy behavior.
     * 
     * You can use the handle that this function returns in other color profile management functions.
     * 
     * The *dwCreationMode* flags CREATE\_NEW, CREATE\_ALWAYS, and TRUNCATE\_EXISTING will always return blank ICC HPROFILEs. If other *dwCreationMode* flags are present, the function will determine whether the profile is ICC or WCS XML.
     * 
     * Within the ICC code path, an ICC HPROFILE is returned using the requested sharing, access, and creation flags as specified in the tables above.
     * 
     * Within the WCS path, the *dwCreationMode* flag OPEN\_ALWAYS will fail if the profile does not exist, because WCS profiles cannot be created or edited within the WCS architecture (they must be edited outside of it, using MSXML6). For the same reason, *dwShareMode* flag FILE\_SHARE\_WRITE, and the *dwDesiredAccess* flag PROFILE\_READWRITE are ignored within the WCS path.
     * 
     * Once the handle to the color profile is created, any information used to create that handle can be deleted.
     * 
     * Use the [**CloseColorProfile**](/windows/win32/api/icm/nf-icm-closecolorprofile) function to close an object handle that is returned by **WcsOpenColorProfile**.
     * @param {Pointer<PROFILE>} pCDMPProfile Pointer to a WCS DMP or an ICC color profile structure specifying the profile. You can free the *pCDMPProfile* pointer after you create the handle. If the profile is ICC and its **dwType** member is set to DONT\_USE\_EMBEDDED\_WCS\_PROFILES, **WcsOpenColorProfile** ignores any embedded WCS profile within the ICC profile.
     * @param {Pointer<PROFILE>} pCAMPProfile A pointer to a profile structure that specifies a WCS color appearance model profile (CAMP). You can free the *pCAMPProfile* pointer after you create the handle. If **NULL**, the default CAMP is used, and the current user setting, WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, is used while querying the default CAMP.
     * @param {Pointer<PROFILE>} pGMMPProfile A pointer to a profile structure that specifies a WCS gamut map model profile (GMMP). You can free the *pGMMPProfile* pointer after you create the handle. If **NULL**, the default GMMP for the default rendering intent is used, and the current user setting, WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, is used while querying the default GMMP. For a description of rendering intents, see [Rendering Intents](/windows/win32/wcs/rendering-intents).
     * @param {Integer} dwDesireAccess 
     * @param {Integer} dwShareMode 
     * @param {Integer} dwCreationMode 
     * @param {Integer} dwFlags A flag value that specifies whether to use the embedded WCS profile. This parameter has no effect unless *pCDMProfile* specifies an ICC profile that contains an embedded WCS profile.
     * @returns {Pointer} If this function succeeds, the return value is the handle of the color profile that is opened.
     * 
     * If this function fails, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsopencolorprofilea
     */
    static WcsOpenColorProfileA(pCDMPProfile, pCAMPProfile, pGMMPProfile, dwDesireAccess, dwShareMode, dwCreationMode, dwFlags) {
        result := DllCall("mscms.dll\WcsOpenColorProfileA", "ptr", pCDMPProfile, "ptr", pCAMPProfile, "ptr", pGMMPProfile, "uint", dwDesireAccess, "uint", dwShareMode, "uint", dwCreationMode, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Creates a handle to a specified color profile. (Unicode)
     * @remarks
     * This API will take a set of DMP, CAMP, and GMMP and return a WCS profile handle. **NULL** values for GMMP are valid. A **NULL** value for CAMP will be replaced with the default CAMP value.
     * 
     * This API will also accept ICC profiles. Using an ICC profile does not guarantee processing by the WCS CITE engine. The WCS engine will only be used if it is passed at least one WCS profile. Pure ICC workflows will be consistent with legacy behavior.
     * 
     * You can use the handle that this function returns in other color profile management functions.
     * 
     * The *dwCreationMode* flags CREATE\_NEW, CREATE\_ALWAYS, and TRUNCATE\_EXISTING will always return blank ICC HPROFILEs. If other *dwCreationMode* flags are present, the function will determine whether the profile is ICC or WCS XML.
     * 
     * Within the ICC code path, an ICC HPROFILE is returned using the requested sharing, access, and creation flags as specified in the tables above.
     * 
     * Within the WCS path, the *dwCreationMode* flag OPEN\_ALWAYS will fail if the profile does not exist, because WCS profiles cannot be created or edited within the WCS architecture (they must be edited outside of it, using MSXML6). For the same reason, *dwShareMode* flag FILE\_SHARE\_WRITE, and the *dwDesiredAccess* flag PROFILE\_READWRITE are ignored within the WCS path.
     * 
     * Once the handle to the color profile is created, any information used to create that handle can be deleted.
     * 
     * Use the [**CloseColorProfile**](/windows/win32/api/icm/nf-icm-closecolorprofile) function to close an object handle that is returned by **WcsOpenColorProfile**.
     * @param {Pointer<PROFILE>} pCDMPProfile Pointer to a WCS DMP or an ICC color profile structure specifying the profile. You can free the *pCDMPProfile* pointer after you create the handle. If the profile is ICC and its **dwType** member is set to DONT\_USE\_EMBEDDED\_WCS\_PROFILES, **WcsOpenColorProfile** ignores any embedded WCS profile within the ICC profile.
     * @param {Pointer<PROFILE>} pCAMPProfile A pointer to a profile structure that specifies a WCS color appearance model profile (CAMP). You can free the *pCAMPProfile* pointer after you create the handle. If **NULL**, the default CAMP is used, and the current user setting, WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, is used while querying the default CAMP.
     * @param {Pointer<PROFILE>} pGMMPProfile A pointer to a profile structure that specifies a WCS gamut map model profile (GMMP). You can free the *pGMMPProfile* pointer after you create the handle. If **NULL**, the default GMMP for the default rendering intent is used, and the current user setting, WCS\_PROFILE\_MANAGEMENT\_SCOPE\_CURRENT\_USER, is used while querying the default GMMP. For a description of rendering intents, see [Rendering Intents](/windows/win32/wcs/rendering-intents).
     * @param {Integer} dwDesireAccess 
     * @param {Integer} dwShareMode 
     * @param {Integer} dwCreationMode 
     * @param {Integer} dwFlags A flag value that specifies whether to use the embedded WCS profile. This parameter has no effect unless *pCDMProfile* specifies an ICC profile that contains an embedded WCS profile.
     * @returns {Pointer} If this function succeeds, the return value is the handle of the color profile that is opened.
     * 
     * If this function fails, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsopencolorprofilew
     */
    static WcsOpenColorProfileW(pCDMPProfile, pCAMPProfile, pGMMPProfile, dwDesireAccess, dwShareMode, dwCreationMode, dwFlags) {
        result := DllCall("mscms.dll\WcsOpenColorProfileW", "ptr", pCDMPProfile, "ptr", pCAMPProfile, "ptr", pGMMPProfile, "uint", dwDesireAccess, "uint", dwShareMode, "uint", dwCreationMode, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Converts a WCS profile into an International Color Consortium (ICC) profile.
     * @remarks
     * This function can be used with ASCII or Unicode strings.
     * 
     * The **CloseColorProfile** function should be used to close the returned HPROFILE handle when it is no longer needed.
     * 
     * The DMP, CAMP, and GMMP from the HPROFILE are embedded in a private tag within the created ICC profile.
     * 
     * The ICC profile created using this API will have its profile description tag constructed from the ProfileName elements of the WCS profiles according to the following pattern: "Created by Microsoft WCS from DMP:\[the DMP ProfileName\], CAMP:\[the CAMP ProfileName\], GMMP:\[the GMMP ProfileName\]"
     * 
     * When WCS encounters this ICC profile (via [**OpenColorProfileW**](/windows/win32/api/icm/nf-icm-opencolorprofilew) or [**WcsOpenColorProfileW**](/windows/win32/api/icm/nf-icm-wcsopencolorprofilew) ) it extracts and uses the WCS profile(s) contained in the *WcsProfilesTag*.
     * 
     * The out-of-gamut information in the gamut tags created in WCS uses the perceptual color distance in CIECAM02, which is the mean square root in CIECAM02 Jab space. The distance in legacy ICC profile gamut tags is the mean square root in CIELAB space. It is recommended that you use the CIECAM02 space when it is available, to provide more perceptually accurate distance metrics.
     * 
     * WCS extracts and uses the original WCS profile by means of an XML profile explicitly associated with a device, or an ICC profile that has a*WcsProfilesTag*.
     * 
     * The *WcsProfilesTag* is a Microsoft private ICC profile tag used in profiles created by **WcsCreateIccProfile** to contain the WCS profiles input to **WcsCreateIccProfile**. This tag conforms to ICC profile requirements for profile tags. The non-XML components of the tag must be in "Big-Endian" byte ordering, which is standard for ICC profiles. Further, the tag data must be aligned on a 4-byte boundary (measured from the start of the ICC profile). The structure of the tag is defined by the **WcsProfilesTagType** below. Note that the XML components of the tag, the WCS profiles contained in the WcsProfileTag, are left in their native byte ordering, which may be either little-endian or big-endian since XML parsers correctly process either.
     * 
     * The WcsProfilesTag signature is "MS00". This is the tag signature that will appear in the ICC profiles tag table for the WcsProfilesTag.
     * 
     * The **WcsProfilesTagType Structure** has the following structure:
     * 
     * | Byte Offset | Content                                                                                                                                 |
     * |-------------|-----------------------------------------------------------------------------------------------------------------------------------------|
     * | 0-3         | The MS10 type signature.                                                                                                                |
     * | 4-7         | Reserved, must be set to 0 (ICC tradition).                                                                                             |
     * | 8-11        | Byte offset from the beginning of the tag to the CDMP data.                                                                             |
     * | 12-15       | Size of the CDMP data in bytes.                                                                                                         |
     * | 16-19       | Byte offset from the beginning of the tag to the CAMP data.                                                                             |
     * | 20-23       | Size of the CAMP data in bytes.                                                                                                         |
     * | 24-27       | Byte offset from the beginning of the tag to the GMMP data.                                                                             |
     * | 28-31       | Byte offset from the beginning of the tag to the GMMP data.                                                                             |
     * | 31-n        | A sequence of (element size -32) bytes \[where element size is the tag size recorded in the ICC profile tag table entry for this tag.\] |
     * 
     * These are the WCS XML profiles that were used by **WcsCreateIccProfile** to create this ICC profile. The WCS profiles are ordered: the DMP (required) first, followed by the CAMP (if present), followed by the GMMP (if present).
     * @param {Pointer} hWcsProfile A handle to the WCS color profile that is converted. See Remarks.
     * @param {Integer} dwOptions A flag value that specifies the profile conversion options.
     * 
     * By default, the original WCS profiles used for the conversion are embedded in the output ICC profile in a Microsoft private tag, *WcsProfilesTag* (with signature "MS000". This produces an ICC profile that is compatible with ICC software, yet retains the original WCS profile data available to code designed to parse it.
     * 
     * The possible values of this parameter are as follows. Any bits not defined in this list are reserved and should be set to zero:
     * 
     * | Value        | Description                                                                                                |
     * |--------------|------------------------------------------------------------------------------------------------------------|
     * | WCS\_DEFAULT | Specifies that the new ICC profile contains the original WCS profile in a private WcsProfilesTag.          |
     * | WCS\_ICCONLY | Specifies that the new ICC profile does not contain either the WcsProfilesTag or the original WCS profile. |
     * @returns {Pointer} If this function succeeds, the return value is the handle of the new color profile.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcscreateiccprofile
     */
    static WcsCreateIccProfile(hWcsProfile, dwOptions) {
        result := DllCall("mscms.dll\WcsCreateIccProfile", "ptr", hWcsProfile, "uint", dwOptions, "ptr")
        return result
    }

    /**
     * Determines whether system management of the display calibration state is enabled.
     * @param {Pointer<Int32>} pbIsEnabled **TRUE** if system management of the display calibration state is enabled; otherwise **FALSE**.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcsgetcalibrationmanagementstate
     */
    static WcsGetCalibrationManagementState(pbIsEnabled) {
        result := DllCall("mscms.dll\WcsGetCalibrationManagementState", "ptr", pbIsEnabled, "int")
        return result
    }

    /**
     * Enables or disables system management of the display calibration state.
     * @remarks
     * This function must be called with elevated permissions for it to succeed.
     * @param {Integer} bIsEnabled **TRUE** to enable system management of the display calibration state. **FALSE** to disable system management of the display calibration state.
     * @returns {Integer} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-wcssetcalibrationmanagementstate
     */
    static WcsSetCalibrationManagementState(bIsEnabled) {
        result := DllCall("mscms.dll\WcsSetCalibrationManagementState", "int", bIsEnabled, "int")
        return result
    }

    /**
     * ColorProfileAddDisplayAssociation associates an installed color profile with a specified display in the given scope.
     * @remarks
     * See [connecting and configuring displays](/windows-hardware/drivers/display/connecting-and-configuring-displays) for information on display adapter IDs and source IDs.
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {Pointer<PWSTR>} profileName Identifies the installed profile to associate.
     * @param {Pointer} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Integer} setAsDefault Whether or not to set the newly associated profile as the default.
     * @param {Integer} associateAsAdvancedColor Specifies to which association list the new profile is added.
     * @returns {Integer} **S_OK** for success, or a failure **HRESULT** value
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-colorprofileadddisplayassociation
     */
    static ColorProfileAddDisplayAssociation(scope, profileName, targetAdapterID, sourceID, setAsDefault, associateAsAdvancedColor) {
        profileName := profileName is String? StrPtr(profileName) : profileName

        result := DllCall("mscms.dll\ColorProfileAddDisplayAssociation", "int", scope, "ptr", profileName, "ptr", targetAdapterID, "uint", sourceID, "int", setAsDefault, "int", associateAsAdvancedColor, "int")
        return result
    }

    /**
     * ColorProfileRemoveDisplayAssociation disassociates an installed color profile from a specified display in the given scope.
     * @remarks
     * See [connecting and configuring displays](/windows-hardware/drivers/display/connecting-and-configuring-displays) for information on display adapter IDs and source IDs.
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {Pointer<PWSTR>} profileName Identifies the installed profile to associate.
     * @param {Pointer} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Integer} dissociateAdvancedColor Specifies to which association list the new profile is added.
     * @returns {Integer} **S_OK** for success, or a failure **HRESULT** value
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-colorprofileremovedisplayassociation
     */
    static ColorProfileRemoveDisplayAssociation(scope, profileName, targetAdapterID, sourceID, dissociateAdvancedColor) {
        profileName := profileName is String? StrPtr(profileName) : profileName

        result := DllCall("mscms.dll\ColorProfileRemoveDisplayAssociation", "int", scope, "ptr", profileName, "ptr", targetAdapterID, "uint", sourceID, "int", dissociateAdvancedColor, "int")
        return result
    }

    /**
     * ColorProfileSetDisplayDefaultAssociation sets an installed color profile as the default profile for a specified display in the given scope.
     * @remarks
     * See [connecting and configuring displays](/windows-hardware/drivers/display/connecting-and-configuring-displays) for information on display adapter IDs and source IDs.
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {Pointer<PWSTR>} profileName Identifies the installed profile to associate.
     * @param {Integer} profileType The type of color profile to set as default (currently only CPT_ICC is supported).
     * @param {Integer} profileSubType The subtype of the color profile to set as default.
     * @param {Pointer} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @returns {Integer} **S_OK** for success, or a failure **HRESULT** value
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-colorprofilesetdisplaydefaultassociation
     */
    static ColorProfileSetDisplayDefaultAssociation(scope, profileName, profileType, profileSubType, targetAdapterID, sourceID) {
        profileName := profileName is String? StrPtr(profileName) : profileName

        result := DllCall("mscms.dll\ColorProfileSetDisplayDefaultAssociation", "int", scope, "ptr", profileName, "int", profileType, "int", profileSubType, "ptr", targetAdapterID, "uint", sourceID, "int")
        return result
    }

    /**
     * ColorProfileGetDisplayList retrieves the list of profiles associated with a given display in the specified scope.
     * @remarks
     * See [connecting and configuring displays](/windows-hardware/drivers/display/connecting-and-configuring-displays) for information on display adapter IDs and source IDs.
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {Pointer} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Pointer<PWSTR>} profileList Pointer to a buffer where the profile names are placed, must be freed with [LocalFree](../winbase/nf-winbase-localfree.md).
     * @param {Pointer<UInt32>} profileCount Receives the number of profiles names copied into profileList.
     * @returns {Integer} **S_OK** for success, or a failure **HRESULT** value
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-colorprofilegetdisplaylist
     */
    static ColorProfileGetDisplayList(scope, targetAdapterID, sourceID, profileList, profileCount) {
        profileList := profileList is String? StrPtr(profileList) : profileList

        result := DllCall("mscms.dll\ColorProfileGetDisplayList", "int", scope, "ptr", targetAdapterID, "uint", sourceID, "ptr", profileList, "ptr", profileCount, "int")
        return result
    }

    /**
     * ColorProfileGetDisplayDefault gets the default color profile for a given display in the specified scope.
     * @remarks
     * See [connecting and configuring displays](/windows-hardware/drivers/display/connecting-and-configuring-displays) for information on display adapter IDs and source IDs.
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {Pointer} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Integer} profileType The type of color profile to return (currently only CPT_ICC is supported).
     * @param {Integer} profileSubType The subtype of the color profile to return.
     * @param {Pointer<PWSTR>} profileName Receives a pointer to the default color profile name, which must be freed with [LocalFree](../winbase/nf-winbase-localfree.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-colorprofilegetdisplaydefault
     */
    static ColorProfileGetDisplayDefault(scope, targetAdapterID, sourceID, profileType, profileSubType, profileName) {
        profileName := profileName is String? StrPtr(profileName) : profileName

        result := DllCall("mscms.dll\ColorProfileGetDisplayDefault", "int", scope, "ptr", targetAdapterID, "uint", sourceID, "int", profileType, "int", profileSubType, "ptr", profileName, "int")
        return result
    }

    /**
     * ColorProfileGetDisplayUserScope gets the currently selected color profile scope of the provided display - either user or system.
     * @remarks
     * See [connecting and configuring displays](/windows-hardware/drivers/display/connecting-and-configuring-displays) for information on display adapter IDs and source IDs.
     * @param {Pointer} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Pointer<Int32>} scope Returns the scope of the currently selected color profile - either the current user or system.
     * @returns {Integer} **S_OK** for success, or a failure **HRESULT** value
     * @see https://learn.microsoft.com/windows/win32/api/icm/nf-icm-colorprofilegetdisplayuserscope
     */
    static ColorProfileGetDisplayUserScope(targetAdapterID, sourceID, scope) {
        result := DllCall("mscms.dll\ColorProfileGetDisplayUserScope", "ptr", targetAdapterID, "uint", sourceID, "ptr", scope, "int")
        return result
    }

;@endregion Methods
}

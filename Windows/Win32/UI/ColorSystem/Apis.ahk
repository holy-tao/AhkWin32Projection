#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HCOLORSPACE.ahk
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
     * @param {HDC} hdc Identifies handle to the device context.
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
     * @returns {Integer} If this function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero.
     * 
     * If ICM_QUERY is specified and the function succeeds, the nonzero value returned is ICM_ON or ICM_OFF to indicate the current mode.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-seticmmode
     * @since windows5.0
     */
    static SetICMMode(hdc, mode) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetICMMode", "ptr", hdc, "int", mode, "int")
        return result
    }

    /**
     * The CheckColorsInGamut function determines whether a specified set of RGB triples lies in the output gamut of a specified device. The RGB triples are interpreted in the input logical color space.
     * @param {HDC} hdc Handle to the device context whose output gamut to be checked.
     * @param {Pointer<RGBTRIPLE>} lpRGBTriple Pointer to an array of RGB triples to check.
     * @param {Pointer} dlpBuffer Pointer to the buffer in which the results are to be placed. This buffer must be at least as large as <i>nCount</i> bytes.
     * @param {Integer} nCount The number of elements in the array of triples.
     * @returns {BOOL} If this function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-checkcolorsingamut
     * @since windows5.0
     */
    static CheckColorsInGamut(hdc, lpRGBTriple, dlpBuffer, nCount) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\CheckColorsInGamut", "ptr", hdc, "ptr", lpRGBTriple, "ptr", dlpBuffer, "uint", nCount, "int")
        return result
    }

    /**
     * The GetColorSpace function retrieves the handle to the input color space from a specified device context.
     * @param {HDC} hdc Specifies a device context that is to have its input color space handle retrieved.
     * @returns {HCOLORSPACE} If the function succeeds, the return value is the current input color space handle.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcolorspace
     * @since windows5.0
     */
    static GetColorSpace(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetColorSpace", "ptr", hdc, "ptr")
        return HCOLORSPACE({Value: result}, True)
    }

    /**
     * The GetLogColorSpace function retrieves the color space definition identified by a specified handle.
     * @param {HCOLORSPACE} hColorSpace Specifies the handle to a color space.
     * @param {Pointer} lpBuffer Points to a buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> structure.
     * @param {Integer} nSize Specifies the maximum size of the buffer.
     * @returns {BOOL} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getlogcolorspacea
     * @since windows5.0
     */
    static GetLogColorSpaceA(hColorSpace, lpBuffer, nSize) {
        hColorSpace := hColorSpace is Win32Handle ? NumGet(hColorSpace, "ptr") : hColorSpace

        result := DllCall("GDI32.dll\GetLogColorSpaceA", "ptr", hColorSpace, "ptr", lpBuffer, "uint", nSize, "int")
        return result
    }

    /**
     * The GetLogColorSpace function retrieves the color space definition identified by a specified handle.
     * @param {HCOLORSPACE} hColorSpace Specifies the handle to a color space.
     * @param {Pointer} lpBuffer Points to a buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> structure.
     * @param {Integer} nSize Specifies the maximum size of the buffer.
     * @returns {BOOL} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getlogcolorspacew
     * @since windows5.0
     */
    static GetLogColorSpaceW(hColorSpace, lpBuffer, nSize) {
        hColorSpace := hColorSpace is Win32Handle ? NumGet(hColorSpace, "ptr") : hColorSpace

        result := DllCall("GDI32.dll\GetLogColorSpaceW", "ptr", hColorSpace, "ptr", lpBuffer, "uint", nSize, "int")
        return result
    }

    /**
     * The CreateColorSpace function creates a logical color space.
     * @param {Pointer<LOGCOLORSPACEA>} lplcs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> data structure.
     * @returns {HCOLORSPACE} If this function succeeds, the return value is a handle that identifies a color space.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createcolorspacea
     * @since windows5.0
     */
    static CreateColorSpaceA(lplcs) {
        result := DllCall("GDI32.dll\CreateColorSpaceA", "ptr", lplcs, "ptr")
        return HCOLORSPACE({Value: result}, True)
    }

    /**
     * The CreateColorSpace function creates a logical color space.
     * @param {Pointer<LOGCOLORSPACEW>} lplcs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> data structure.
     * @returns {HCOLORSPACE} If this function succeeds, the return value is a handle that identifies a color space.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createcolorspacew
     * @since windows5.0
     */
    static CreateColorSpaceW(lplcs) {
        result := DllCall("GDI32.dll\CreateColorSpaceW", "ptr", lplcs, "ptr")
        return HCOLORSPACE({Value: result}, True)
    }

    /**
     * The SetColorSpace function defines the input color space for a given device context.
     * @param {HDC} hdc Specifies the handle to a device context.
     * @param {HCOLORSPACE} hcs Identifies handle to the color space to set.
     * @returns {HCOLORSPACE} If this function succeeds, the return value is a handle to the <i>hColorSpace</i> being replaced.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setcolorspace
     * @since windows5.0
     */
    static SetColorSpace(hdc, hcs) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hcs := hcs is Win32Handle ? NumGet(hcs, "ptr") : hcs

        result := DllCall("GDI32.dll\SetColorSpace", "ptr", hdc, "ptr", hcs, "ptr")
        return HCOLORSPACE({Value: result}, True)
    }

    /**
     * The DeleteColorSpace function removes and destroys a specified color space.
     * @param {HCOLORSPACE} hcs Specifies the handle to a color space to delete.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-deletecolorspace
     * @since windows5.0
     */
    static DeleteColorSpace(hcs) {
        hcs := hcs is Win32Handle ? NumGet(hcs, "ptr") : hcs

        result := DllCall("GDI32.dll\DeleteColorSpace", "ptr", hcs, "int")
        return result
    }

    /**
     * The GetICMProfile function retrieves the file name of the current output color profile for a specified device context.
     * @param {HDC} hdc Specifies a device context from which to retrieve the color profile.
     * @param {Pointer<UInt32>} pBufSize Pointer to a <b>DWORD</b> that contains the size of the buffer pointed to by <i>lpszFilename</i>. For the ANSI version of this function, the size is in bytes. For the Unicode version, the size is in WCHARs. If this function is successful, on return this parameter contains the size of the buffer actually used. However, if the buffer is not large enough, this function returns <b>FALSE</b>. In this case, the <b>GetLastError()</b> function returns ERROR_INSUFFICIENT_BUFFER and the <b>DWORD</b> pointed to by this parameter contains the size needed for the <i>lpszFilename</i> buffer.
     * @param {PSTR} pszFilename Points to the buffer that receives the path name of the profile.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>. It also returns <b>TRUE</b> if the <i>lpszFilename</i> parameter is <b>NULL</b> and the size required for the buffer is copied into <i>lpcbName.</i>
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-geticmprofilea
     * @since windows5.0
     */
    static GetICMProfileA(hdc, pBufSize, pszFilename) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetICMProfileA", "ptr", hdc, "uint*", pBufSize, "ptr", pszFilename, "int")
        return result
    }

    /**
     * The GetICMProfile function retrieves the file name of the current output color profile for a specified device context.
     * @param {HDC} hdc Specifies a device context from which to retrieve the color profile.
     * @param {Pointer<UInt32>} pBufSize Pointer to a <b>DWORD</b> that contains the size of the buffer pointed to by <i>lpszFilename</i>. For the ANSI version of this function, the size is in bytes. For the Unicode version, the size is in WCHARs. If this function is successful, on return this parameter contains the size of the buffer actually used. However, if the buffer is not large enough, this function returns <b>FALSE</b>. In this case, the <b>GetLastError()</b> function returns ERROR_INSUFFICIENT_BUFFER and the <b>DWORD</b> pointed to by this parameter contains the size needed for the <i>lpszFilename</i> buffer.
     * @param {PWSTR} pszFilename Points to the buffer that receives the path name of the profile.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>. It also returns <b>TRUE</b> if the <i>lpszFilename</i> parameter is <b>NULL</b> and the size required for the buffer is copied into <i>lpcbName.</i>
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-geticmprofilew
     * @since windows5.0
     */
    static GetICMProfileW(hdc, pBufSize, pszFilename) {
        pszFilename := pszFilename is String ? StrPtr(pszFilename) : pszFilename
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetICMProfileW", "ptr", hdc, "uint*", pBufSize, "ptr", pszFilename, "int")
        return result
    }

    /**
     * The SetICMProfile function sets a specified color profile as the output profile for a specified device context (DC).
     * @param {HDC} hdc Specifies a device context in which to set the color profile.
     * @param {PSTR} lpFileName Specifies the path name of the color profile to be set.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-seticmprofilea
     * @since windows5.0
     */
    static SetICMProfileA(hdc, lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetICMProfileA", "ptr", hdc, "ptr", lpFileName, "int")
        return result
    }

    /**
     * The SetICMProfile function sets a specified color profile as the output profile for a specified device context (DC).
     * @param {HDC} hdc Specifies a device context in which to set the color profile.
     * @param {PWSTR} lpFileName Specifies the path name of the color profile to be set.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-seticmprofilew
     * @since windows5.0
     */
    static SetICMProfileW(hdc, lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetICMProfileW", "ptr", hdc, "ptr", lpFileName, "int")
        return result
    }

    /**
     * The GetDeviceGammaRamp function gets the gamma ramp on direct color display boards having drivers that support downloadable gamma ramps in hardware.
     * @param {HDC} hdc Specifies the device context of the direct color display board in question.
     * @param {Pointer<Void>} lpRamp Points to a buffer where the function can place the current gamma ramp of the color display board. The gamma ramp is specified in three arrays of 256 <b>WORD</b> elements each, which contain the mapping between RGB values in the frame buffer and digital-analog-converter (DAC) values. The sequence of the arrays is red, green, blue.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdevicegammaramp
     * @since windows5.0
     */
    static GetDeviceGammaRamp(hdc, lpRamp) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\GetDeviceGammaRamp", "ptr", hdc, "ptr", lpRamp, "int")
        return result
    }

    /**
     * The SetDeviceGammaRamp function sets the gamma ramp on direct color display boards having drivers that support downloadable gamma ramps in hardware.
     * @param {HDC} hdc Specifies the device context of the direct color display board in question.
     * @param {Pointer<Void>} lpRamp Pointer to a buffer containing the gamma ramp to be set. The gamma ramp is specified in three arrays of 256 <b>WORD</b> elements each, which contain the mapping between RGB values in the frame buffer and digital-analog-converter (<i>DAC</i> ) values. The sequence of the arrays is red, green, blue. The RGB values must be stored in the most significant bits of each WORD to increase DAC independence.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setdevicegammaramp
     * @since windows5.0
     */
    static SetDeviceGammaRamp(hdc, lpRamp) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetDeviceGammaRamp", "ptr", hdc, "ptr", lpRamp, "int")
        return result
    }

    /**
     * The ColorMatchToTarget function enables you to preview colors as they would appear on the target device.
     * @param {HDC} hdc Specifies the device context for previewing, generally the screen.
     * @param {HDC} hdcTarget Specifies the target device context, generally a printer.
     * @param {Integer} action 
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-colormatchtotarget
     * @since windows5.0
     */
    static ColorMatchToTarget(hdc, hdcTarget, action) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hdcTarget := hdcTarget is Win32Handle ? NumGet(hdcTarget, "ptr") : hdcTarget

        result := DllCall("GDI32.dll\ColorMatchToTarget", "ptr", hdc, "ptr", hdcTarget, "uint", action, "int")
        return result
    }

    /**
     * The EnumICMProfiles function enumerates the different output color profiles that the system supports for a given device context.
     * @param {HDC} hdc Specifies the device context.
     * @param {Pointer<ICMENUMPROCA>} proc Specifies the procedure instance address of a callback function defined by the application. (See <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nc-wingdi-icmenumproca">EnumICMProfilesProcCallback</a>.)
     * @param {LPARAM} param2 
     * @returns {Integer} This function returns zero if the application interrupted the enumeration. The return value is -1 if there are no color profiles to enumerate. Otherwise, the return value is the last value returned by the callback function.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumicmprofilesa
     * @since windows5.0
     */
    static EnumICMProfilesA(hdc, proc, param2) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EnumICMProfilesA", "ptr", hdc, "ptr", proc, "ptr", param2, "int")
        return result
    }

    /**
     * The EnumICMProfiles function enumerates the different output color profiles that the system supports for a given device context.
     * @param {HDC} hdc Specifies the device context.
     * @param {Pointer<ICMENUMPROCW>} proc Specifies the procedure instance address of a callback function defined by the application. (See <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nc-wingdi-icmenumproca">EnumICMProfilesProcCallback</a>.)
     * @param {LPARAM} param2 
     * @returns {Integer} This function returns zero if the application interrupted the enumeration. The return value is -1 if there are no color profiles to enumerate. Otherwise, the return value is the last value returned by the callback function.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumicmprofilesw
     * @since windows5.0
     */
    static EnumICMProfilesW(hdc, proc, param2) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EnumICMProfilesW", "ptr", hdc, "ptr", proc, "ptr", param2, "int")
        return result
    }

    /**
     * The UpdateICMRegKey function manages color profiles and Color Management Modules in the system.
     * @param {PSTR} lpszCMID Points to a string that specifies the ICC profile identifier for the color management DLL to use with the profile.
     * @param {PSTR} lpszFileName Points to a fully qualified ICC color profile file name or to a <b>DEVMODE</b> structure.
     * @param {Integer} command 
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-updateicmregkeya
     * @since windows5.0
     */
    static UpdateICMRegKeyA(lpszCMID, lpszFileName, command) {
        static reserved := 0 ;Reserved parameters must always be NULL

        lpszCMID := lpszCMID is String ? StrPtr(lpszCMID) : lpszCMID
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("GDI32.dll\UpdateICMRegKeyA", "uint", reserved, "ptr", lpszCMID, "ptr", lpszFileName, "uint", command, "int")
        return result
    }

    /**
     * The UpdateICMRegKey function manages color profiles and Color Management Modules in the system.
     * @param {PWSTR} lpszCMID Points to a string that specifies the ICC profile identifier for the color management DLL to use with the profile.
     * @param {PWSTR} lpszFileName Points to a fully qualified ICC color profile file name or to a <b>DEVMODE</b> structure.
     * @param {Integer} command 
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-updateicmregkeyw
     * @since windows5.0
     */
    static UpdateICMRegKeyW(lpszCMID, lpszFileName, command) {
        static reserved := 0 ;Reserved parameters must always be NULL

        lpszCMID := lpszCMID is String ? StrPtr(lpszCMID) : lpszCMID
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := DllCall("GDI32.dll\UpdateICMRegKeyW", "uint", reserved, "ptr", lpszCMID, "ptr", lpszFileName, "uint", command, "int")
        return result
    }

    /**
     * The ColorCorrectPalette function corrects the entries of a palette using the WCS 1.0 parameters in the specified device context.
     * @param {HDC} hdc Specifies a device context whose WCS parameters to use.
     * @param {HPALETTE} hPal Specifies the handle to the palette to be color corrected.
     * @param {Integer} deFirst Specifies the first entry in the palette to be color corrected.
     * @param {Integer} num Specifies the number of entries to color correct.
     * @returns {BOOL} If this function succeeds, the return value is <b>TRUE</b>.
     * 
     * If this function fails, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-colorcorrectpalette
     * @since windows5.0
     */
    static ColorCorrectPalette(hdc, hPal, deFirst, num) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hPal := hPal is Win32Handle ? NumGet(hPal, "ptr") : hPal

        result := DllCall("GDI32.dll\ColorCorrectPalette", "ptr", hdc, "ptr", hPal, "uint", deFirst, "uint", num, "int")
        return result
    }

    /**
     * Creates a handle to a specified color profile. The handle can then be used in other profile management functions.
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
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-opencolorprofilea
     */
    static OpenColorProfileA(pProfile, dwDesiredAccess, dwShareMode, dwCreationMode) {
        result := DllCall("mscms.dll\OpenColorProfileA", "ptr", pProfile, "uint", dwDesiredAccess, "uint", dwShareMode, "uint", dwCreationMode, "ptr")
        return result
    }

    /**
     * Creates a handle to a specified color profile. The handle can then be used in other profile management functions.
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
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-opencolorprofilew
     */
    static OpenColorProfileW(pProfile, dwDesiredAccess, dwShareMode, dwCreationMode) {
        result := DllCall("mscms.dll\OpenColorProfileW", "ptr", pProfile, "uint", dwDesiredAccess, "uint", dwShareMode, "uint", dwCreationMode, "ptr")
        return result
    }

    /**
     * Closes an open profile handle.
     * @param {Pointer} hProfile Handle to the profile to be closed. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-closecolorprofile
     */
    static CloseColorProfile(hProfile) {
        result := DllCall("mscms.dll\CloseColorProfile", "ptr", hProfile, "int")
        return result
    }

    /**
     * Given a handle to an open color profile, the **GetColorProfileFromHandle** function copies the contents of the profile into a buffer supplied by the application. If the handle is a Windows Color System (WCS) handle, then the DMP is returned and the CAMP and GMMP associated with the HPROFILE are ignored.
     * @param {Pointer} hProfile Handle to an open color profile. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Pointer} pProfile Pointer to buffer to receive raw ICC or DMP profile data. Can be **NULL**. If it is, the size required for the buffer will be stored in the memory location pointed to by *pcbSize*. The buffer can be allocated to the appropriate size, and this function called again with *pBuffer* containing the address of the buffer.
     * @param {Pointer<UInt32>} pcbProfile Pointer to a **DWORD** that holds the size of buffer pointed at by *pBuffer*. On return it is filled with size of buffer that was actually used if the function succeeds. If this function is called with *pBuffer* set to **NULL**, this parameter will contain the size of the buffer required.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**. It returns **FALSE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcolorprofilefromhandle
     */
    static GetColorProfileFromHandle(hProfile, pProfile, pcbProfile) {
        result := DllCall("mscms.dll\GetColorProfileFromHandle", "ptr", hProfile, "ptr", pProfile, "uint*", pcbProfile, "int")
        return result
    }

    /**
     * Allows you to determine whether the specified profile is a valid International Color Consortium (ICC) profile, or a valid Windows Color System (WCS) profile handle that can be used for color management.
     * @param {Pointer} hProfile Specifies a handle to the profile to be validated. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Pointer<BOOL>} pbValid Pointer to a variable that is set to **TRUE** on return if the operation succeeds and the profile is a valid ICC or WCS profile. If the operation fails or the profile is not valid the variable is **FALSE**.
     * @returns {BOOL} If this function succeeds and the profile is valid, the return value is **TRUE**.
     * 
     * If this function fails (or succeeds and the profile is not valid), the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-iscolorprofilevalid
     */
    static IsColorProfileValid(hProfile, pbValid) {
        result := DllCall("mscms.dll\IsColorProfileValid", "ptr", hProfile, "ptr", pbValid, "int")
        return result
    }

    /**
     * Converts a logical [color space](/windows/win32/wcs/c) to a [device profile](/windows/win32/wcs/d).
     * @param {Pointer<LOGCOLORSPACEA>} pLogColorSpace A pointer to a logical color space structure. See [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) for details. The **lcsFilename** \[0\] member of the structure must be set to the **null** character ('\\0') or this function call will fail with the return value of INVALID\_PARAMETER.
     * @param {Pointer<Byte>} pProfile A pointer to a pointer to a buffer where the device profile will be created. This function allocates the buffer and fills it with profile information if it is successful. If not, the pointer is set to **NULL**. The caller is responsible for freeing this buffer when it is no longer needed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * 
     * If the **lcsFilename** \[0\] member if the [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) structure pointed to by *pLogColorSpace* is not '\\0', this function returns INVALID\_PARAMETER.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-createprofilefromlogcolorspacea
     */
    static CreateProfileFromLogColorSpaceA(pLogColorSpace, pProfile) {
        result := DllCall("mscms.dll\CreateProfileFromLogColorSpaceA", "ptr", pLogColorSpace, "char*", pProfile, "int")
        return result
    }

    /**
     * Converts a logical [color space](/windows/win32/wcs/c) to a [device profile](/windows/win32/wcs/d).
     * @param {Pointer<LOGCOLORSPACEW>} pLogColorSpace A pointer to a logical color space structure. See [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) for details. The **lcsFilename** \[0\] member of the structure must be set to the **null** character ('\\0') or this function call will fail with the return value of INVALID\_PARAMETER.
     * @param {Pointer<Byte>} pProfile A pointer to a pointer to a buffer where the device profile will be created. This function allocates the buffer and fills it with profile information if it is successful. If not, the pointer is set to **NULL**. The caller is responsible for freeing this buffer when it is no longer needed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * 
     * If the **lcsFilename** \[0\] member if the [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-logcolorspacea) structure pointed to by *pLogColorSpace* is not '\\0', this function returns INVALID\_PARAMETER.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-createprofilefromlogcolorspacew
     */
    static CreateProfileFromLogColorSpaceW(pLogColorSpace, pProfile) {
        result := DllCall("mscms.dll\CreateProfileFromLogColorSpaceW", "ptr", pLogColorSpace, "char*", pProfile, "int")
        return result
    }

    /**
     * Retrieves the number of tagged elements in a given color profile.
     * @param {Pointer} hProfile Specifies a handle to the profile in question.
     * @param {Pointer<UInt32>} pnElementCount Pointer to a variable in which to place the number of tagged elements in the profile.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcountcolorprofileelements
     */
    static GetCountColorProfileElements(hProfile, pnElementCount) {
        result := DllCall("mscms.dll\GetCountColorProfileElements", "ptr", hProfile, "uint*", pnElementCount, "int")
        return result
    }

    /**
     * Retrieves or derives ICC header structure from either ICC color profile or WCS XML profile. Drivers and applications should assume returning **TRUE** only indicates that a properly structured header is returned. Each tag will still need to be validated independently using either legacy ICM2 APIs or XML schema APIs.
     * @param {Pointer} hProfile Specifies a handle to the color profile in question.
     * @param {Pointer<PROFILEHEADER>} pHeader Points to a variable in which the ICC header structure is to be placed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. This function will fail is an invalid ICC or WCS XML profile is referenced in the hProfile parameter. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcolorprofileheader
     */
    static GetColorProfileHeader(hProfile, pHeader) {
        result := DllCall("mscms.dll\GetColorProfileHeader", "ptr", hProfile, "ptr", pHeader, "int")
        return result
    }

    /**
     * Retrieves the tag name specified by *dwIndex* in the tag table of a given International Color Consortium (ICC) color profile, where *dwIndex* is a one-based index into that table.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} dwIndex Specifies the one-based index of the tag to retrieve.
     * @param {Pointer<UInt32>} pTag Pointer to a variable in which the tag name is to be placed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcolorprofileelementtag
     */
    static GetColorProfileElementTag(hProfile, dwIndex, pTag) {
        result := DllCall("mscms.dll\GetColorProfileElementTag", "ptr", hProfile, "uint", dwIndex, "uint*", pTag, "int")
        return result
    }

    /**
     * Reports whether a specified International Color Consortium (ICC) tag is present in the specified color profile.
     * @param {Pointer} hProfile Specifies a handle to the ICC profile in question.
     * @param {Integer} tag Specifies the ICC tag to check.
     * @param {Pointer<BOOL>} pbPresent Pointer to a variable that is set to **TRUE** on return if the specified ICC tag is present, or **FALSE** if not.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-iscolorprofiletagpresent
     */
    static IsColorProfileTagPresent(hProfile, tag, pbPresent) {
        result := DllCall("mscms.dll\IsColorProfileTagPresent", "ptr", hProfile, "uint", tag, "ptr", pbPresent, "int")
        return result
    }

    /**
     * Copies data from a specified tagged profile element of a specified color profile into a buffer.
     * @param {Pointer} hProfile Specifies a handle to the International Color Consortium (ICC) color profile in question.
     * @param {Integer} tag Identifies the tagged element from which to copy.
     * @param {Integer} dwOffset Specifies the offset from the first byte of the tagged element data at which to begin copying.
     * @param {Pointer<UInt32>} pcbElement Pointer to a variable specifying the number of bytes to copy. On return, the variable contains the number of bytes actually copied.
     * @param {Pointer} pElement Pointer to a buffer into which the tagged element data is to be copied. The buffer must contain at least as many bytes as are specified by the variable pointed to by *pcbSize*. If the *pBuffer* pointer is set to **NULL**, the size of the entire tagged element data in bytes is returned in the memory location pointed to by *pcbSize,* and *dwOffset* is ignored. In this case, the function will return **FALSE**.
     * @param {Pointer<BOOL>} pbReference Points to a Boolean value that is set to **TRUE** if more than one tag in the color profile refers to the same data as the specified tag refers to, or **FALSE** if not.
     * @returns {BOOL} If this function succeeds, the return value is nonzero.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcolorprofileelement
     */
    static GetColorProfileElement(hProfile, tag, dwOffset, pcbElement, pElement, pbReference) {
        result := DllCall("mscms.dll\GetColorProfileElement", "ptr", hProfile, "uint", tag, "uint", dwOffset, "uint*", pcbElement, "ptr", pElement, "ptr", pbReference, "int")
        return result
    }

    /**
     * Sets the header data in a specified ICC color profile.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Pointer<PROFILEHEADER>} pHeader Pointer to the profile header data to write to the specified profile.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setcolorprofileheader
     */
    static SetColorProfileHeader(hProfile, pHeader) {
        result := DllCall("mscms.dll\SetColorProfileHeader", "ptr", hProfile, "ptr", pHeader, "int")
        return result
    }

    /**
     * Sets the size of a tagged element in an ICC color profile.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} tagType Identifies the tagged element.
     * @param {Integer} pcbElement Specifies the size to set the tagged element to. If *cbSize* is zero, this function deletes the specified tagged element. If the tag is a reference, only the tag table entry is deleted, not the data.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setcolorprofileelementsize
     */
    static SetColorProfileElementSize(hProfile, tagType, pcbElement) {
        result := DllCall("mscms.dll\SetColorProfileElementSize", "ptr", hProfile, "uint", tagType, "uint", pcbElement, "int")
        return result
    }

    /**
     * Sets the element data for a tagged profile element in an ICC color profile.
     * @param {Pointer} hProfile Specifies a handle to the ICC profile in question.
     * @param {Integer} tag Identifies the tagged element.
     * @param {Integer} dwOffset Specifies the offset from the first byte of the tagged element data at which to start writing.
     * @param {Pointer<UInt32>} pcbElement Pointer to a variable containing the number of bytes of data to write. On return, it contains the number of bytes actually written.
     * @param {Pointer<Void>} pElement Pointer to a buffer containing the data to write to the tagged element in the color profile.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setcolorprofileelement
     */
    static SetColorProfileElement(hProfile, tag, dwOffset, pcbElement, pElement) {
        result := DllCall("mscms.dll\SetColorProfileElement", "ptr", hProfile, "uint", tag, "uint", dwOffset, "uint*", pcbElement, "ptr", pElement, "int")
        return result
    }

    /**
     * Creates in a specified ICC color profile a new tag that references the same data as an existing tag.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} newTag Identifies the new tag to create.
     * @param {Integer} refTag Identifies the existing tag whose data is to be referenced by the new tag.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setcolorprofileelementreference
     */
    static SetColorProfileElementReference(hProfile, newTag, refTag) {
        result := DllCall("mscms.dll\SetColorProfileElementReference", "ptr", hProfile, "uint", newTag, "uint", refTag, "int")
        return result
    }

    /**
     * Retrieves the PostScript Level 2 [color space](/windows/win32/wcs/c) array from an ICC color profile.
     * @param {Pointer} hProfile Specifies a handle to the ICC profile from which to retrieve the PostScript Level 2 color space array.
     * @param {Integer} dwIntent 
     * @param {Integer} dwCSAType Specifies the type of color space array. See [Color Space Type Identifiers](/windows/win32/wcs/color-space-type-identifiers).
     * @param {Pointer} pPS2ColorSpaceArray Pointer to a buffer in which the color space array is to be placed. If the *pBuffer* pointer is set to **NULL**, the function returns the required size of the buffer in the memory location pointed to by *pcbSize*.
     * @param {Pointer<UInt32>} pcbPS2ColorSpaceArray Pointer to a variable containing the size of the buffer in bytes. On return, it contains the number of bytes copied into the buffer.
     * @param {Pointer<BOOL>} pbBinary Pointer to a Boolean variable. If set to **TRUE**, the data copied could be binary. If set to **FALSE**, data should be encoded as ASCII85. On return, the memory location pointed to by *pbBinary* indicates whether the data returned actually is binary (**TRUE**) or ASCII85 (**FALSE**).
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**. It also returns **TRUE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getps2colorspacearray
     */
    static GetPS2ColorSpaceArray(hProfile, dwIntent, dwCSAType, pPS2ColorSpaceArray, pcbPS2ColorSpaceArray, pbBinary) {
        result := DllCall("mscms.dll\GetPS2ColorSpaceArray", "ptr", hProfile, "uint", dwIntent, "uint", dwCSAType, "ptr", pPS2ColorSpaceArray, "uint*", pcbPS2ColorSpaceArray, "ptr", pbBinary, "int")
        return result
    }

    /**
     * Retrieves the PostScript Level 2 color [rendering intent](/windows/win32/wcs/r) from an ICC color profile.
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
     * @param {Pointer} pBuffer Points to a buffer in which the color rendering intent is to be placed. If the *pBuffer* pointer is set to **NULL**, the buffer size required is returned in *\*pcbSize*.
     * @param {Pointer<UInt32>} pcbPS2ColorRenderingIntent Points to a variable containing the buffer size in bytes. On return, this variable contains the number of bytes actually copied.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**. If this function succeeds, the return value is **TRUE**. It also returns **TRUE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getps2colorrenderingintent
     */
    static GetPS2ColorRenderingIntent(hProfile, dwIntent, pBuffer, pcbPS2ColorRenderingIntent) {
        result := DllCall("mscms.dll\GetPS2ColorRenderingIntent", "ptr", hProfile, "uint", dwIntent, "ptr", pBuffer, "uint*", pcbPS2ColorRenderingIntent, "int")
        return result
    }

    /**
     * Retrieves the PostScript Level 2 color rendering dictionary from the specified ICC color profile.
     * @param {Pointer} hProfile Specifies a handle to the ICC color profile in question.
     * @param {Integer} dwIntent Specifies the desired rendering intent for the color rendering dictionary. Valid values are:
     * 
     * * INTENT\_PERCEPTUAL
     * * INTENT\_SATURATION
     * * INTENT\_RELATIVE\_COLORIMETRIC
     * * INTENT\_ABSOLUTE\_COLORIMETRIC
     * 
     * For more information, see [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @param {Pointer} pPS2ColorRenderingDictionary Pointer to a buffer in which the color rendering dictionary is to be placed. If the *pBuffer* pointer is set to **NULL**, the required buffer size is returned in *\*pcbSize*.
     * @param {Pointer<UInt32>} pcbPS2ColorRenderingDictionary Pointer to a variable containing the size of the buffer in bytes. On return, the variable contains the number of bytes actually copied.
     * @param {Pointer<BOOL>} pbBinary Pointer to a Boolean variable. If **TRUE**, the color rendering dictionary could be copied in binary form. If **FALSE**, the dictionary will be encoded in ASCII85 form. On return, this Boolean variable indicates whether the dictionary was actually binary (**TRUE**) or ASCII85 (**FALSE**).
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**. It also returns **TRUE** if the *pBuffer* parameter is **NULL** and the size required for the buffer is copied into *pcbSize.*
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getps2colorrenderingdictionary
     */
    static GetPS2ColorRenderingDictionary(hProfile, dwIntent, pPS2ColorRenderingDictionary, pcbPS2ColorRenderingDictionary, pbBinary) {
        result := DllCall("mscms.dll\GetPS2ColorRenderingDictionary", "ptr", hProfile, "uint", dwIntent, "ptr", pPS2ColorRenderingDictionary, "uint*", pcbPS2ColorRenderingDictionary, "ptr", pbBinary, "int")
        return result
    }

    /**
     * Retrieves information about the International Color Consortium (ICC) named color profile that is specified in the first parameter.
     * @param {Pointer} hProfile The handle to the ICC profile from which the information will be retrieved.
     * @param {Pointer<NAMED_PROFILE_INFO>} pNamedProfileInfo A pointer to a **NAMED\_PROFILE\_INFO** structure.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getnamedprofileinfo
     */
    static GetNamedProfileInfo(hProfile, pNamedProfileInfo) {
        result := DllCall("mscms.dll\GetNamedProfileInfo", "ptr", hProfile, "ptr", pNamedProfileInfo, "int")
        return result
    }

    /**
     * Converts color names in a named color space to index numbers in an International Color Consortium (ICC) color profile.
     * @param {Pointer} hProfile The handle to an ICC named color profile.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of **DWORDS** that this function fills with the indices. The indices begin with one, not zero.
     * @param {Integer} dwCount The number of color names to convert.
     * @returns {BOOL} If this function succeeds with the conversion, the return value is **TRUE**.
     * 
     * If the conversion function fails, the return value is **FALSE**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-convertcolornametoindex
     */
    static ConvertColorNameToIndex(hProfile, paColorName, paIndex, dwCount) {
        result := DllCall("mscms.dll\ConvertColorNameToIndex", "ptr", hProfile, "char*", paColorName, "uint*", paIndex, "uint", dwCount, "int")
        return result
    }

    /**
     * Transforms indices in a color space to an array of names in a named color space.
     * @param {Pointer} hProfile The handle to an International Color Consortium (ICC) color space profile.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of color-space index numbers. The indices begin with one, not zero.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Integer} dwCount The number of indices to convert.
     * @returns {BOOL} If this conversion function succeeds, the return value is **TRUE**.
     * 
     * If this conversion function fails, the return value is **FALSE**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-convertindextocolorname
     */
    static ConvertIndexToColorName(hProfile, paIndex, paColorName, dwCount) {
        result := DllCall("mscms.dll\ConvertIndexToColorName", "ptr", hProfile, "uint*", paIndex, "char*", paColorName, "uint", dwCount, "int")
        return result
    }

    /**
     * Creates an International Color Consortium (ICC) *device link profile* from a set of color profiles, using the specified intents.
     * @param {Pointer<IntPtr>} hProfile Pointer to an array of handles of the color profiles to be used. The function determines whether the HPROFILEs contain ICC profile information and, if so, it processes them appropriately.
     * @param {Integer} nProfiles Specifies the number of profiles in the array pointed to by *hProfile*.
     * @param {Pointer<UInt32>} padwIntent Pointer to an array of **DWORDS** containing the intents to be used. See [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @param {Integer} nIntents The number of intents in the array pointed to by *padwIntent*.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @param {Pointer<Byte>} pProfileData Pointer to a pointer to a buffer. If successful, this function allocates the buffer, places its address in *\*pProfileData*, and fills it with a device link profile. If the function succeeds, the calling application must free the buffer after it is no longer needed.
     * @param {Integer} indexPreferredCMM Specifies the one-based index of the color profile that indicates what color management module (CMM) to use. The application developer may allow Windows to choose the CMM by setting this parameter to INDEX\_DONT\_CARE. See [Using Color Management Modules (CMM)](/windows/win32/wcs/using-color-management-modules--cmm).
     * @returns {BOOL} If this function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero. For extended error information, call GetLastError.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-createdevicelinkprofile
     */
    static CreateDeviceLinkProfile(hProfile, nProfiles, padwIntent, nIntents, dwFlags, pProfileData, indexPreferredCMM) {
        result := DllCall("mscms.dll\CreateDeviceLinkProfile", "ptr*", hProfile, "uint", nProfiles, "uint*", padwIntent, "uint", nIntents, "uint", dwFlags, "char*", pProfileData, "uint", indexPreferredCMM, "int")
        return result
    }

    /**
     * Creates a color transform that applications can use to perform color management.
     * @param {Pointer<LOGCOLORSPACEA>} pLogColorSpace Pointer to the input [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-taglogcolorspacea).
     * @param {Pointer} hDestProfile Handle to the profile of the destination device. The function determines whether the HPROFILE contains International Color Consortium (ICC) or Windows Color System (WCS) profile information.
     * @param {Pointer} hTargetProfile Handle to the profile of the target device. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. See Remarks.
     * @returns {Pointer} If this function succeeds, the return value is a handle to the color transform.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-createcolortransforma
     */
    static CreateColorTransformA(pLogColorSpace, hDestProfile, hTargetProfile, dwFlags) {
        result := DllCall("mscms.dll\CreateColorTransformA", "ptr", pLogColorSpace, "ptr", hDestProfile, "ptr", hTargetProfile, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Creates a color transform that applications can use to perform color management.
     * @param {Pointer<LOGCOLORSPACEW>} pLogColorSpace Pointer to the input [**LOGCOLORSPACEA**](/windows/desktop/api/Wingdi/ns-wingdi-taglogcolorspacea).
     * @param {Pointer} hDestProfile Handle to the profile of the destination device. The function determines whether the HPROFILE contains International Color Consortium (ICC) or Windows Color System (WCS) profile information.
     * @param {Pointer} hTargetProfile Handle to the profile of the target device. The function determines whether the HPROFILE contains ICC or WCS profile information.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. See Remarks.
     * @returns {Pointer} If this function succeeds, the return value is a handle to the color transform.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-createcolortransformw
     */
    static CreateColorTransformW(pLogColorSpace, hDestProfile, hTargetProfile, dwFlags) {
        result := DllCall("mscms.dll\CreateColorTransformW", "ptr", pLogColorSpace, "ptr", hDestProfile, "ptr", hTargetProfile, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Accepts an array of profiles or a single [device link profile](/windows/win32/wcs/d) and creates a color transform that applications can use to perform color mapping.
     * @param {Pointer<IntPtr>} pahProfiles Pointer to an array of handles to the profiles to be used. The function determines whether the HPROFILEs contain International Color Consortium (ICC) or Windows Color System (WCS) profile information and processes them appropriately. When valid WCS profiles are returned by [**OpenColorProfileW**](/windows/win32/api/icm/nf-icm-opencolorprofilew) and [**WcsOpenColorProfileW**](/windows/win32/api/icm/nf-icm-wcsopencolorprofile), these profile handles contain the combination of DMP, CAMP, and GMMP profiles.
     * @param {Integer} nProfiles Specifies the number of profiles in the array. The maximum is 10.
     * @param {Pointer<UInt32>} padwIntent 
     * @param {Integer} nIntents Specifies the number of elements in the intents array: can either be 1 or the same value as *nProfiles*. For profile arrays that contain any WCS profiles, the first rendering intent is ignored and only *nProfiles* -1 elements are used for these profile arrays. The maximum number of *nIntents* is 10.
     * @param {Integer} dwFlags Specifies flags used to control creation of the transform. See Remarks.
     * @param {Integer} indexPreferredCMM Specifies the one-based index of the color profile that indicates what color management module (CMM) to use. The application developer may allow Windows to choose the CMM by setting this parameter to INDEX\_DONT\_CARE. See [Using Color Management Modules (CMM)](/windows/win32/wcs/using-color-management-modules--cmm) Third party CMMs are only available for ICC workflows. Profile arrays containing WCS profiles will ignore this flag. It is also ignored when only ICC profiles are used and when the WCS\_ALWAYS flag is used.
     * @returns {Pointer} If this function succeeds, the return value is a handle to the color transform.
     * 
     * If this function fails, the return value is **NULL**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-createmultiprofiletransform
     */
    static CreateMultiProfileTransform(pahProfiles, nProfiles, padwIntent, nIntents, dwFlags, indexPreferredCMM) {
        result := DllCall("mscms.dll\CreateMultiProfileTransform", "ptr*", pahProfiles, "uint", nProfiles, "uint*", padwIntent, "uint", nIntents, "uint", dwFlags, "uint", indexPreferredCMM, "ptr")
        return result
    }

    /**
     * Deletes a given color transform.
     * @param {Pointer} hxform Identifies the color transform to delete.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-deletecolortransform
     */
    static DeleteColorTransform(hxform) {
        result := DllCall("mscms.dll\DeleteColorTransform", "ptr", hxform, "int")
        return result
    }

    /**
     * Translates the colors of a bitmap having a defined format so as to produce another bitmap in a requested format.
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
     * @param {LPARAM} ulCallbackData Data passed back to the callback function, for example, to identify the translation that is reporting progress.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-translatebitmapbits
     */
    static TranslateBitmapBits(hColorTransform, pSrcBits, bmInput, dwWidth, dwHeight, dwInputStride, pDestBits, bmOutput, dwOutputStride, pfnCallBack, ulCallbackData) {
        result := DllCall("mscms.dll\TranslateBitmapBits", "ptr", hColorTransform, "ptr", pSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwInputStride, "ptr", pDestBits, "int", bmOutput, "uint", dwOutputStride, "ptr", pfnCallBack, "ptr", ulCallbackData, "int")
        return result
    }

    /**
     * Checks whether the pixels in a specified bitmap lie within the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @param {Pointer} hColorTransform Handle to the color transform to use.
     * @param {Pointer<Void>} pSrcBits Pointer to the bitmap to check against the output gamut.
     * @param {Integer} bmInput Specifies the format of the bitmap. Must be set to one of the values of the [**BMFORMAT**](/windows/win32/api/icm/ne-icm-bmformat) enumerated type.
     * @param {Integer} dwWidth Specifies the number of pixels per scan line of the bitmap.
     * @param {Integer} dwHeight Specifies the number of scan lines of the bitmap.
     * @param {Integer} dwStride Specifies the number of bytes from the beginning one scan line to the beginning of the next one. If set to zero, the bitmap scan lines are assumed to be padded so as to be **DWORD**-aligned.
     * @param {Pointer<Byte>} paResult Pointer to an array of bytes where the test results are to be placed. This results buffer must contain at least as many bytes as there are pixels in the bitmap.
     * @param {Pointer<LPBMCALLBACKFN>} pfnCallback Pointer to a callback function called periodically by **CheckBitmapBits** to report progress and allow the calling process to cancel the bitmap test. (See [**ICMProgressProcCallback**](/windows/win32/wcs/icmprogressproccallback)).
     * @param {LPARAM} lpCallbackData Data passed back to the callback function, for example, to identify the bitmap test about which progress is being reported.
     * @returns {BOOL} If this function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-checkbitmapbits
     */
    static CheckBitmapBits(hColorTransform, pSrcBits, bmInput, dwWidth, dwHeight, dwStride, paResult, pfnCallback, lpCallbackData) {
        result := DllCall("mscms.dll\CheckBitmapBits", "ptr", hColorTransform, "ptr", pSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwStride, "char*", paResult, "ptr", pfnCallback, "ptr", lpCallbackData, "int")
        return result
    }

    /**
     * Translates an array of colors from the source [color space](/windows/win32/wcs/c) to the destination color space as defined by a color transform.
     * @param {Pointer} hColorTransform Identifies the color transform to use.
     * @param {Pointer<COLOR>} paInputColors Pointer to an array of *nColors*[**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to translate.
     * @param {Integer} nColors Contains the number of elements in the arrays pointed to by *paInputColors* and *paOutputColors*.
     * @param {Integer} ctInput Specifies the input color type.
     * @param {Pointer<COLOR>} paOutputColors Pointer to an array of *nColors* **COLOR** structures that receive the translated colors.
     * @param {Integer} ctOutput Specifies the output color type.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-translatecolors
     */
    static TranslateColors(hColorTransform, paInputColors, nColors, ctInput, paOutputColors, ctOutput) {
        result := DllCall("mscms.dll\TranslateColors", "ptr", hColorTransform, "ptr", paInputColors, "uint", nColors, "int", ctInput, "ptr", paOutputColors, "int", ctOutput, "int")
        return result
    }

    /**
     * Determines whether the colors in an array lie within the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @param {Pointer} hColorTransform Handle to the color transform to use.
     * @param {Pointer<COLOR>} paInputColors Pointer to an array of *nColors* [**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to translate.
     * @param {Integer} nColors Contains the number of elements in the arrays pointed to by *paInputColors* and *paResult*.
     * @param {Integer} ctInput Specifies the input color type.
     * @param {Pointer<Byte>} paResult Pointer to an array of *nColors* bytes that receives the results of the test.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-checkcolors
     */
    static CheckColors(hColorTransform, paInputColors, nColors, ctInput, paResult) {
        result := DllCall("mscms.dll\CheckColors", "ptr", hColorTransform, "ptr", paInputColors, "uint", nColors, "int", ctInput, "char*", paResult, "int")
        return result
    }

    /**
     * Retrieves various information about the color management module (CMM) that created the specified color transform.
     * @param {Pointer} hColorTransform Identifies the transform for which to find CMM information.
     * @param {Integer} param1 
     * @returns {Integer} If this function succeeds, the return value is the information specified in *dwInfo.*
     * 
     * If this function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcmminfo
     */
    static GetCMMInfo(hColorTransform, param1) {
        result := DllCall("mscms.dll\GetCMMInfo", "ptr", hColorTransform, "uint", param1, "uint")
        return result
    }

    /**
     * Associates a specified identification value with the specified color management module dynamic link library (CMM DLL). When this ID appears in a color profile, Windows can then locate the corresponding CMM so as to create a transform.
     * @param {PSTR} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the machine on which a CMM DLL should be registered. A **NULL** pointer indicates the local machine.
     * @param {Integer} cmmID Specifies the ID signature of the CMM registered with the International Color Consortium (ICC).
     * @param {PSTR} pCMMdll Pointer to the fully qualified path name of the CMM DLL.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-registercmma
     */
    static RegisterCMMA(pMachineName, cmmID, pCMMdll) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pCMMdll := pCMMdll is String ? StrPtr(pCMMdll) : pCMMdll

        result := DllCall("mscms.dll\RegisterCMMA", "ptr", pMachineName, "uint", cmmID, "ptr", pCMMdll, "int")
        return result
    }

    /**
     * Associates a specified identification value with the specified color management module dynamic link library (CMM DLL). When this ID appears in a color profile, Windows can then locate the corresponding CMM so as to create a transform.
     * @param {PWSTR} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the machine on which a CMM DLL should be registered. A **NULL** pointer indicates the local machine.
     * @param {Integer} cmmID Specifies the ID signature of the CMM registered with the International Color Consortium (ICC).
     * @param {PWSTR} pCMMdll Pointer to the fully qualified path name of the CMM DLL.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-registercmmw
     */
    static RegisterCMMW(pMachineName, cmmID, pCMMdll) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pCMMdll := pCMMdll is String ? StrPtr(pCMMdll) : pCMMdll

        result := DllCall("mscms.dll\RegisterCMMW", "ptr", pMachineName, "uint", cmmID, "ptr", pCMMdll, "int")
        return result
    }

    /**
     * Dissociates a specified ID value from a given color management module dynamic-link library (CMM DLL).
     * @param {PSTR} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the computer on which a CMM DLLs registration should be removed. A **NULL** pointer indicates the local computer.
     * @param {Integer} cmmID Specifies the ID value identifying the CMM whose registration is to be removed. This is the signature of the CMM registered with the International Color Consortium (ICC).
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-unregistercmma
     */
    static UnregisterCMMA(pMachineName, cmmID) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\UnregisterCMMA", "ptr", pMachineName, "uint", cmmID, "int")
        return result
    }

    /**
     * Dissociates a specified ID value from a given color management module dynamic-link library (CMM DLL).
     * @param {PWSTR} pMachineName Reserved; must currently be set to **NULL**, until non-local registration is supported. This parameter is intended to point to the name of the computer on which a CMM DLLs registration should be removed. A **NULL** pointer indicates the local computer.
     * @param {Integer} cmmID Specifies the ID value identifying the CMM whose registration is to be removed. This is the signature of the CMM registered with the International Color Consortium (ICC).
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-unregistercmmw
     */
    static UnregisterCMMW(pMachineName, cmmID) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\UnregisterCMMW", "ptr", pMachineName, "uint", cmmID, "int")
        return result
    }

    /**
     * Allows you to select the preferred color management module (CMM) to use.
     * @param {Integer} dwCMMType Specifies the signature of the desired CMM as registered with the International Color Consortium (ICC).
     * 
     * **Windows 2000 only:** Setting this parameter to **NULL** causes the WCS system to select the default CMM.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-selectcmm
     */
    static SelectCMM(dwCMMType) {
        result := DllCall("mscms.dll\SelectCMM", "uint", dwCMMType, "int")
        return result
    }

    /**
     * Retrieves the path of the Windows COLOR directory on a specified machine.
     * @param {PSTR} pMachineName Reserved; must be **NULL**. This parameter is intended to point to the name of the machine on which the profile is to be installed. A **NULL** pointer indicates the local machine.
     * @param {Pointer} pBuffer Points to the buffer in which the color directory path is to be placed.
     * @param {Pointer<UInt32>} pdwSize Points to a variable containing the size in bytes of the buffer pointed to by *pBuffer*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcolordirectorya
     * @deprecated
     */
    static GetColorDirectoryA(pMachineName, pBuffer, pdwSize) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\GetColorDirectoryA", "ptr", pMachineName, "ptr", pBuffer, "uint*", pdwSize, "int")
        return result
    }

    /**
     * Retrieves the path of the Windows COLOR directory on a specified machine.
     * @param {PWSTR} pMachineName Reserved; must be **NULL**. This parameter is intended to point to the name of the machine on which the profile is to be installed. A **NULL** pointer indicates the local machine.
     * @param {Pointer} pBuffer Points to the buffer in which the color directory path is to be placed.
     * @param {Pointer<UInt32>} pdwSize Points to a variable containing the size in bytes of the buffer pointed to by *pBuffer*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getcolordirectoryw
     * @deprecated
     */
    static GetColorDirectoryW(pMachineName, pBuffer, pdwSize) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\GetColorDirectoryW", "ptr", pMachineName, "ptr", pBuffer, "uint*", pdwSize, "int")
        return result
    }

    /**
     * Installs a given profile for use on a specified machine. The profile is also copied to the COLOR directory.
     * @param {PSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which the profile is to be installed. A **NULL** pointer indicates the local computer.
     * @param {PSTR} pProfileName Pointer to the fully qualified path name of the profile to install.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-installcolorprofilea
     */
    static InstallColorProfileA(pMachineName, pProfileName) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\InstallColorProfileA", "ptr", pMachineName, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Installs a given profile for use on a specified machine. The profile is also copied to the COLOR directory.
     * @param {PWSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which the profile is to be installed. A **NULL** pointer indicates the local computer.
     * @param {PWSTR} pProfileName Pointer to the fully qualified path name of the profile to install.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-installcolorprofilew
     */
    static InstallColorProfileW(pMachineName, pProfileName) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\InstallColorProfileW", "ptr", pMachineName, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Removes a specified color profile from a specified computer. Associated files are optionally deleted from the system.
     * @param {PSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine from which to uninstall the specified profile. A **NULL** pointer indicates the local machine.
     * @param {PSTR} pProfileName Points to the file name of the profile to uninstall.
     * @param {BOOL} bDelete If set to **TRUE**, the function deletes the profile from the COLOR directory. If set to **FALSE**, this function has no effect.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-uninstallcolorprofilea
     */
    static UninstallColorProfileA(pMachineName, pProfileName, bDelete) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\UninstallColorProfileA", "ptr", pMachineName, "ptr", pProfileName, "int", bDelete, "int")
        return result
    }

    /**
     * Removes a specified color profile from a specified computer. Associated files are optionally deleted from the system.
     * @param {PWSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine from which to uninstall the specified profile. A **NULL** pointer indicates the local machine.
     * @param {PWSTR} pProfileName Points to the file name of the profile to uninstall.
     * @param {BOOL} bDelete If set to **TRUE**, the function deletes the profile from the COLOR directory. If set to **FALSE**, this function has no effect.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-uninstallcolorprofilew
     */
    static UninstallColorProfileW(pMachineName, pProfileName, bDelete) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\UninstallColorProfileW", "ptr", pMachineName, "ptr", pProfileName, "int", bDelete, "int")
        return result
    }

    /**
     * Enumerates all the profiles satisfying the given enumeration criteria.
     * @param {PSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to enumerate profiles. A **NULL** pointer indicates the local computer.
     * @param {Pointer<ENUMTYPEA>} pEnumRecord Pointer to a structure specifying the enumeration criteria.
     * @param {Pointer} pEnumerationBuffer Pointer to a buffer in which the profiles are to be enumerated. A MULTI\_SZ string of profile names satisfying the criteria specified in *\*pEnumRecord* will be placed in this buffer.
     * @param {Pointer<UInt32>} pdwSizeOfEnumerationBuffer Pointer to a variable containing the size of the buffer pointed to by *pBuffer*. On return, *\*pdwSize* contains the size of buffer actually used or needed.
     * @param {Pointer<UInt32>} pnProfiles Pointer to a variable that will contain, on return, the number of profile names actually copied to the buffer.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-enumcolorprofilesa
     */
    static EnumColorProfilesA(pMachineName, pEnumRecord, pEnumerationBuffer, pdwSizeOfEnumerationBuffer, pnProfiles) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\EnumColorProfilesA", "ptr", pMachineName, "ptr", pEnumRecord, "ptr", pEnumerationBuffer, "uint*", pdwSizeOfEnumerationBuffer, "uint*", pnProfiles, "int")
        return result
    }

    /**
     * Enumerates all the profiles satisfying the given enumeration criteria.
     * @param {PWSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to enumerate profiles. A **NULL** pointer indicates the local computer.
     * @param {Pointer<ENUMTYPEW>} pEnumRecord Pointer to a structure specifying the enumeration criteria.
     * @param {Pointer} pEnumerationBuffer Pointer to a buffer in which the profiles are to be enumerated. A MULTI\_SZ string of profile names satisfying the criteria specified in *\*pEnumRecord* will be placed in this buffer.
     * @param {Pointer<UInt32>} pdwSizeOfEnumerationBuffer Pointer to a variable containing the size of the buffer pointed to by *pBuffer*. On return, *\*pdwSize* contains the size of buffer actually used or needed.
     * @param {Pointer<UInt32>} pnProfiles Pointer to a variable that will contain, on return, the number of profile names actually copied to the buffer.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-enumcolorprofilesw
     */
    static EnumColorProfilesW(pMachineName, pEnumRecord, pEnumerationBuffer, pdwSizeOfEnumerationBuffer, pnProfiles) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\EnumColorProfilesW", "ptr", pMachineName, "ptr", pEnumRecord, "ptr", pEnumerationBuffer, "uint*", pdwSizeOfEnumerationBuffer, "uint*", pnProfiles, "int")
        return result
    }

    /**
     * Registers a specified profile for a given standard [color space](/windows/win32/wcs/c). The profile can be queried using [GetStandardColorSpaceProfileW](/windows/win32/api/icm/nf-icm-getstandardcolorspaceprofilew).
     * @param {PSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to set a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwProfileID Specifies the ID value of the standard color space that the given profile represents. This is a custom ID value used to uniquely identify the color space profile within your application.
     * @param {PSTR} pProfilename Points to a fully qualified path to the profile file.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setstandardcolorspaceprofilea
     */
    static SetStandardColorSpaceProfileA(pMachineName, dwProfileID, pProfilename) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfilename := pProfilename is String ? StrPtr(pProfilename) : pProfilename

        result := DllCall("mscms.dll\SetStandardColorSpaceProfileA", "ptr", pMachineName, "uint", dwProfileID, "ptr", pProfilename, "int")
        return result
    }

    /**
     * Registers a specified profile for a given standard [color space](/windows/win32/wcs/c). The profile can be queried using [GetStandardColorSpaceProfileW](/windows/win32/api/icm/nf-icm-getstandardcolorspaceprofilew).
     * @param {PWSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to set a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwProfileID Specifies the ID value of the standard color space that the given profile represents. This is a custom ID value used to uniquely identify the color space profile within your application.
     * @param {PWSTR} pProfileName 
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setstandardcolorspaceprofilew
     */
    static SetStandardColorSpaceProfileW(pMachineName, dwProfileID, pProfileName) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\SetStandardColorSpaceProfileW", "ptr", pMachineName, "uint", dwProfileID, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Retrieves the color profile registered for the specified standard [color space](/windows/win32/wcs/c).
     * @param {PSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to get a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwSCS Specifies the ID value of the standard color space for which to retrieve the profile. The only valid values for this parameter are LCS\_sRGB and LCS\_WINDOWS\_COLOR\_SPACE.
     * @param {Pointer} pBuffer Pointer to the buffer in which the name of the profile is to be placed. If **NULL**, the call will return **TRUE** and the required size of the buffer is placed in *pdwSize.*
     * @param {Pointer<UInt32>} pcbSize Pointer to a variable containing the size in bytes of the buffer pointed to by *pProfileName*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getstandardcolorspaceprofilea
     */
    static GetStandardColorSpaceProfileA(pMachineName, dwSCS, pBuffer, pcbSize) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\GetStandardColorSpaceProfileA", "ptr", pMachineName, "uint", dwSCS, "ptr", pBuffer, "uint*", pcbSize, "int")
        return result
    }

    /**
     * Retrieves the color profile registered for the specified standard [color space](/windows/win32/wcs/c).
     * @param {PWSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to get a standard color space profile. A **NULL** pointer indicates the local machine.
     * @param {Integer} dwSCS Specifies the ID value of the standard color space for which to retrieve the profile. The only valid values for this parameter are LCS\_sRGB and LCS\_WINDOWS\_COLOR\_SPACE.
     * @param {Pointer} pBuffer Pointer to the buffer in which the name of the profile is to be placed. If **NULL**, the call will return **TRUE** and the required size of the buffer is placed in *pdwSize.*
     * @param {Pointer<UInt32>} pcbSize Pointer to a variable containing the size in bytes of the buffer pointed to by *pProfileName*. On return, the variable contains the size of the buffer actually used or needed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-getstandardcolorspaceprofilew
     */
    static GetStandardColorSpaceProfileW(pMachineName, dwSCS, pBuffer, pcbSize) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName

        result := DllCall("mscms.dll\GetStandardColorSpaceProfileW", "ptr", pMachineName, "uint", dwSCS, "ptr", pBuffer, "uint*", pcbSize, "int")
        return result
    }

    /**
     * Associates a specified color profile with a specified device.
     * @param {PSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to associate the specified profile and device. A **NULL** pointer indicates the local machine.
     * @param {PSTR} pProfileName Points to the file name of the profile to associate.
     * @param {PSTR} pDeviceName Points to the name of the device to associate.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-associatecolorprofilewithdevicea
     */
    static AssociateColorProfileWithDeviceA(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\AssociateColorProfileWithDeviceA", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Associates a specified color profile with a specified device.
     * @param {PWSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the machine on which to associate the specified profile and device. A **NULL** pointer indicates the local machine.
     * @param {PWSTR} pProfileName Points to the file name of the profile to associate.
     * @param {PWSTR} pDeviceName Points to the name of the device to associate.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-associatecolorprofilewithdevicew
     */
    static AssociateColorProfileWithDeviceW(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\AssociateColorProfileWithDeviceW", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Disassociates a specified color profile with a specified device on a specified computer.
     * @param {PSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to disassociate the specified profile and device. A **NULL** pointer indicates the local computer.
     * @param {PSTR} pProfileName Pointer to the file name of the profile to disassociate.
     * @param {PSTR} pDeviceName Pointer to the name of the device to disassociate.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-disassociatecolorprofilefromdevicea
     */
    static DisassociateColorProfileFromDeviceA(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\DisassociateColorProfileFromDeviceA", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Disassociates a specified color profile with a specified device on a specified computer.
     * @param {PWSTR} pMachineName Reserved. Must be **NULL**. This parameter is intended to point to the name of the computer on which to disassociate the specified profile and device. A **NULL** pointer indicates the local computer.
     * @param {PWSTR} pProfileName Pointer to the file name of the profile to disassociate.
     * @param {PWSTR} pDeviceName Pointer to the name of the device to disassociate.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-disassociatecolorprofilefromdevicew
     */
    static DisassociateColorProfileFromDeviceW(pMachineName, pProfileName, pDeviceName) {
        pMachineName := pMachineName is String ? StrPtr(pMachineName) : pMachineName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\DisassociateColorProfileFromDeviceW", "ptr", pMachineName, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Creates a Color Management dialog box that lets the user choose whether to enable color management and, if so, provides control over the color profiles used and over the [rendering intent](/windows/win32/wcs/r).
     * @param {Pointer<COLORMATCHSETUPW>} pcms Pointer to a [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure that on entry contains information used to initialize the dialog box.
     * 
     * When **SetupColorMatching** returns, if the user clicked the OK button, this structure contains information about the user's selection. Otherwise, if an error occurred or the user canceled the dialog box, the structure is left unchanged.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE** indicating that no errors occurred and the user clicked the OK button.
     * 
     * If this function fails, the return value is **FALSE** indicating that an error occurred or the dialog was canceled. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setupcolormatchingw
     */
    static SetupColorMatchingW(pcms) {
        result := DllCall("ICMUI.dll\SetupColorMatchingW", "ptr", pcms, "int")
        return result
    }

    /**
     * Creates a Color Management dialog box that lets the user choose whether to enable color management and, if so, provides control over the color profiles used and over the [rendering intent](/windows/win32/wcs/r).
     * @param {Pointer<COLORMATCHSETUPA>} pcms Pointer to a [**COLORMATCHSETUPW**](/windows/win32/api/icm/ns-icm-colormatchsetupw) structure that on entry contains information used to initialize the dialog box.
     * 
     * When **SetupColorMatching** returns, if the user clicked the OK button, this structure contains information about the user's selection. Otherwise, if an error occurred or the user canceled the dialog box, the structure is left unchanged.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE** indicating that no errors occurred and the user clicked the OK button.
     * 
     * If this function fails, the return value is **FALSE** indicating that an error occurred or the dialog was canceled. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-setupcolormatchinga
     */
    static SetupColorMatchingA(pcms) {
        result := DllCall("ICMUI.dll\SetupColorMatchingA", "ptr", pcms, "int")
        return result
    }

    /**
     * 
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation, which could be system-wide or for the current user.
     * @param {PWSTR} pProfileName A pointer to the file name of the profile to associate.
     * @param {PWSTR} pDeviceName A pointer to the name of the device with which the profile is to be associated.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsassociatecolorprofilewithdevice
     */
    static WcsAssociateColorProfileWithDevice(scope, pProfileName, pDeviceName) {
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsAssociateColorProfileWithDevice", "int", scope, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Disassociates a specified WCS color profile from a specified device on a computer.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation, which could be system-wide or for the current user.
     * @param {PWSTR} pProfileName A pointer to the file name of the profile to disassociate.
     * @param {PWSTR} pDeviceName A pointer to the name of the device from which to disassociate the profile.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsdisassociatecolorprofilefromdevice
     */
    static WcsDisassociateColorProfileFromDevice(scope, pProfileName, pDeviceName) {
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsDisassociateColorProfileFromDevice", "int", scope, "ptr", pProfileName, "ptr", pDeviceName, "int")
        return result
    }

    /**
     * Returns the size, in bytes, of the buffer that is required by the [**WcsEnumColorProfiles**](/windows/win32/api/icm/nf-icm-wcsenumcolorprofiles) function to enumerate color profiles.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of the profile management operation that is performed by this function.
     * @param {Pointer<ENUMTYPEW>} pEnumRecord A pointer to a structure that specifies the enumeration criteria.
     * @param {Pointer<UInt32>} pdwSize A pointer to a variable that receives the size of the buffer that is required to receive all enumerated profile names. This value is used by the *dwSize* parameter of the [**WcsEnumColorProfiles**](/windows/win32/api/icm/nf-icm-wcsenumcolorprofiles) function.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsenumcolorprofilessize
     */
    static WcsEnumColorProfilesSize(scope, pEnumRecord, pdwSize) {
        result := DllCall("mscms.dll\WcsEnumColorProfilesSize", "int", scope, "ptr", pEnumRecord, "uint*", pdwSize, "int")
        return result
    }

    /**
     * Enumerates all color profiles that satisfy the enumeration criteria in the specified profile management scope.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value specifying the scope of this profile management operation.
     * @param {Pointer<ENUMTYPEW>} pEnumRecord A pointer to a structure specifying the enumeration criteria.
     * @param {Pointer} pBuffer A pointer to a buffer in which the profile names are to be enumerated. The **WcsEnumColorProfiles** function places, in this buffer, a MULTI\_SZ string that consists of profile names that satisfy the criteria specified in *\*pEnumRecord*.
     * @param {Integer} dwSize A variable that contains the size, in bytes, of the buffer that is pointed to by *pBuffer*. See **Remarks**.
     * @param {Pointer<UInt32>} pnProfiles An optional pointer to a variable that receives the number of profile names that are copied to the buffer to which *pBuffer* points. Can be **NULL** if this information is not needed.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsenumcolorprofiles
     */
    static WcsEnumColorProfiles(scope, pEnumRecord, pBuffer, dwSize, pnProfiles) {
        result := DllCall("mscms.dll\WcsEnumColorProfiles", "int", scope, "ptr", pEnumRecord, "ptr", pBuffer, "uint", dwSize, "uint*", pnProfiles, "int")
        return result
    }

    /**
     * Returns the size, in bytes, of the default color profile name (including the **NULL** terminator), for a device.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation.
     * @param {PWSTR} pDeviceName A pointer to the name of the device for which the default color profile is to be obtained. If **NULL**, a device-independent default profile will be used.
     * @param {Integer} cptColorProfileType A [**COLORPROFILETYPE**](/windows/win32/api/icm/ne-icm-colorprofiletype) value specifying the color profile type.
     * @param {Integer} cpstColorProfileSubType A [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) value specifying the color profile subtype.
     * @param {Integer} dwProfileID The ID of the color space that the color profile represents.
     * @param {Pointer<UInt32>} pcbProfileName A pointer to a location that receives the size, in bytes, of the path name of the default color profile, including the **NULL** terminator.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsgetdefaultcolorprofilesize
     */
    static WcsGetDefaultColorProfileSize(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, pcbProfileName) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsGetDefaultColorProfileSize", "int", scope, "ptr", pDeviceName, "int", cptColorProfileType, "int", cpstColorProfileSubType, "uint", dwProfileID, "uint*", pcbProfileName, "int")
        return result
    }

    /**
     * Retrieves the default color profile for a device, or for a device-independent default if the device is not specified.
     * @param {Integer} scope A [**WCS_PROFILE_MANAGEMENT_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value specifying the scope of this profile management operation.
     * @param {PWSTR} pDeviceName A pointer to the name of the device for which the default color profile is obtained. If **NULL**, a device-independent default profile is obtained.
     * @param {Integer} cptColorProfileType A [**COLORPROFILETYPE**](/windows/win32/api/icm/ne-icm-colorprofiletype) value specifying the color profile type.
     * @param {Integer} cpstColorProfileSubType A [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) value specifying the color profile subtype.
     * @param {Integer} dwProfileID The ID of the color space that the color profile represents.
     * @param {Integer} cbProfileName The buffer size, in bytes, of the buffer that is pointed to by *pProfileName*.
     * @param {Pointer} pProfileName A pointer to a buffer to receive the name of the color profile. The size of the buffer, in bytes, will be the indicated by *cbProfileName*.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsgetdefaultcolorprofile
     */
    static WcsGetDefaultColorProfile(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, cbProfileName, pProfileName) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsGetDefaultColorProfile", "int", scope, "ptr", pDeviceName, "int", cptColorProfileType, "int", cpstColorProfileSubType, "uint", dwProfileID, "uint", cbProfileName, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Sets the default color profile name for the specified profile type in the specified profile management scope.
     * @param {Integer} scope A [**WCS\_PROFILE\_MANAGEMENT\_SCOPE**](/windows/win32/api/icm/ne-icm-wcs_profile_management_scope) value that specifies the scope of this profile management operation.
     * @param {PWSTR} pDeviceName A pointer to the name of the device for which the default color profile is to be set. If **NULL**, a device-independent default profile is used.
     * @param {Integer} cptColorProfileType A [**COLORPROFILETYPE**](/windows/win32/api/icm/ne-icm-colorprofiletype) value that specifies the color profile type.
     * @param {Integer} cpstColorProfileSubType A [**COLORPROFILESUBTYPE**](/windows/win32/api/icm/ne-icm-colorprofilesubtype) value that specifies the color profile subtype.
     * @param {Integer} dwProfileID The ID of the color space that the color profile represents. This is a custom ID value used to uniquely identify the color space profile within your application.
     * @param {PWSTR} pProfileName A pointer to a buffer that holds the name of the color profile. See Remarks.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror).
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcssetdefaultcolorprofile
     */
    static WcsSetDefaultColorProfile(scope, pDeviceName, cptColorProfileType, cpstColorProfileSubType, dwProfileID, pProfileName) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName
        pProfileName := pProfileName is String ? StrPtr(pProfileName) : pProfileName

        result := DllCall("mscms.dll\WcsSetDefaultColorProfile", "int", scope, "ptr", pDeviceName, "int", cptColorProfileType, "int", cpstColorProfileSubType, "uint", dwProfileID, "ptr", pProfileName, "int")
        return result
    }

    /**
     * Sets the default rendering intent in the specified profile management scope.
     * @param {Integer} scope The profile management scope for this operation, which can be system-wide or the current user only.
     * @param {Integer} dwRenderingIntent 
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcssetdefaultrenderingintent
     */
    static WcsSetDefaultRenderingIntent(scope, dwRenderingIntent) {
        result := DllCall("mscms.dll\WcsSetDefaultRenderingIntent", "int", scope, "uint", dwRenderingIntent, "int")
        return result
    }

    /**
     * Retrieves the default rendering intent in the specified profile management scope.
     * @param {Integer} scope The profile management scope for this operation, which can be system-wide or the current user only.
     * @param {Pointer<UInt32>} pdwRenderingIntent A pointer to the variable that will hold the rendering intent.
     * 
     * For more information, see [Rendering intents](/windows/win32/wcs/rendering-intents).
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsgetdefaultrenderingintent
     */
    static WcsGetDefaultRenderingIntent(scope, pdwRenderingIntent) {
        result := DllCall("mscms.dll\WcsGetDefaultRenderingIntent", "int", scope, "uint*", pdwRenderingIntent, "int")
        return result
    }

    /**
     * Determines whether the user chose to use a per-user profile association list for the specified device.
     * @param {PWSTR} pDeviceName A pointer to a string containing the user-friendly name of the device.
     * @param {Integer} dwDeviceClass 
     * @param {Pointer<BOOL>} pUsePerUserProfiles A pointer to a location to receive a Boolean value that is **TRUE** if the user chose to use a per-user profile association list for the specified device; otherwise **FALSE**.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsgetuseperuserprofiles
     */
    static WcsGetUsePerUserProfiles(pDeviceName, dwDeviceClass, pUsePerUserProfiles) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsGetUsePerUserProfiles", "ptr", pDeviceName, "uint", dwDeviceClass, "ptr", pUsePerUserProfiles, "int")
        return result
    }

    /**
     * Enables a user to specify whether or not to use a per-user profile association list for the specified device.
     * @param {PWSTR} pDeviceName A pointer to a string that contains the user-friendly name of the device.
     * @param {Integer} dwDeviceClass 
     * @param {BOOL} usePerUserProfiles A Boolean value that is **TRUE** if the user wants to use a per-user profile association list for the specified device; otherwise **FALSE**.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcssetuseperuserprofiles
     */
    static WcsSetUsePerUserProfiles(pDeviceName, dwDeviceClass, usePerUserProfiles) {
        pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

        result := DllCall("mscms.dll\WcsSetUsePerUserProfiles", "ptr", pDeviceName, "uint", dwDeviceClass, "int", usePerUserProfiles, "int")
        return result
    }

    /**
     * Translates an array of colors from the source color space to the destination color space as defined by a color transform.
     * @param {Pointer} hColorTransform A handle for the WCS color transform.
     * @param {Integer} nColors The number of elements in the array to which *pInputData* and *pOutputData* point.
     * @param {Integer} nInputChannels The number of channels per element in the array to which *pInputData* points.
     * @param {Integer} cdtInput The input [**COLORDATATYPE**](/windows/win32/api/icm/ne-icm-colordatatype) color data type.
     * @param {Integer} cbInput The buffer size, in bytes, of *pInputData*.
     * @param {Pointer} pInputData A pointer to an array of input colors. The size of the buffer for this array, in bytes, is the **DWORD** value of *cbInput*.
     * @param {Integer} nOutputChannels The number of channels per element in the array to which *pOutputData* points.
     * @param {Integer} cdtOutput The [**COLORDATATYPE**](/windows/win32/api/icm/ne-icm-colordatatype) output that specified the color data type.
     * @param {Integer} cbOutput The buffer size, in bytes, of *pOutputData*.
     * @param {Pointer} pOutputData A pointer to an array of colors that receives the results of the color translation.The size of the buffer for this array, in bytes, is the **DWORD** value of *cbOutput*.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcstranslatecolors
     */
    static WcsTranslateColors(hColorTransform, nColors, nInputChannels, cdtInput, cbInput, pInputData, nOutputChannels, cdtOutput, cbOutput, pOutputData) {
        result := DllCall("mscms.dll\WcsTranslateColors", "ptr", hColorTransform, "uint", nColors, "uint", nInputChannels, "int", cdtInput, "uint", cbInput, "ptr", pInputData, "uint", nOutputChannels, "int", cdtOutput, "uint", cbOutput, "ptr", pOutputData, "int")
        return result
    }

    /**
     * Determines whether the colors in an array are within the output gamut of a specified WCS color transform.
     * @param {Pointer} hColorTransform A handle to the specified WCS color transform.
     * @param {Integer} nColors The number of elements in the array pointed to by *pInputData* and *paResult*.
     * @param {Integer} nInputChannels The number of channels per element in the array pointed to by *pInputData*.
     * @param {Integer} cdtInput The input COLORDATATYPE color data type.
     * @param {Integer} cbInput The buffer size of *pInputData*.
     * @param {Pointer} pInputData A pointer to an array of input colors. Colors in this array correspond to the color space of the source profile. The size of the buffer for this array will be the number of bytes indicated by *cbInput*.
     * @param {Pointer<Byte>} paResult A pointer to an array of *nColors* bytes that receives the results of the test.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. For extended error information, call **GetLastError**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcscheckcolors
     */
    static WcsCheckColors(hColorTransform, nColors, nInputChannels, cdtInput, cbInput, pInputData, paResult) {
        result := DllCall("mscms.dll\WcsCheckColors", "ptr", hColorTransform, "uint", nColors, "uint", nInputChannels, "int", cdtInput, "uint", cbInput, "ptr", pInputData, "char*", paResult, "int")
        return result
    }

    /**
     * Determines whether given colors lie within the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @param {Pointer} hcmTransform Handle to the color transform to use.
     * @param {Pointer<COLOR>} lpaInputColors Pointer to an array of [**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to check against the output gamut.
     * @param {Integer} nColors Specifies the number of elements in the array.
     * @param {Integer} ctInput Specifies the input color type.
     * @param {Pointer<Byte>} lpaResult Pointer to a buffer in which to place an array of bytes containing the test results. Each byte in the buffer corresponds to a **COLOR** structure, and on exit has been set to an unsigned value between 0 and 255. The value 0 denotes that the color is in gamut, while a nonzero value indicates that it is out of gamut. For any integer *n* such that 0 \< *n* \< 255, a result value of *n* + 1 indicates that the corresponding color is at least as far out of gamut as would be indicated by a result value of *n*. These values are usually generated from the *gamutTag* in the ICC profile.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. If the function is not successful, the CMM should call [SetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror) to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcheckcolors
     */
    static CMCheckColors(hcmTransform, lpaInputColors, nColors, ctInput, lpaResult) {
        result := DllCall("ICM32.dll\CMCheckColors", "ptr", hcmTransform, "ptr", lpaInputColors, "uint", nColors, "int", ctInput, "char*", lpaResult, "int")
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
     * @param {LPARAM} ulCallbackData 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcheckrgbs
     */
    static CMCheckRGBs(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwStride, lpaResult, pfnCallback, ulCallbackData) {
        result := DllCall("ICM32.dll\CMCheckRGBs", "ptr", hcmTransform, "ptr", lpSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwStride, "char*", lpaResult, "ptr", pfnCallback, "ptr", ulCallbackData, "int")
        return result
    }

    /**
     * Converts color names in a named color space to index numbers in a color profile.
     * @param {Pointer} hProfile The handle to a named color profile.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of **DWORDS** that this function fills with the indices.
     * @param {Integer} dwCount The number of color names to convert.
     * @returns {BOOL} If this function succeeds with the conversion, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. When this occurs, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmconvertcolornametoindex
     */
    static CMConvertColorNameToIndex(hProfile, paColorName, paIndex, dwCount) {
        result := DllCall("ICM32.dll\CMConvertColorNameToIndex", "ptr", hProfile, "char*", paColorName, "uint*", paIndex, "uint", dwCount, "int")
        return result
    }

    /**
     * Transforms indices in a color space to an array of names in a named color space.
     * @param {Pointer} hProfile The handle to a color space profile.
     * @param {Pointer<UInt32>} paIndex Pointer to an array of color-space index numbers.
     * @param {Pointer<SByte>} paColorName Pointer to an array of color name structures.
     * @param {Integer} dwCount The number of indices to convert.
     * @returns {BOOL} If this conversion function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. When this occurs, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmconvertindextocolorname
     */
    static CMConvertIndexToColorName(hProfile, paIndex, paColorName, dwCount) {
        result := DllCall("ICM32.dll\CMConvertIndexToColorName", "ptr", hProfile, "uint*", paIndex, "char*", paColorName, "uint", dwCount, "int")
        return result
    }

    /**
     * Creates a [device link profile](/windows/win32/wcs/d) in the format specified by the International Color Consortium in its ICC Profile Format Specification.
     * @param {Pointer<IntPtr>} pahProfiles Pointer to an array of profile handles.
     * @param {Integer} nProfiles Specifies the number of profiles in the array.
     * @param {Pointer<UInt32>} padwIntents An array of rendering intents.
     * @param {Integer} nIntents The number of elements in the array of intents.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @param {Pointer<Byte>} lpProfileData Pointer to a pointer to a buffer. If successful the function allocates and fills this buffer. The calling application must free this buffer when it is no longer needed. Use the **GlobalFree** function to free this buffer.
     * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
     * 
     * If this function fails, the return value is zero. If the function is not successful, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreatedevicelinkprofile
     */
    static CMCreateDeviceLinkProfile(pahProfiles, nProfiles, padwIntents, nIntents, dwFlags, lpProfileData) {
        result := DllCall("ICM32.dll\CMCreateDeviceLinkProfile", "ptr*", pahProfiles, "uint", nProfiles, "uint*", padwIntents, "uint", nIntents, "uint", dwFlags, "char*", lpProfileData, "int")
        return result
    }

    /**
     * Accepts an array of profiles or a single [device link profile](/windows/win32/wcs/d) and creates a color transform. This transform is a mapping from the color space specified by the first profile to that of the second profile and so on to the last one.
     * @param {Pointer<IntPtr>} pahProfiles Points to an array of profile handles.
     * @param {Integer} nProfiles Specifies the number of profiles in the array.
     * @param {Pointer<UInt32>} padwIntents 
     * @param {Integer} nIntents Specifies the number of intents in the intent array. Can be 1, or the same value as *nProfiles*.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM Transform Creation Flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @returns {Pointer} If this function succeeds, the return value is a color transform in the range 256 to 65,535. Since only the low **WORD** of the transform is retained, valid transforms cannot exceed this range.
     * 
     * If this function fails, the return value is an error code having a value less than 256. When the return value is less than 256, signaling an error, the CMM should use **SetLastError** to set the last error to a valid error value as defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreatemultiprofiletransform
     */
    static CMCreateMultiProfileTransform(pahProfiles, nProfiles, padwIntents, nIntents, dwFlags) {
        result := DllCall("ICM32.dll\CMCreateMultiProfileTransform", "ptr*", pahProfiles, "uint", nProfiles, "uint*", padwIntents, "uint", nIntents, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Creates a display color profile from a [**LOGCOLORSPACEW**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacew) structure.
     * @param {Pointer<LOGCOLORSPACEW>} lpColorSpace Pointer to a color logical space, of which the **lcsFilename** member will be **NULL**.
     * @param {Pointer<Void>} lpProfileData Pointer to a pointer to a buffer. If successful the function allocates and fills this buffer. It is the calling application's responsibility to free this buffer when it is no longer needed.
     * @returns {BOOL} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. Call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) to retrieve the error.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreateprofilew
     */
    static CMCreateProfileW(lpColorSpace, lpProfileData) {
        result := DllCall("ICM32.dll\CMCreateProfileW", "ptr", lpColorSpace, "ptr", lpProfileData, "int")
        return result
    }

    /**
     * Deprecated. There is no replacement API because this one was no longer being used. Developers of alternate CMM modules are not required to implement it.
     * @param {Pointer<LOGCOLORSPACEA>} lpColorSpace 
     * @param {Pointer<Void>} lpDevCharacter 
     * @param {Pointer<Void>} lpTargetDevCharacter 
     * @returns {Pointer} 
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreatetransform
     */
    static CMCreateTransform(lpColorSpace, lpDevCharacter, lpTargetDevCharacter) {
        result := DllCall("ICM32.dll\CMCreateTransform", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "ptr")
        return result
    }

    /**
     * Deprecated. There is no replacement API because this one was no longer being used. Developers of alternate CMM modules are not required to implement it.
     * @param {Pointer<LOGCOLORSPACEW>} lpColorSpace 
     * @param {Pointer<Void>} lpDevCharacter 
     * @param {Pointer<Void>} lpTargetDevCharacter 
     * @returns {Pointer} 
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreatetransformw
     */
    static CMCreateTransformW(lpColorSpace, lpDevCharacter, lpTargetDevCharacter) {
        result := DllCall("ICM32.dll\CMCreateTransformW", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "ptr")
        return result
    }

    /**
     * Creates a color transform that maps from an input [**LOGCOLORSPACEA**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacea) to an optional target space and then to an output device, using a set of flags that define how the transform should be created.
     * @param {Pointer<LOGCOLORSPACEA>} lpColorSpace Pointer to an input logical color space structure.
     * @param {Pointer<Void>} lpDevCharacter Pointer to a memory-mapped device profile.
     * @param {Pointer<Void>} lpTargetDevCharacter Pointer to a memory-mapped target profile.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM transform creation flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @returns {Pointer} If this function succeeds, the return value is a color transform in the range 256 to 65,535. Since only the low **WORD** of the transform is retained, valid transforms cannot exceed this range.
     * 
     * If this function fails, the return value is an error code having a value less than 256. When the return value is less than 256, signaling an error, the CMM should use **SetLastError** to set the last error to a valid error value as defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreatetransformext
     */
    static CMCreateTransformExt(lpColorSpace, lpDevCharacter, lpTargetDevCharacter, dwFlags) {
        result := DllCall("ICM32.dll\CMCreateTransformExt", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Determines whether specified RGB triples lie in the output [gamut](/windows/win32/wcs/g) of a specified transform.
     * @param {Pointer} hcmTransform Specifies the transform to use.
     * @param {Pointer<RGBTRIPLE>} lpaRGBTriple Points to an array of RGB triples to check.
     * @param {Pointer} lpaResult Points to the buffer in which to put results.
     *     
     * The results are represented by an array of bytes. Each byte in the array corresponds to an RGB triple and has an unsigned value between 0 and 255. The value 0 denotes that the color is in gamut, while a nonzero value denotes that it is out of gamut. For any integer *n* in the range 0 \< *n* \< 255, a result value of *n* + 1 indicates that the corresponding color is at least as far out of gamut as would be indicated by a result value of *n*.
     * @param {Integer} nCount Specifies the number of elements in the array.
     * @returns {BOOL} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. Call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) to retrieve the error.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcheckcolorsingamut
     */
    static CMCheckColorsInGamut(hcmTransform, lpaRGBTriple, lpaResult, nCount) {
        result := DllCall("ICM32.dll\CMCheckColorsInGamut", "ptr", hcmTransform, "ptr", lpaRGBTriple, "ptr", lpaResult, "uint", nCount, "int")
        return result
    }

    /**
     * Creates a display color profile from a [**LOGCOLORSPACEA**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacea) structure.
     * @param {Pointer<LOGCOLORSPACEA>} lpColorSpace Pointer to a color logical space, of which the **lcsFilename** member will be **NULL**.
     * @param {Pointer<Void>} lpProfileData Pointer to a pointer to a buffer. If successful the function allocates and fills this buffer. It is the calling application's responsibility to free this buffer when it is no longer needed.
     * @returns {BOOL} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. Call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) to retrieve the error.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreateprofile
     */
    static CMCreateProfile(lpColorSpace, lpProfileData) {
        result := DllCall("ICM32.dll\CMCreateProfile", "ptr", lpColorSpace, "ptr", lpProfileData, "int")
        return result
    }

    /**
     * Translates an application-supplied RGBQuad into the device [color space](https://msdn.microsoft.com/en-us/library/dd371818\(v=vs.85\)).
     * @param {Pointer} hcmTransform Specifies the transform to be used.
     * @param {COLORREF} ColorRef The RGBQuad to translate.
     * @param {Pointer<UInt32>} lpColorRef Points to a buffer in which to place the translation.
     * @param {Integer} dwFlags Specifies how the transform should be used to make the translation. This parameter can take one of the following meanings.
     * 
     * <table>
     * <colgroup>
     * <col style="width: 50%" />
     * <col style="width: 50%" />
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
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. The CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmtranslatergb
     */
    static CMTranslateRGB(hcmTransform, ColorRef, lpColorRef, dwFlags) {
        result := DllCall("ICM32.dll\CMTranslateRGB", "ptr", hcmTransform, "uint", ColorRef, "uint*", lpColorRef, "uint", dwFlags, "int")
        return result
    }

    /**
     * Translates a bitmap from one [color space](https://msdn.microsoft.com/en-us/library/dd371818\(v=vs.85\)) to another using a color transform.
     * @param {Pointer} hcmTransform Specifies the color transform to use.
     * @param {Pointer<Void>} lpSrcBits Points to the bitmap to translate.
     * @param {Integer} bmInput Specifies the input bitmap format.
     * @param {Integer} dwWidth Specifies the number of pixels per scan line in the input bitmap.
     * @param {Integer} dwHeight Specifies the number of scan lines in the input bitmap.
     * @param {Integer} dwStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the input bitmap. If *dwStride* is set to zero, the CMM should assume that scan lines are padded so as to be **DWORD**-aligned.
     * @param {Pointer<Void>} lpDestBits Points to a destination buffer in which to place the translated bitmap.
     * @param {Integer} bmOutput Specifies the output bitmap format.
     * @param {Integer} dwTranslateDirection 
     * @returns {BOOL} Beginning with Windows Vista, the default CMM (Icm32.dll) will return **FALSE** and [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) will report ERROR\_NOT\_SUPPORTED.
     * 
     * **Windows Server 2003, Windows XP and Windows 2000:**
     * 
     * If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**. If the function is not successful, the CMM should call [SetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-setlasterror) to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmtranslatergbs
     */
    static CMTranslateRGBs(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwStride, lpDestBits, bmOutput, dwTranslateDirection) {
        result := DllCall("ICM32.dll\CMTranslateRGBs", "ptr", hcmTransform, "ptr", lpSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwStride, "ptr", lpDestBits, "int", bmOutput, "uint", dwTranslateDirection, "int")
        return result
    }

    /**
     * Creates a color transform that maps from an input [**LOGCOLORSPACEW**](/windows/win32/api/wingdi/ns-wingdi-logcolorspacew) to an optional target space and then to an output device, using a set of flags that define how the transform should be created.
     * @param {Pointer<LOGCOLORSPACEW>} lpColorSpace Pointer to an input logical color space structure.
     * @param {Pointer<Void>} lpDevCharacter Pointer to a memory-mapped device profile.
     * @param {Pointer<Void>} lpTargetDevCharacter Pointer to a memory-mapped target profile.
     * @param {Integer} dwFlags Specifies flags to used control creation of the transform. For details, see [CMM transform creation flags](/windows/win32/wcs/cmm-transform-creation-flags).
     * @returns {Pointer} If this function succeeds, the return value is a color transform in the range 256 to 65,535. Since only the low **WORD** of the transform is retained, valid transforms cannot exceed this range.
     * 
     * If this function fails, the return value is an error code having a value less than 256. When the return value is less than 256, signaling an error, the CMM should use **SetLastError** to set the last error to a valid error value as defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmcreatetransformextw
     */
    static CMCreateTransformExtW(lpColorSpace, lpDevCharacter, lpTargetDevCharacter, dwFlags) {
        result := DllCall("ICM32.dll\CMCreateTransformExtW", "ptr", lpColorSpace, "ptr", lpDevCharacter, "ptr", lpTargetDevCharacter, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Deletes a specified color transform, and frees any memory associated with it.
     * @param {Pointer} hcmTransform Identifies the color transform to be deleted.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If the function fails, the return value is **FALSE**. If the **CMDeleteTransform** function is not successful, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmdeletetransform
     */
    static CMDeleteTransform(hcmTransform) {
        result := DllCall("ICM32.dll\CMDeleteTransform", "ptr", hcmTransform, "int")
        return result
    }

    /**
     * Retrieves various information about the color management module (CMM).
     * @param {Integer} dwInfo Specifies what information should be retrieved. This parameter can take one of the following constant values.
     * 
     * <table>
     * <colgroup>
     * <col style="width: 50%" />
     * <col style="width: 50%" />
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
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmgetinfo
     */
    static CMGetInfo(dwInfo) {
        result := DllCall("ICM32.dll\CMGetInfo", "uint", dwInfo, "uint")
        return result
    }

    /**
     * Retrieves information about the specified named color profile.
     * @param {Pointer} hProfile The handle to the profile from which the information will be retrieved.
     * @param {Pointer<NAMED_PROFILE_INFO>} pNamedProfileInfo A pointer to a **NAMED_PROFILE_INFO** structure.
     * @returns {BOOL} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. When this occurs, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmgetnamedprofileinfo
     */
    static CMGetNamedProfileInfo(hProfile, pNamedProfileInfo) {
        result := DllCall("ICM32.dll\CMGetNamedProfileInfo", "ptr", hProfile, "ptr", pNamedProfileInfo, "int")
        return result
    }

    /**
     * Reports whether the given profile is a valid ICC profile that can be used for color management.
     * @param {Pointer} hProfile Specifies the profile to check.
     * @param {Pointer<BOOL>} lpbValid Pointer to a variable that is set on exit to TRUE if the profile is a valid ICC profile, or FALSE if not.
     * @returns {BOOL} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. If the function fails, the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmisprofilevalid
     */
    static CMIsProfileValid(hProfile, lpbValid) {
        result := DllCall("ICM32.dll\CMIsProfileValid", "ptr", hProfile, "ptr", lpbValid, "int")
        return result
    }

    /**
     * Translates an array of colors from a source [color space](/windows/win32/wcs/c) to a destination color space using a color transform.
     * @param {Pointer} hcmTransform Specifies the color transform to use.
     * @param {Pointer<COLOR>} lpaInputColors Points to an array of [**COLOR**](/windows/win32/api/icm/ns-icm-color) structures to translate.
     * @param {Integer} nColors Specifies the number of elements in the array.
     * @param {Integer} ctInput Specifies the color type of the input.
     * @param {Pointer<COLOR>} lpaOutputColors Points to a buffer in which an array of translated **COLOR** structures is to be placed.
     * @param {Integer} ctOutput Specifies the output color type.
     * @returns {BOOL} If this function succeeds, the return value is TRUE.
     * 
     * If this function fails, the return value is FALSE. The CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmtranslatecolors
     */
    static CMTranslateColors(hcmTransform, lpaInputColors, nColors, ctInput, lpaOutputColors, ctOutput) {
        result := DllCall("ICM32.dll\CMTranslateColors", "ptr", hcmTransform, "ptr", lpaInputColors, "uint", nColors, "int", ctInput, "ptr", lpaOutputColors, "int", ctOutput, "int")
        return result
    }

    /**
     * Translates a bitmap from one defined format into a different defined format and calls a callback function periodically, if one is specified, to report progress and permit the calling application to terminate the translation.
     * @param {Pointer} hcmTransform Specifies the color transform to use.
     * @param {Pointer<Void>} lpSrcBits Pointer to the bitmap to translate.
     * @param {Integer} bmInput Specifies the input bitmap format.
     * @param {Integer} dwWidth Specifies the number of pixels per scan line in the input bitmap.
     * @param {Integer} dwHeight Specifies the number of scan lines in the input bitmap.
     * @param {Integer} dwInputStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the input bitmap. If *dwInputStride* is set to zero, the CMM should assume that scan lines are padded so as to be **DWORD**-aligned.
     * @param {Pointer<Void>} lpDestBits Points to a destination buffer in which to place the translated bitmap.
     * @param {Integer} bmOutput Specifies the output bitmap format.
     * @param {Integer} dwOutputStride Specifies the number of bytes from the beginning of one scan line to the beginning of the next in the input bitmap. If *dwOutputStride* is set to zero, the CMM should pad scan lines so that they are **DWORD**-aligned.
     * @param {Pointer<LPBMCALLBACKFN>} lpfnCallback Pointer to an application-supplied callback function called periodically by **CMTranslateRGBsExt** to report progress and allow the calling process to cancel the translation. (See [**ICMProgressProcCallback**](https://msdn.microsoft.com/en-us/library/dd372114\(v=vs.85\)).)
     * @param {LPARAM} ulCallbackData Data passed back to the callback function, for example to identify the translation that is reporting progress.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE** and the CMM should call **SetLastError** to set the last error to a valid error value defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-cmtranslatergbsext
     */
    static CMTranslateRGBsExt(hcmTransform, lpSrcBits, bmInput, dwWidth, dwHeight, dwInputStride, lpDestBits, bmOutput, dwOutputStride, lpfnCallback, ulCallbackData) {
        result := DllCall("ICM32.dll\CMTranslateRGBsExt", "ptr", hcmTransform, "ptr", lpSrcBits, "int", bmInput, "uint", dwWidth, "uint", dwHeight, "uint", dwInputStride, "ptr", lpDestBits, "int", bmOutput, "uint", dwOutputStride, "ptr", lpfnCallback, "ptr", ulCallbackData, "int")
        return result
    }

    /**
     * Creates a handle to a specified color profile.
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
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsopencolorprofilea
     */
    static WcsOpenColorProfileA(pCDMPProfile, pCAMPProfile, pGMMPProfile, dwDesireAccess, dwShareMode, dwCreationMode, dwFlags) {
        result := DllCall("mscms.dll\WcsOpenColorProfileA", "ptr", pCDMPProfile, "ptr", pCAMPProfile, "ptr", pGMMPProfile, "uint", dwDesireAccess, "uint", dwShareMode, "uint", dwCreationMode, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Creates a handle to a specified color profile.
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
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsopencolorprofilew
     */
    static WcsOpenColorProfileW(pCDMPProfile, pCAMPProfile, pGMMPProfile, dwDesireAccess, dwShareMode, dwCreationMode, dwFlags) {
        result := DllCall("mscms.dll\WcsOpenColorProfileW", "ptr", pCDMPProfile, "ptr", pCAMPProfile, "ptr", pGMMPProfile, "uint", dwDesireAccess, "uint", dwShareMode, "uint", dwCreationMode, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Converts a WCS profile into an International Color Consortium (ICC) profile.
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
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcscreateiccprofile
     */
    static WcsCreateIccProfile(hWcsProfile, dwOptions) {
        result := DllCall("mscms.dll\WcsCreateIccProfile", "ptr", hWcsProfile, "uint", dwOptions, "ptr")
        return result
    }

    /**
     * Determines whether system management of the display calibration state is enabled.
     * @param {Pointer<BOOL>} pbIsEnabled **TRUE** if system management of the display calibration state is enabled; otherwise **FALSE**.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcsgetcalibrationmanagementstate
     */
    static WcsGetCalibrationManagementState(pbIsEnabled) {
        result := DllCall("mscms.dll\WcsGetCalibrationManagementState", "ptr", pbIsEnabled, "int")
        return result
    }

    /**
     * Enables or disables system management of the display calibration state.
     * @param {BOOL} bIsEnabled **TRUE** to enable system management of the display calibration state. **FALSE** to disable system management of the display calibration state.
     * @returns {BOOL} If this function succeeds, the return value is **TRUE**.
     * 
     * If this function fails, the return value is **FALSE**.
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-wcssetcalibrationmanagementstate
     */
    static WcsSetCalibrationManagementState(bIsEnabled) {
        result := DllCall("mscms.dll\WcsSetCalibrationManagementState", "int", bIsEnabled, "int")
        return result
    }

    /**
     * 
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {PWSTR} profileName Identifies the installed profile to associate.
     * @param {LUID} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {BOOL} setAsDefault Whether or not to set the newly associated profile as the default.
     * @param {BOOL} associateAsAdvancedColor Specifies to which association list the new profile is added.
     * @returns {HRESULT} **S_OK** for success, or a failure **HRESULT** value
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-colorprofileadddisplayassociation
     */
    static ColorProfileAddDisplayAssociation(scope, profileName, targetAdapterID, sourceID, setAsDefault, associateAsAdvancedColor) {
        profileName := profileName is String ? StrPtr(profileName) : profileName

        result := DllCall("mscms.dll\ColorProfileAddDisplayAssociation", "int", scope, "ptr", profileName, "ptr", targetAdapterID, "uint", sourceID, "int", setAsDefault, "int", associateAsAdvancedColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {PWSTR} profileName Identifies the installed profile to associate.
     * @param {LUID} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {BOOL} dissociateAdvancedColor Specifies to which association list the new profile is added.
     * @returns {HRESULT} **S_OK** for success, or a failure **HRESULT** value
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-colorprofileremovedisplayassociation
     */
    static ColorProfileRemoveDisplayAssociation(scope, profileName, targetAdapterID, sourceID, dissociateAdvancedColor) {
        profileName := profileName is String ? StrPtr(profileName) : profileName

        result := DllCall("mscms.dll\ColorProfileRemoveDisplayAssociation", "int", scope, "ptr", profileName, "ptr", targetAdapterID, "uint", sourceID, "int", dissociateAdvancedColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {PWSTR} profileName Identifies the installed profile to associate.
     * @param {Integer} profileType The type of color profile to set as default (currently only CPT_ICC is supported).
     * @param {Integer} profileSubType The subtype of the color profile to set as default.
     * @param {LUID} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @returns {HRESULT} **S_OK** for success, or a failure **HRESULT** value
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-colorprofilesetdisplaydefaultassociation
     */
    static ColorProfileSetDisplayDefaultAssociation(scope, profileName, profileType, profileSubType, targetAdapterID, sourceID) {
        profileName := profileName is String ? StrPtr(profileName) : profileName

        result := DllCall("mscms.dll\ColorProfileSetDisplayDefaultAssociation", "int", scope, "ptr", profileName, "int", profileType, "int", profileSubType, "ptr", targetAdapterID, "uint", sourceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {LUID} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Pointer<PWSTR>} profileList Pointer to a buffer where the profile names are placed, must be freed with [LocalFree](../winbase/nf-winbase-localfree.md).
     * @param {Pointer<UInt32>} profileCount Receives the number of profiles names copied into profileList.
     * @returns {HRESULT} **S_OK** for success, or a failure **HRESULT** value
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-colorprofilegetdisplaylist
     */
    static ColorProfileGetDisplayList(scope, targetAdapterID, sourceID, profileList, profileCount) {
        result := DllCall("mscms.dll\ColorProfileGetDisplayList", "int", scope, "ptr", targetAdapterID, "uint", sourceID, "ptr", profileList, "uint*", profileCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope Specifies the association as system-wide or the current user.
     * @param {LUID} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Integer} profileType The type of color profile to return (currently only CPT_ICC is supported).
     * @param {Integer} profileSubType The subtype of the color profile to return.
     * @param {Pointer<PWSTR>} profileName Receives a pointer to the default color profile name, which must be freed with [LocalFree](../winbase/nf-winbase-localfree.md).
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-colorprofilegetdisplaydefault
     */
    static ColorProfileGetDisplayDefault(scope, targetAdapterID, sourceID, profileType, profileSubType, profileName) {
        result := DllCall("mscms.dll\ColorProfileGetDisplayDefault", "int", scope, "ptr", targetAdapterID, "uint", sourceID, "int", profileType, "int", profileSubType, "ptr", profileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {LUID} targetAdapterID An identifier assigned to the adapter (e.g. GPU) of the target display. See [Remarks](#remarks) for more details.
     * @param {Integer} sourceID An identifier assigned to the source of the display. See [Remarks](#remarks) for more details.
     * @param {Pointer<Int32>} scope Returns the scope of the currently selected color profile - either the current user or system.
     * @returns {HRESULT} **S_OK** for success, or a failure **HRESULT** value
     * @see https://docs.microsoft.com/windows/win32/api//icm/nf-icm-colorprofilegetdisplayuserscope
     */
    static ColorProfileGetDisplayUserScope(targetAdapterID, sourceID, scope) {
        result := DllCall("mscms.dll\ColorProfileGetDisplayUserScope", "ptr", targetAdapterID, "uint", sourceID, "int*", scope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {LUID} targetAdapterID 
     * @param {Integer} sourceID 
     * @param {Integer} capsType 
     * @param {Pointer<Void>} outputCapabilities 
     * @returns {HRESULT} 
     */
    static ColorProfileGetDeviceCapabilities(scope, targetAdapterID, sourceID, capsType, outputCapabilities) {
        result := DllCall("mscms.dll\ColorProfileGetDeviceCapabilities", "int", scope, "ptr", targetAdapterID, "uint", sourceID, "int", capsType, "ptr", outputCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOUNDSENTRY_TEXT_EFFECT.ahk" { SOUNDSENTRY_TEXT_EFFECT }
#Import ".\SOUND_SENTRY_GRAPHICS_EFFECT.ahk" { SOUND_SENTRY_GRAPHICS_EFFECT }
#Import ".\SOUNDSENTRY_WINDOWS_EFFECT.ahk" { SOUNDSENTRY_WINDOWS_EFFECT }
#Import ".\SOUNDSENTRY_FLAGS.ahk" { SOUNDSENTRY_FLAGS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about the SoundSentry accessibility feature. When the SoundSentry feature is on, the computer displays a visual indication only when a sound is generated. (ANSI)
 * @remarks
 * An application uses a <b>SOUNDSENTRY</b> structure when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <i>uiAction</i> parameter set to <b>SPI_GETSOUNDSENTRY</b> or <b>SPI_SETSOUNDSENTRY</b>. When using <b>SPI_GETSOUNDSENTRY</b>, an application must specify the <b>cbSize</b> member of the <b>SOUNDSENTRY</b> structure; the <b>SystemParametersInfo</b> function fills the remaining members. An application must specify the <b>cbSize</b>, <b>dwFlags</b>, and <b>iWindowsEffect</b> members when using the <b>SPI_SETSOUNDSENTRY</b> value.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines SOUNDSENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-soundsentrya
 * @namespace Windows.Win32.UI.Accessibility
 * @charset ANSI
 */
export default struct SOUNDSENTRYA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * A set of bit flags that specify properties of the SoundSentry feature. The following bit-flag values are defined:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSF_AVAILABLE"></a><a id="ssf_available"></a><dl>
     * <dt><b>SSF_AVAILABLE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the SoundSentry feature is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSF_INDICATOR"></a><a id="ssf_indicator"></a><dl>
     * <dt><b>SSF_INDICATOR</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SSF_SOUNDSENTRYON"></a><a id="ssf_soundsentryon"></a><dl>
     * <dt><b>SSF_SOUNDSENTRYON</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the SoundSentry feature is on.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : SOUNDSENTRY_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    iFSTextEffect : SOUNDSENTRY_TEXT_EFFECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the duration, in milliseconds, of the visual signal that is displayed when a full-screen, text-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     */
    iFSTextEffectMSec : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the RGB value of the color to be used when displaying the visual signal shown when a full-screen, text-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     */
    iFSTextEffectColorBits : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    iFSGrafEffect : SOUND_SENTRY_GRAPHICS_EFFECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the duration, in milliseconds, of the visual signal that is displayed when a full-screen, graphics-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     */
    iFSGrafEffectMSec : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the RGB value of the color to be used when displaying the visual signal shown when a full-screen, graphics-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     */
    iFSGrafEffectColor : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    iWindowsEffect : SOUNDSENTRY_WINDOWS_EFFECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the duration, in milliseconds, of the visual signal that is displayed when a Win32-based application (or an application running in a window) generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     */
    iWindowsEffectMSec : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * This member is reserved for future use. It should be set to <b>NULL</b>.
     */
    lpszWindowsEffectDLL : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * This member is reserved for future use. It must be set to zero.
     */
    iWindowsEffectOrdinal : UInt32

}

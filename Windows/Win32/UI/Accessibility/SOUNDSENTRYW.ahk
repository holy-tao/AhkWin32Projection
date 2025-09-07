#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the SoundSentry accessibility feature. When the SoundSentry feature is on, the computer displays a visual indication only when a sound is generated. (Unicode)
 * @remarks
 * An application uses a <b>SOUNDSENTRY</b> structure when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <i>uiAction</i> parameter set to <b>SPI_GETSOUNDSENTRY</b> or <b>SPI_SETSOUNDSENTRY</b>. When using <b>SPI_GETSOUNDSENTRY</b>, an application must specify the <b>cbSize</b> member of the <b>SOUNDSENTRY</b> structure; the <b>SystemParametersInfo</b> function fills the remaining members. An application must specify the <b>cbSize</b>, <b>dwFlags</b>, and <b>iWindowsEffect</b> members when using the <b>SPI_SETSOUNDSENTRY</b> value.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winuser.h header defines SOUNDSENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-soundsentryw
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 * @charset Unicode
 */
class SOUNDSENTRYW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    iFSTextEffect {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the duration, in milliseconds, of the visual signal that is displayed when a full-screen, text-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    iFSTextEffectMSec {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the RGB value of the color to be used when displaying the visual signal shown when a full-screen, text-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    iFSTextEffectColorBits {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    iFSGrafEffect {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the duration, in milliseconds, of the visual signal that is displayed when a full-screen, graphics-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    iFSGrafEffectMSec {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the RGB value of the color to be used when displaying the visual signal shown when a full-screen, graphics-mode application generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    iFSGrafEffectColor {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    iWindowsEffect {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>Windows 95/98:</b> Specifies the duration, in milliseconds, of the visual signal that is displayed when a Win32-based application (or an application running in a window) generates a sound.
     * 
     * <b>Windows NT/2000:</b> This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    iWindowsEffectMSec {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * This member is reserved for future use. It should be set to <b>NULL</b>.
     * @type {Pointer<Ptr>}
     */
    lpszWindowsEffectDLL {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * This member is reserved for future use. It must be set to zero.
     * @type {Integer}
     */
    iWindowsEffectOrdinal {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}

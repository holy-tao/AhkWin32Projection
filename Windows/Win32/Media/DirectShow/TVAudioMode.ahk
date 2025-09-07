#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the mode of a TV audio control.
 * @remarks
 * The <b>TVAudioMode</b> flags fall into two groups.
  * 
  * <ul>
  * <li>Bits 0 - 7: Mode flags. These flags include mono/stereo and language (A, B, or C).</li>
  * <li>Bits 8 and higher: Preset flags. </li>
  * </ul>
  * <div class="alert"><b>Note</b>  The preset flags require Windows Vista or later.</div>
  * <div> </div>
  * The mode flags represent the tuner's current audio mode. The preset flags represent settings that can take effect in the future, if the audio signal changes. Often, the secondary audio program is not available, or is available only in mono. An application can use the preset flags to store the user's preferred language while providing a reasonable experience when that language is not available.
  * 
  * The following remarks describe how the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamtvaudio">IAMTVAudio</a> methods interpret these flags.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtvaudio-put_tvaudiomode">IAMTVAudio::put_TVAudioMode</a>:
  *         
  * 
  * <ul>
  * <li>If you set a mode flag, the tuner switches to that mode immediately. If the mode is not immediately available, the method fails.</li>
  * <li>If you set a preset flag, the driver switches to that mode immediately if possible; otherwise, the driver stores the request. If the requested mode becomes available later, the driver switches to that mode. The driver maintains the preset flags across program changes or channel changes. A preset mode fails only if the tuner cannot support that mode. It never fails due to the contents of the audio signal.</li>
  * </ul>
  * You may combine one language mode flag (<b>AMTVAUDIO_MODE_LANG_A</b>, <b>AMTVAUDIO_MODE_LANG_B</b>, or <b>AMTVAUDIO_MODE_LANG_C</b>) with one stereo/mono flag (<b>AMTVAUDIO_MODE_MONO</b> or <b>AMTVAUDIO_MODE_STEREO</b>). Other combinations of mode flags are not valid. For example, <b>AMTVAUDIO_MODE_LANG_A</b> | <b>AMTVAUDIO_MODE_LANG_B</b> is not valid.
  * 
  * You may combine more than one preset flag. The driver attempts them in the following order:
  * 
  * <ol>
  * <li>Language C</li>
  * <li>Language B</li>
  * <li>Language A</li>
  * <li>Stereo</li>
  * </ol>
  * You may combine mode flags and preset flags, but you cannot combine a mode flag and a preset flag for the same language. For example, <b>AMTVAUDIO_MODE_LANG_A</b> | <b>AMTVAUDIO_PRESET_LANG_A</b> is not valid. Mode flags have priority over preset flags.
  * 
  * If the method fails for any reason, the state of the tuner — that is, the current mode plus the stored presets — does not change.
  * 
  * Except for language C, the tuner always streams the same language over both audio channels.
  * 
  * Example: The caller sets <b>AMTVAUDIO_PRESET_STEREO</b> | <b>AMTVAUDIO_PRESET_LANG_B</b>. Suppose the current program is available in language A with stereo or language B with mono. The driver selects language B (mono), because that flag takes precedence. Later, the program switches to a commercial that is only available in language A. The driver switches to language A, because language B is not available. When the program resumes, the driver switches back to language B.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtvaudio-getavailabletvaudiomodes">IAMTVAudio::GetAvailableTVAudioModes</a>: This method returns the modes that are currently available in the signal. This method never returns preset flags.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtvaudio-gethardwaresupportedtvaudiomodes">IAMTVAudio::GetHardwareSupportedTVAudioModes</a>: This method returns all of the modes supported by the hardware, including preset modes.
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtvaudio-get_tvaudiomode">IAMTVAudio::get_TVAudioMode</a>: This method returns the current mode. This method never returns preset flags.
  * 
  * <h3><a id="Mask_Constants"></a><a id="mask_constants"></a><a id="MASK_CONSTANTS"></a>Mask Constants</h3>
  * The following constants are defined in Strmif.h:
  *           
  * 
  * 
  * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-tvaudiomode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class TVAudioMode{

    /**
     * Mono.
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_MODE_MONO => 1

    /**
     * Stereo.
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_MODE_STEREO => 2

    /**
     * Language A: Main audio channel.
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_MODE_LANG_A => 16

    /**
     * Languag B: Secondary audio program (SAP).
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_MODE_LANG_B => 32

    /**
     * Language C: Either a third language, or the main audio program plus the SAP (for example, English from one speaker and Japanese from the other speaker).
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_MODE_LANG_C => 64

    /**
     * Stereo preset.
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_PRESET_STEREO => 512

    /**
     * Languag A preset.
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_PRESET_LANG_A => 4096

    /**
     * Language B preset.
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_PRESET_LANG_B => 8192

    /**
     * Language C preset.
     * @type {Integer (Int32)}
     */
    static AMTVAUDIO_PRESET_LANG_C => 16384
}

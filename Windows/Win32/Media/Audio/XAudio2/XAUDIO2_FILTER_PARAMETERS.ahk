#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines filter parameters for a source voice.
 * @remarks
 * Setting XAUDIO2_FILTER_PARAMETERS with the following values is acoustically equivalent to the filter being fully bypassed.
  * 
  * 
  * ```
  * XAUDIO2_FILTER_PARAMETERS FilterParams;
  * FilterParams.Frequency = 1.0f;    
  * FilterParams.OneOverQ = 1.0f;
  * FilterParams.Type = LowPassFilter;
  * 
  * ```
  * 
  * 
  * The following formulas show the relationship between the members of XAUDIO2_FILTER_PARAMETERS and the per-voice filter.
  * 
  * 
  * ```
  * Yl( n ) = F1 yb( n ) + yl( n - 1 )
  * Yb( n ) = F1 yh( n ) + yb( n - 1 )
  * Yh( n ) = x( n ) - yl( n ) - OneOverQ(yb( n - 1 )
  * Yn( n ) = Yl(n) + Yh(n)
  * 
  * 
  * ```
  * 
  * 
  * Where:
  * 
  * 
  * ```
  * Yl = lowpass output
  * Yb = bandpass output
  * Yh = highpass output
  * Yn = notch output
  * F1 = XAUDIO2_FILTER_PARAMETERS.Frequency
  * OneOverQ = XAUDIO2_FILTER_PARAMETERS.OneOverQ
  * ```
  * 
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_FILTER_PARAMETERS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ne-xaudio2-xaudio2_filter_type">XAUDIO2_FILTER_TYPE</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Filter radian frequency calculated as (2 * sin(pi * (desired filter cutoff frequency) / sampleRate)). The frequency must be greater than or equal to 0 and less than or equal to XAUDIO2_MAX_FILTER_FREQUENCY. The maximum frequency allowable is equal to the source sound's sample rate divided by six which corresponds to the maximum filter radian frequency of 1. For example, if a sound's sample rate is 48000 and the desired cutoff frequency is the maximum allowable value for that sample rate, 8000, the value for <b>Frequency</b> will be 1. 
     * If XAUDIO2_HELPER_FUNCTIONS is defined, XAudio2.h will include the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-xaudio2radianstocutofffrequency">XAudio2RadiansToCutoffFrequency</a> and <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-xaudio2cutofffrequencytoradians">XAudio2CutoffFrequencyToRadians</a> helper functions for converting between hertz and radian frequencies. Defining XAUDIO2_HELPER_FUNCTIONS will also include <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-xaudio2cutofffrequencytoonepolecoefficient">XAudio2CutoffFrequencyToOnePoleCoefficient</a> for converting between hertz and a one-pole coefficient suitable for use with the LowPassOnePoleFilter and HighPassOnePoleFilter.
     * @type {Float}
     */
    Frequency {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Reciprocal of Q factor. Controls how quickly frequencies beyond Frequency are dampened. Larger values result in quicker dampening while smaller values cause dampening to occur more gradually. Must be greater than 0 and less than or equal to XAUDIO2_MAX_FILTER_ONEOVERQ.
     * @type {Float}
     */
    OneOverQ {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}

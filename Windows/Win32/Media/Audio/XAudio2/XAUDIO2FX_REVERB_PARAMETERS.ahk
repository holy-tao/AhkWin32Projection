#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes parameters for use in the reverb APO.
 * @remarks
 * All parameters related to sampling rate or time are relative to a 48kHz voice and must be scaled for use with other sampling rates. For example, setting <i>ReflectionsDelay</i> to 300ms gives a true 300ms delay when the reverb is hosted in a 48kHz voice, but becomes a 150ms delay when hosted in a 24kHz voice.
  * 
  * 
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2fx/ns-xaudio2fx-xaudio2fx_reverb_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2FX_REVERB_PARAMETERS extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * Percentage of the output that will be reverb. Allowable values are from 0 to 100.
     * @type {Float}
     */
    WetDryMix {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The delay time of the first reflection relative to the direct path. Permitted range is from 0 to 300 milliseconds. 
     * 
     * <div class="alert"><b>Note</b>  All parameters related to sampling rate or time are relative to a 48kHz sampling rate and must be scaled for use with other sampling rates. See remarks section below for additional information.</div>
     * <div> </div>
     * @type {Integer}
     */
    ReflectionsDelay {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Delay of reverb relative to the first reflection. Permitted range is from 0 to 85 milliseconds.
     * 
     * <div class="alert"><b>Note</b>  All parameters related to sampling rate or time are relative to a 48kHz sampling rate and must be scaled for use with other sampling rates. See remarks section below for additional information.</div>
     * <div> </div>
     * @type {Integer}
     */
    ReverbDelay {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Delay for the left rear output and right rear output. Permitted range is from 0 to 5 milliseconds.
     * 
     * <div class="alert"><b>Note</b>  All parameters related to sampling rate or time are relative to a 48kHz sampling rate and must be scaled for use with other sampling rates. See remarks section below for additional information.</div>
     * <div> </div>
     * @type {Integer}
     */
    RearDelay {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * Delay for the left side output and right side output. Permitted range is from 0 to 5 milliseconds.
     * 
     * <div class="alert"><b>Note</b>  This value is supported beginning with Windows 10.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  All parameters related to sampling rate or time are relative to a 48kHz sampling rate and must be scaled for use with other sampling rates. See remarks section below for additional information.</div>
     * <div> </div>
     * @type {Integer}
     */
    SideDelay {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * Position of the left input within the simulated space relative to the listener. With <i>PositionLeft</i> set to the minimum value, the left input is placed close to the listener. In this position, early reflections are dominant, and the reverb decay is set back in the sound field and reduced in amplitude. With <i>PositionLeft</i> set to the maximum value, the left input is placed at a maximum distance from the listener within the simulated room. <i>PositionLeft</i> does not affect the reverb decay time (liveness of the room), only the apparent position of the source relative to the listener. Permitted range is from 0 to 30 (no units).
     * @type {Integer}
     */
    PositionLeft {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * Same as <i>PositionLeft</i>, but affecting only the right input. Permitted range is from 0 to 30 (no units). 
     * 
     * <div class="alert"><b>Note</b>  PositionRight is ignored in mono-in/mono-out mode.</div>
     * <div> </div>
     * @type {Integer}
     */
    PositionRight {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Gives a greater or lesser impression of distance from the source to the listener. Permitted range is from 0 to 30 (no units).
     * @type {Integer}
     */
    PositionMatrixLeft {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * Gives a greater or lesser impression of distance from the source to the listener. Permitted range is from 0 to 30 (no units). 
     * 
     * <div class="alert"><b>Note</b>  <i>PositionMatrixRight</i> is ignored in mono-in/mono-out mode.</div>
     * <div> </div>
     * @type {Integer}
     */
    PositionMatrixRight {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * Controls the character of the individual wall reflections. Set to minimum value to simulate a hard flat surface and to maximum value to simulate a diffuse surface. Permitted range is from 0 to 15 (no units).
     * @type {Integer}
     */
    EarlyDiffusion {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * Controls the character of the individual wall reverberations. Set to minimum value to simulate a hard flat surface and to maximum value to simulate a diffuse surface. Permitted range is from 0 to 15 (no units).
     * @type {Integer}
     */
    LateDiffusion {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * Adjusts the decay time of low frequencies relative to the decay time at 1 kHz. The values correspond to dB of gain as follows: 
     *        
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <td>0</td>
     * <td>1</td>
     * <td>2</td>
     * <td>3</td>
     * <td>4</td>
     * <td>5</td>
     * <td>6</td>
     * <td>7</td>
     * <td>8</td>
     * <td>9</td>
     * <td>10</td>
     * <td>11</td>
     * <td>12</td>
     * </tr>
     * <tr>
     * <th>Gain (dB)</th>
     * <td>-8</td>
     * <td>-7</td>
     * <td>-6</td>
     * <td>-5</td>
     * <td>-4</td>
     * <td>-3</td>
     * <td>-2</td>
     * <td>-1</td>
     * <td>0</td>
     * <td>+1</td>
     * <td>+2</td>
     * <td>+3</td>
     * <td>+4</td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  A <i>LowEQGain</i> value of 8 results in the decay time of low frequencies being equal to the decay time at 1 kHz.</div>
     * <div> </div>
     *  Permitted range is from 0 to 12 (no units).
     * @type {Integer}
     */
    LowEQGain {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * Sets the corner frequency of the low pass filter that is controlled by the <i>LowEQGain</i> parameter. The values correspond to frequency in Hz as follows: 
     *        
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <td>0</td>
     * <td>1</td>
     * <td>2</td>
     * <td>3</td>
     * <td>4</td>
     * <td>5</td>
     * <td>6</td>
     * <td>7</td>
     * <td>8</td>
     * <td>9</td>
     * </tr>
     * <tr>
     * <th>Frequency (Hz)</th>
     * <td>50</td>
     * <td>100</td>
     * <td>150</td>
     * <td>200</td>
     * <td>250</td>
     * <td>300</td>
     * <td>350</td>
     * <td>400</td>
     * <td>450</td>
     * <td>500</td>
     * </tr>
     * </table>
     *  
     * 
     * Permitted range is from 0 to 9 (no units).
     * @type {Integer}
     */
    LowEQCutoff {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * Adjusts the decay time of high frequencies relative to the decay time at 1 kHz. When set to zero, high frequencies decay at the same rate as 1 kHz. When set to maximum value, high frequencies decay at a much faster rate than 1 kHz.
     * 	        
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <td>0</td>
     * <td>1</td>
     * <td>2</td>
     * <td>3</td>
     * <td>4</td>
     * <td>5</td>
     * <td>6</td>
     * <td>7</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <th>Gain (dB)</th>
     * <td>-8</td>
     * <td>-7</td>
     * <td>-6</td>
     * <td>-5</td>
     * <td>-4</td>
     * <td>-3</td>
     * <td>-2</td>
     * <td>-1</td>
     * <td>0</td>
     * </tr>
     * </table>
     *  
     * 
     * Permitted range is from 0 to 8 (no units).
     * @type {Integer}
     */
    HighEQGain {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * Sets the corner frequency of the high pass filter that is controlled by the <i>HighEQGain</i> parameter. The values correspond to frequency in kHz as follows:       
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <td>0</td>
     * <td>1</td>
     * <td>2</td>
     * <td>3</td>
     * <td>4</td>
     * <td>5</td>
     * <td>6</td>
     * <td>7</td>
     * <td>8</td>
     * <td>9</td>
     * <td>10</td>
     * <td>11</td>
     * <td>12</td>
     * <td>13</td>
     * <td>14</td>
     * </tr>
     * <tr>
     * <th>Frequency (kHz)</th>
     * <td>1</td>
     * <td>1.5</td>
     * <td>2</td>
     * <td>2.5</td>
     * <td>3</td>
     * <td>3.5</td>
     * <td>4</td>
     * <td>4.5</td>
     * <td>5</td>
     * <td>5.5</td>
     * <td>6</td>
     * <td>6.5</td>
     * <td>7</td>
     * <td>7.5</td>
     * <td>8</td>
     * </tr>
     * </table>
     *  
     * 
     * Permitted range is from 0 to 14 (no units).
     * @type {Integer}
     */
    HighEQCutoff {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Sets the corner frequency of the low pass filter for the room effect. Permitted range is from 20 to 20,000 Hz.
     * 
     * <div class="alert"><b>Note</b>  All parameters related to sampling rate or time are relative to a 48kHz sampling rate and must be scaled for use with other sampling rates. See remarks section below for additional information.</div>
     * <div> </div>
     * @type {Float}
     */
    RoomFilterFreq {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Sets the pass band intensity level of the low-pass filter for both the early reflections and the late field reverberation. Permitted range is from -100 to 0 dB.
     * @type {Float}
     */
    RoomFilterMain {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Sets the intensity of the low-pass filter for both the early reflections and the late field reverberation at the corner frequency (<i>RoomFilterFreq</i>). Permitted range is from -100 to 0 dB.
     * @type {Float}
     */
    RoomFilterHF {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * Adjusts the intensity of the early reflections. Permitted range is from -100 to 20 dB.
     * @type {Float}
     */
    ReflectionsGain {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * Adjusts the intensity of the reverberations. Permitted range is from -100 to 20 dB.
     * @type {Float}
     */
    ReverbGain {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Reverberation decay time at 1 kHz. This is the time that a full scale input signal decays by 60 dB. Permitted range is from 0.1 to infinity seconds.
     * @type {Float}
     */
    DecayTime {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Controls the modal density in the late field reverberation. For colorless spaces, <i>Density</i> should be set to the maximum value (100). As Density is decreased, the sound becomes hollow (comb filtered). This is an effect that can be useful if you are trying to model a silo. Permitted range as a percentage is from 0 to 100.
     * @type {Float}
     */
    Density {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * The apparent size of the acoustic space. Permitted range is from 1 to 100 feet.
     * @type {Float}
     */
    RoomSize {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * If set to TRUE, disables late field reflection calculations. Disabling late field reflection calculations results in a significant CPU time savings.
     * 
     * <div class="alert"><b>Note</b>  The DirectX SDK versions of XAUDIO2 don't support this member.</div>
     * <div> </div>
     * @type {Integer}
     */
    DisableLateField {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}

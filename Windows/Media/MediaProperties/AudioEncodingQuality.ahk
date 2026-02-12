#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the level of quality of the audio encoding. The higher the quality, the better the audio fidelity, and the larger the resulting file.
  * 
  * The quality of encoded audio is determined by several factors. 
  * + The number of channels represented. One channel for monophonic, and two channels for stereo.
  * + The digital sampling rate. This must be at least double the frequency of the highest pitch you want to reproduce.
  * + The digital sampling resolution. This is also known as the bit-depth. + 8-bit provides a low resolution with 256 descrete levels.
  * + 16-bit provides a moderate resolution with 65,536 descrete levels.
  * + 24-bit and 32-bit provide high resolutions.
  * 
  * + The amount of lossy compression used to encode the audio.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.audioencodingquality
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class AudioEncodingQuality extends Win32Enum{

    /**
     * **Auto** fills in the proper settings based on the current camera settings. So when **Auto** is used, settings that are manually modified are ignored. For example, if you create a preset profile using one the static create methods, such as [CreateM4a](mediaencodingprofile_createm4a_1230065862.md), and specify **Auto** as the encoding quality, any changes you make to the properties will be overwritten with values based on the current camera settings.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Stereo, Professional audio sampling rate (48 kHz), 192 kilobits per second (kbps) data transfer rate.
     * @type {Integer (Int32)}
     */
    static High => 1

    /**
     * Stereo, CD quality sampling rate (44.1 kHz), 128 kilobits per second (kbps) data transfer rate.
     * @type {Integer (Int32)}
     */
    static Medium => 2

    /**
     * Mono, CD quality sampling rate (44.1 kHz), 96 kilobits per second (kbps) data transfer rate.
     * @type {Integer (Int32)}
     */
    static Low => 3
}

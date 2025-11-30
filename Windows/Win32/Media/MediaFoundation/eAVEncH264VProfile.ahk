#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies an H.264 video profile.
 * @remarks
 * 
 * These values are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-mpeg2-profile-attribute">MF_MT_MPEG2_PROFILE</a> attribute.
 * 
 * These values are also used with <a href="https://docs.microsoft.com/windows/desktop/medfound/camera-encoder-h264-uvc-1-5">H.264 UVC 1.5 camera encoders</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavench264vprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncH264VProfile extends Win32Enum{

    /**
     * The profile is unknown or not specified.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_unknown => 0

    /**
     * Simple profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_Simple => 66

    /**
     * Baseline profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_Base => 66

    /**
     * Main profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_Main => 77

    /**
     * High profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_High => 100

    /**
     * High 4:2:2 profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_422 => 122

    /**
     * High 10 profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_High10 => 110

    /**
     * High 4:4:4 profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_444 => 244

    /**
     * Extended profile.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_Extended => 88

    /**
     * Scalable base profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_ScalableBase => 83

    /**
     * Scalable high profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_ScalableHigh => 86

    /**
     * Multiview high profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_MultiviewHigh => 118

    /**
     * Stereo high profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_StereoHigh => 128

    /**
     * Constrained base profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_ConstrainedBase => 256

    /**
     * Constrained high profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_UCConstrainedHigh => 257

    /**
     * UC Constrained base profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_UCScalableConstrainedBase => 258

    /**
     * UC Constrained high profile. H.264 extension.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VProfile_UCScalableConstrainedHigh => 259
}

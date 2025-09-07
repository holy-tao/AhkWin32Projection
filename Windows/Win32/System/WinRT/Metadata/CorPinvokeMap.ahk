#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorPinvokeMap{

    /**
     * @type {Integer (Int32)}
     */
    static pmNoMangle => 1

    /**
     * @type {Integer (Int32)}
     */
    static pmCharSetMask => 6

    /**
     * @type {Integer (Int32)}
     */
    static pmCharSetNotSpec => 0

    /**
     * @type {Integer (Int32)}
     */
    static pmCharSetAnsi => 2

    /**
     * @type {Integer (Int32)}
     */
    static pmCharSetUnicode => 4

    /**
     * @type {Integer (Int32)}
     */
    static pmCharSetAuto => 6

    /**
     * @type {Integer (Int32)}
     */
    static pmBestFitUseAssem => 0

    /**
     * @type {Integer (Int32)}
     */
    static pmBestFitEnabled => 16

    /**
     * @type {Integer (Int32)}
     */
    static pmBestFitDisabled => 32

    /**
     * @type {Integer (Int32)}
     */
    static pmBestFitMask => 48

    /**
     * @type {Integer (Int32)}
     */
    static pmThrowOnUnmappableCharUseAssem => 0

    /**
     * @type {Integer (Int32)}
     */
    static pmThrowOnUnmappableCharEnabled => 4096

    /**
     * @type {Integer (Int32)}
     */
    static pmThrowOnUnmappableCharDisabled => 8192

    /**
     * @type {Integer (Int32)}
     */
    static pmThrowOnUnmappableCharMask => 12288

    /**
     * @type {Integer (Int32)}
     */
    static pmSupportsLastError => 64

    /**
     * @type {Integer (Int32)}
     */
    static pmCallConvMask => 1792

    /**
     * @type {Integer (Int32)}
     */
    static pmCallConvWinapi => 256

    /**
     * @type {Integer (Int32)}
     */
    static pmCallConvCdecl => 512

    /**
     * @type {Integer (Int32)}
     */
    static pmCallConvStdcall => 768

    /**
     * @type {Integer (Int32)}
     */
    static pmCallConvThiscall => 1024

    /**
     * @type {Integer (Int32)}
     */
    static pmCallConvFastcall => 1280

    /**
     * @type {Integer (Int32)}
     */
    static pmMaxValue => 65535
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of the SetDefaultSpatialAudioFormatResult, whether it failed (and why) or succeeded.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.setdefaultspatialaudioformatstatus
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class SetDefaultSpatialAudioFormatStatus extends Win32Enum{

    /**
     * The call succeeded and the format was set.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The caller doesn't have permission to change/set this spatial audio format.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 1

    /**
     * There is no current license for this spatial audio format.
     * @type {Integer (Int32)}
     */
    static LicenseExpired => 2

    /**
     * This spatial audio format is licensed, but not for this endpoint.
     * @type {Integer (Int32)}
     */
    static LicenseNotValidForAudioEndpoint => 3

    /**
     * This audio endpoint doesn't support this format.
     * @type {Integer (Int32)}
     */
    static NotSupportedOnAudioEndpoint => 4

    /**
     * Something unexpected went wrong.
     * @type {Integer (Int32)}
     */
    static UnknownError => 5
}

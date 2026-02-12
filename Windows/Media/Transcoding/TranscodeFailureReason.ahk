#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason the transcode operation failed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.transcodefailurereason
 * @namespace Windows.Media.Transcoding
 * @version WindowsRuntime 1.4
 */
class TranscodeFailureReason extends Win32Enum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Reason unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Profile is invalid.
     * @type {Integer (Int32)}
     */
    static InvalidProfile => 2

    /**
     * The codec was not found.
     * @type {Integer (Int32)}
     */
    static CodecNotFound => 3
}

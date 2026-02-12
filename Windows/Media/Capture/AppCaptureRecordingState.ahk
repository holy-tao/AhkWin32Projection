#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of an app capture recording.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturerecordingstate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureRecordingState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static InProgress => 0

    /**
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * @type {Integer (Int32)}
     */
    static Failed => 2
}

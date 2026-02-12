#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Determines whether the user interface for capturing from the attached camera allows capture of photos, videos, or both photos and videos.
 * @remarks
 * > [!NOTE]
 * > You should not specify the **webcam** or **microphone** capabilities in your app manifest file if you are using **CameraCaptureUI**. If you do so, your app will be displayed in the device's camera privacy settings, but even if the user denies camera access to your app, it will not prevent the **CameraCaptureUI** from capturing media. This is because the Windows built-in camera app is a trusted first-party app that requires the user to initiate photo, audio, and video capture with a button press. Your app may fail Windows Application Certification Kit certification when submitted to the Store if you specify the **webcam** or **microphone** capabilities when using **CameraCaptureUI**.
 * 
 * You must specify the **webcam** or **microphone** capabilities in your app manifest file if you are using [MediaCapture](mediacapture.md) to capture audio, photos, or video programmatically.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuimode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraCaptureUIMode extends Win32Enum{

    /**
     * Either a photo or video can be captured.
     * @type {Integer (Int32)}
     */
    static PhotoOrVideo => 0

    /**
     * The user can only capture a photo.
     * @type {Integer (Int32)}
     */
    static Photo => 1

    /**
     * The user can only capture a video.
     * @type {Integer (Int32)}
     */
    static Video => 2
}

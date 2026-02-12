#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Determines the format for saving captured videos.
 * @remarks
 * Set the video capture format for [CameraCaptureUI](cameracaptureui.md) by setting the [CameraCaptureUIPhotoCaptureSettings.Format](cameracaptureuivideocapturesettings_format.md) property to one of the values of this enumeration.
 * 
 * For how-to guidance for using **CameraCaptureUI** to capture photos and video, see [Capture photos and video in a desktop app with the Windows built-in camera UI](/windows/apps/develop/camera/cameracaptureui).
 * 
 * 
 * 
 * > [!NOTE]
 * > You should not specify the **webcam** or **microphone** capabilities in your app manifest file if you are using **CameraCaptureUI**. If you do so, your app will be displayed in the device's camera privacy settings, but even if the user denies camera access to your app, it will not prevent the **CameraCaptureUI** from capturing media. This is because the Windows built-in camera app is a trusted first-party app that requires the user to initiate photo, audio, and video capture with a button press. Your app may fail Windows Application Certification Kit certification when submitted to the Store if you specify the **webcam** or **microphone** capabilities when using **CameraCaptureUI**.
 * 
 * You must specify the **webcam** or **microphone** capabilities in your app manifest file if you are using [MediaCapture](mediacapture.md) to capture audio, photos, or video programmatically.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuivideoformat
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraCaptureUIVideoFormat extends Win32Enum{

    /**
     * MP4/H.264/AAC format.
     * @type {Integer (Int32)}
     */
    static Mp4 => 0

    /**
     * WMV format.
     * @type {Integer (Int32)}
     */
    static Wmv => 1
}

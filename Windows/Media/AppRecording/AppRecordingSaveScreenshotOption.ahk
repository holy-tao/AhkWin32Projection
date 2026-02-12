#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the options used for saving a screenshot with [SaveScreenshotToFilesAsync](apprecordingmanager_savescreenshottofilesasync_1063354614.md).
 * @remarks
 * Specifying this value provides the system with a hint to help it perform the proper colorspace conversions when saving a screenshot. If the content of the app window contains HDR content, the app should specify **HdrContentVisible**, otherwise the app should specify **None**.
 * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingsavescreenshotoption
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class AppRecordingSaveScreenshotOption extends Win32Enum{

    /**
     * No option is specified.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The contents of the app window includes High Dynamic Range (HDR) content.
     * @type {Integer (Int32)}
     */
    static HdrContentVisible => 1
}

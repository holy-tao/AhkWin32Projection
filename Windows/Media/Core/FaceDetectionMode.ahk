#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the mode used for face detection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.facedetectionmode
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class FaceDetectionMode extends Win32Enum{

    /**
     * The speed of face detection is prioritized over the accuracy of the face detection results.
     * @type {Integer (Int32)}
     */
    static HighPerformance => 0

    /**
     * The prioritization of detection speed and result quality are balanced.
     * @type {Integer (Int32)}
     */
    static Balanced => 1

    /**
     * The accuracy of face detection results is prioritized over the speed of face detection.
     * @type {Integer (Int32)}
     */
    static HighQuality => 2
}

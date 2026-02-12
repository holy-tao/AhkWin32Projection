#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the preferred memory location for captured video frames.
 * @remarks
 * Specify a memory preference by setting the [MemoryPreference](mediacaptureinitializationsettings_memorypreference.md) property of the [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md) object before calling [MediaCapture.InitializeAsync](/uwp/api/windows.media.capture.mediacapture.initializeasync).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturememorypreference
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureMemoryPreference extends Win32Enum{

    /**
     * The system dynamically chooses between CPU and GPU memory.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * CPU memory is used.
     * @type {Integer (Int32)}
     */
    static Cpu => 1
}

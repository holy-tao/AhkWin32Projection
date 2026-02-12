#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the way that the system should manage frames acquired from a [MediaFrameReader](/uwp/api/windows.media.capture.frames.mediaframereader) or a [MultiSourceMediaFrameReader](/uwp/api/windows.media.capture.frames.multisourcemediaframereader) when a new frame arrives before the app has finished processing the previous frame.
 * @remarks
 * Use a value from this enumeration when setting the [MediaFrameReader.AcquisitionMode](/uwp/api/windows.media.capture.frames.mediaframereader.AcquisitionMode) property or the [MultiSourceMediaFrameReader.AcquisitionMode](/uwp/api/windows.media.capture.frames.multisourcemediaframereader.AcquisitionMode) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframereaderacquisitionmode
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameReaderAcquisitionMode extends Win32Enum{

    /**
     * Frames that arrive while the app's [FrameArrived](/uwp/api/windows.media.capture.frames.mediaframereader.FrameArrived) event handler is executing are dropped. This mode works well for scenarios where processing the most current frame is prioritized, such as real-time computer vision applications.
     * @type {Integer (Int32)}
     */
    static Realtime => 0

    /**
     * Frames that arrive while the app's [FrameArrived](/uwp/api/windows.media.capture.frames.mediaframereader.FrameArrived) event handler is executing are buffered in memory by the system. The **FrameArrived** event is raised for each buffered frame when the event handler for the previous frame has completed. This mode is intended for apps for which the sequence of frames is critical and for which dropped frames will break the scenario. Note that once the system's memory limit for buffered frames has been reached, no more frames will be acquired until the app processes buffered frames, freeing memory for the acquisition of additional frames.
     * @type {Integer (Int32)}
     */
    static Buffered => 1
}

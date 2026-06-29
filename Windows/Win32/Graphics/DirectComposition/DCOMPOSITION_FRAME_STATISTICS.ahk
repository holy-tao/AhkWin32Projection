#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }

/**
 * Describes timing and composition statistics for a frame.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-getframestatistics">IDCompositionDevice::GetFrameStatistics</a> method fills this structure. An application can use the information in this structure to estimate the timestamp of the next few frames that will be started by the composition engine. Note that this is only an estimate because the composition engine may or may not compose the next frame, depending on whether any active animations or other work are pending for that frame. In addition, the composition engine may change frame rates according to the cost of composing individual frames.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ns-dcomptypes-dcomposition_frame_statistics
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
export default struct DCOMPOSITION_FRAME_STATISTICS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The time stamp of the last batch of commands to be processed by the composition engine.
     */
    lastFrameTime : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a></b>
     * 
     * The rate at which the composition engine is producing frames, in frames per second.
     */
    currentCompositionRate : DXGI_RATIONAL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The current time as computed by the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> function.
     */
    currentTime : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The units in which the <b>lastFrameTime</b> and <b>currentTime</b> members are specified, in Hertz.
     */
    timeFrequency : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The estimated time when the next frame will be displayed.
     */
    nextEstimatedFrameTime : Int64

}

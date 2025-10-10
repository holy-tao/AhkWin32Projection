#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_RATIONAL.ahk

/**
 * Describes timing and composition statistics for a frame.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-getframestatistics">IDCompositionDevice::GetFrameStatistics</a> method fills this structure. An application can use the information in this structure to estimate the timestamp of the next few frames that will be started by the composition engine. Note that this is only an estimate because the composition engine may or may not compose the next frame, depending on whether any active animations or other work are pending for that frame. In addition, the composition engine may change frame rates according to the cost of composing individual frames.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dcomptypes/ns-dcomptypes-dcomposition_frame_statistics
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class DCOMPOSITION_FRAME_STATISTICS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The time stamp of the last batch of commands to be processed by the composition engine.
     * @type {Integer}
     */
    lastFrameTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a></b>
     * 
     * The rate at which the composition engine is producing frames, in frames per second.
     * @type {DXGI_RATIONAL}
     */
    currentCompositionRate{
        get {
            if(!this.HasProp("__currentCompositionRate"))
                this.__currentCompositionRate := DXGI_RATIONAL(this.ptr + 8)
            return this.__currentCompositionRate
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The current time as computed by the <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> function.
     * @type {Integer}
     */
    currentTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The units in which the <b>lastFrameTime</b> and <b>currentTime</b> members are specified, in Hertz.
     * @type {Integer}
     */
    timeFrequency {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The estimated time when the next frame will be displayed.
     * @type {Integer}
     */
    nextEstimatedFrameTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }
}

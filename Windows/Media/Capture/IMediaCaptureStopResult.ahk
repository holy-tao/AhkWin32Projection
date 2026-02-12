#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\VideoFrame.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureStopResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureStopResult
     * @type {Guid}
     */
    static IID => Guid("{f9db6a2a-a092-4ad1-97d4-f201f9d082db}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LastFrame", "get_RecordDuration"]

    /**
     * @type {VideoFrame} 
     */
    LastFrame {
        get => this.get_LastFrame()
    }

    /**
     * @type {TimeSpan} 
     */
    RecordDuration {
        get => this.get_RecordDuration()
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_LastFrame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RecordDuration() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

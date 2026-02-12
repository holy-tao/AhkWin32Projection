#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VideoMediaFrameFormat.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IDepthMediaFrameFormat extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDepthMediaFrameFormat
     * @type {Guid}
     */
    static IID => Guid("{c312cf40-d729-453e-8780-2e04f140d28e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_VideoFormat", "get_DepthScaleInMeters"]

    /**
     * @type {VideoMediaFrameFormat} 
     */
    VideoFormat {
        get => this.get_VideoFormat()
    }

    /**
     * @type {Float} 
     */
    DepthScaleInMeters {
        get => this.get_DepthScaleInMeters()
    }

    /**
     * 
     * @returns {VideoMediaFrameFormat} 
     */
    get_VideoFormat() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoMediaFrameFormat(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DepthScaleInMeters() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

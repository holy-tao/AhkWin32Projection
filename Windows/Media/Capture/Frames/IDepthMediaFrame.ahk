#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameReference.ahk
#Include .\VideoMediaFrame.ahk
#Include .\DepthMediaFrameFormat.ahk
#Include ..\..\Devices\Core\DepthCorrelatedCoordinateMapper.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IDepthMediaFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDepthMediaFrame
     * @type {Guid}
     */
    static IID => Guid("{47135e4f-8549-45c0-925b-80d35efdb10a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameReference", "get_VideoMediaFrame", "get_DepthFormat", "TryCreateCoordinateMapper"]

    /**
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * @type {VideoMediaFrame} 
     */
    VideoMediaFrame {
        get => this.get_VideoMediaFrame()
    }

    /**
     * @type {DepthMediaFrameFormat} 
     */
    DepthFormat {
        get => this.get_DepthFormat()
    }

    /**
     * 
     * @returns {MediaFrameReference} 
     */
    get_FrameReference() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameReference(value)
    }

    /**
     * 
     * @returns {VideoMediaFrame} 
     */
    get_VideoMediaFrame() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoMediaFrame(value)
    }

    /**
     * 
     * @returns {DepthMediaFrameFormat} 
     */
    get_DepthFormat() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DepthMediaFrameFormat(value)
    }

    /**
     * 
     * @param {CameraIntrinsics} cameraIntrinsics_ 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {DepthCorrelatedCoordinateMapper} 
     */
    TryCreateCoordinateMapper(cameraIntrinsics_, coordinateSystem) {
        result := ComCall(9, this, "ptr", cameraIntrinsics_, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DepthCorrelatedCoordinateMapper(value)
    }
}

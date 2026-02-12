#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaFrameReference.ahk
#Include .\VideoMediaFrameFormat.ahk
#Include ..\..\..\Graphics\Imaging\SoftwareBitmap.ahk
#Include ..\..\..\Graphics\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\..\Devices\Core\CameraIntrinsics.ahk
#Include .\InfraredMediaFrame.ahk
#Include .\DepthMediaFrame.ahk
#Include ..\..\VideoFrame.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IVideoMediaFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoMediaFrame
     * @type {Guid}
     */
    static IID => Guid("{00dd4ccb-32bd-4fe1-a013-7cc13cf5dbcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FrameReference", "get_VideoFormat", "get_SoftwareBitmap", "get_Direct3DSurface", "get_CameraIntrinsics", "get_InfraredMediaFrame", "get_DepthMediaFrame", "GetVideoFrame"]

    /**
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * @type {VideoMediaFrameFormat} 
     */
    VideoFormat {
        get => this.get_VideoFormat()
    }

    /**
     * @type {SoftwareBitmap} 
     */
    SoftwareBitmap {
        get => this.get_SoftwareBitmap()
    }

    /**
     * @type {IDirect3DSurface} 
     */
    Direct3DSurface {
        get => this.get_Direct3DSurface()
    }

    /**
     * @type {CameraIntrinsics} 
     */
    CameraIntrinsics {
        get => this.get_CameraIntrinsics()
    }

    /**
     * @type {InfraredMediaFrame} 
     */
    InfraredMediaFrame {
        get => this.get_InfraredMediaFrame()
    }

    /**
     * @type {DepthMediaFrame} 
     */
    DepthMediaFrame {
        get => this.get_DepthMediaFrame()
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
     * @returns {VideoMediaFrameFormat} 
     */
    get_VideoFormat() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoMediaFrameFormat(value)
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3DSurface() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface(value)
    }

    /**
     * 
     * @returns {CameraIntrinsics} 
     */
    get_CameraIntrinsics() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraIntrinsics(value)
    }

    /**
     * 
     * @returns {InfraredMediaFrame} 
     */
    get_InfraredMediaFrame() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InfraredMediaFrame(value)
    }

    /**
     * 
     * @returns {DepthMediaFrame} 
     */
    get_DepthMediaFrame() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DepthMediaFrame(value)
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    GetVideoFrame() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }
}

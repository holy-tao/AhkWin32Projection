#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Graphics\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\VideoFrame.ahk
#Include ..\Editing\MediaOverlay.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class ICompositeVideoFrameContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositeVideoFrameContext
     * @type {Guid}
     */
    static IID => Guid("{6c30024b-f514-4278-a5f7-b9188049d110}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SurfacesToOverlay", "get_BackgroundFrame", "get_OutputFrame", "GetOverlayForSurface"]

    /**
     * @type {IVectorView<IDirect3DSurface>} 
     */
    SurfacesToOverlay {
        get => this.get_SurfacesToOverlay()
    }

    /**
     * @type {VideoFrame} 
     */
    BackgroundFrame {
        get => this.get_BackgroundFrame()
    }

    /**
     * @type {VideoFrame} 
     */
    OutputFrame {
        get => this.get_OutputFrame()
    }

    /**
     * 
     * @returns {IVectorView<IDirect3DSurface>} 
     */
    get_SurfacesToOverlay() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(IDirect3DSurface, value)
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_BackgroundFrame() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }

    /**
     * 
     * @returns {VideoFrame} 
     */
    get_OutputFrame() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(value)
    }

    /**
     * 
     * @param {IDirect3DSurface} surfaceToOverlay 
     * @returns {MediaOverlay} 
     */
    GetOverlayForSurface(surfaceToOverlay) {
        result := ComCall(9, this, "ptr", surfaceToOverlay, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaOverlay(value)
    }
}

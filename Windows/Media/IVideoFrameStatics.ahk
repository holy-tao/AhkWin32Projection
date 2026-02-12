#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\VideoFrame.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IVideoFrameStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrameStatics
     * @type {Guid}
     */
    static IID => Guid("{ab2a556f-6111-4b33-8ec3-2b209a02e17a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAsDirect3D11SurfaceBacked", "CreateAsDirect3D11SurfaceBackedWithDevice", "CreateWithSoftwareBitmap", "CreateWithDirect3D11Surface"]

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {VideoFrame} 
     */
    CreateAsDirect3D11SurfaceBacked(format, width, height) {
        result := ComCall(6, this, "int", format, "int", width, "int", height, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(result_)
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {IDirect3DDevice} device 
     * @returns {VideoFrame} 
     */
    CreateAsDirect3D11SurfaceBackedWithDevice(format, width, height, device) {
        result := ComCall(7, this, "int", format, "int", width, "int", height, "ptr", device, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(result_)
    }

    /**
     * 
     * @param {SoftwareBitmap} bitmap_ 
     * @returns {VideoFrame} 
     */
    CreateWithSoftwareBitmap(bitmap_) {
        result := ComCall(8, this, "ptr", bitmap_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(result_)
    }

    /**
     * 
     * @param {IDirect3DSurface} surface 
     * @returns {VideoFrame} 
     */
    CreateWithDirect3D11Surface(surface) {
        result := ComCall(9, this, "ptr", surface, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoFrame(result_)
    }
}

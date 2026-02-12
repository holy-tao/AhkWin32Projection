#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Graphics\Imaging\SoftwareBitmap.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Graphics\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a frame of video data.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.media.core.interop/nn-windows-media-core-interop-ivideoframenative
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IVideoFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrame
     * @type {Guid}
     */
    static IID => Guid("{0cc06625-90fc-4c92-bd95-7ded21819d1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SoftwareBitmap", "CopyToAsync", "get_Direct3DSurface"]

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
     * 
     * @returns {SoftwareBitmap} 
     */
    get_SoftwareBitmap() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }

    /**
     * 
     * @param {VideoFrame} frame_ 
     * @returns {IAsyncAction} 
     */
    CopyToAsync(frame_) {
        result := ComCall(7, this, "ptr", frame_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3DSurface() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface(value)
    }
}

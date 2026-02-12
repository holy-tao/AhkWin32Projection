#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPlayerSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayer4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayer4
     * @type {Guid}
     */
    static IID => Guid("{80035db0-7448-4770-afcf-2a57450914c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSurfaceSize", "GetSurface"]

    /**
     * 
     * @param {SIZE} size_ 
     * @returns {HRESULT} 
     */
    SetSurfaceSize(size_) {
        result := ComCall(6, this, "ptr", size_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Compositor} compositor_ 
     * @returns {MediaPlayerSurface} 
     */
    GetSurface(compositor_) {
        result := ComCall(7, this, "ptr", compositor_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPlayerSurface(result_)
    }
}

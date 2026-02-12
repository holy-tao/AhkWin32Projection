#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaClip.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaClipStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaClipStatics2
     * @type {Guid}
     */
    static IID => Guid("{5b1dd7b3-854e-4d9b-877d-4774a556cd12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromSurface"]

    /**
     * 
     * @param {IDirect3DSurface} surface 
     * @param {TimeSpan} originalDuration 
     * @returns {MediaClip} 
     */
    CreateFromSurface(surface, originalDuration) {
        result := ComCall(6, this, "ptr", surface, "ptr", originalDuration, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaClip(value)
    }
}

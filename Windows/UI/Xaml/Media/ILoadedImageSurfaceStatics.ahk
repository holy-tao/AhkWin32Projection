#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\LoadedImageSurface.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ILoadedImageSurfaceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoadedImageSurfaceStatics
     * @type {Guid}
     */
    static IID => Guid("{22b8edf6-84ad-40ab-937d-4871613e765d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartLoadFromUriWithSize", "StartLoadFromUri1", "StartLoadFromStreamWithSize", "StartLoadFromStream1"]

    /**
     * 
     * @param {Uri} uri_ 
     * @param {SIZE} desiredMaxSize 
     * @returns {LoadedImageSurface} 
     */
    StartLoadFromUriWithSize(uri_, desiredMaxSize) {
        result := ComCall(6, this, "ptr", uri_, "ptr", desiredMaxSize, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoadedImageSurface(result_)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {LoadedImageSurface} 
     */
    StartLoadFromUri1(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoadedImageSurface(result_)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @param {SIZE} desiredMaxSize 
     * @returns {LoadedImageSurface} 
     */
    StartLoadFromStreamWithSize(stream, desiredMaxSize) {
        result := ComCall(8, this, "ptr", stream, "ptr", desiredMaxSize, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoadedImageSurface(result_)
    }

    /**
     * 
     * @param {IRandomAccessStream} stream 
     * @returns {LoadedImageSurface} 
     */
    StartLoadFromStream1(stream) {
        result := ComCall(9, this, "ptr", stream, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoadedImageSurface(result_)
    }
}

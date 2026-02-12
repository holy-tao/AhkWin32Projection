#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaClip.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaClipStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaClipStatics
     * @type {Guid}
     */
    static IID => Guid("{fa402b68-928f-43c4-bc6e-783a1a359656}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromColor", "CreateFromFileAsync", "CreateFromImageFileAsync"]

    /**
     * 
     * @param {Color} color_ 
     * @param {TimeSpan} originalDuration 
     * @returns {MediaClip} 
     */
    CreateFromColor(color_, originalDuration) {
        result := ComCall(6, this, "ptr", color_, "ptr", originalDuration, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaClip(value)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<MediaClip>} 
     */
    CreateFromFileAsync(file_) {
        result := ComCall(7, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaClip, operation)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {TimeSpan} originalDuration 
     * @returns {IAsyncOperation<MediaClip>} 
     */
    CreateFromImageFileAsync(file_, originalDuration) {
        result := ComCall(8, this, "ptr", file_, "ptr", originalDuration, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaClip, operation)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundAudioTrack.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IBackgroundAudioTrackStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundAudioTrackStatics
     * @type {Guid}
     */
    static IID => Guid("{d9b1c0d7-d018-42a8-a559-cb4d9e97e664}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromEmbeddedAudioTrack", "CreateFromFileAsync"]

    /**
     * 
     * @param {EmbeddedAudioTrack} embeddedAudioTrack_ 
     * @returns {BackgroundAudioTrack} 
     */
    CreateFromEmbeddedAudioTrack(embeddedAudioTrack_) {
        result := ComCall(6, this, "ptr", embeddedAudioTrack_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundAudioTrack(value)
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<BackgroundAudioTrack>} 
     */
    CreateFromFileAsync(file_) {
        result := ComCall(7, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BackgroundAudioTrack, operation)
    }
}

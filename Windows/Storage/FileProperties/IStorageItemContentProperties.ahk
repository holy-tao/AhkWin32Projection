#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MusicProperties.ahk
#Include .\VideoProperties.ahk
#Include .\ImageProperties.ahk
#Include .\DocumentProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class IStorageItemContentProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemContentProperties
     * @type {Guid}
     */
    static IID => Guid("{05294bad-bc38-48bf-85d7-770e0e2ae0ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMusicPropertiesAsync", "GetVideoPropertiesAsync", "GetImagePropertiesAsync", "GetDocumentPropertiesAsync"]

    /**
     * 
     * @returns {IAsyncOperation<MusicProperties>} 
     */
    GetMusicPropertiesAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MusicProperties, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<VideoProperties>} 
     */
    GetVideoPropertiesAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VideoProperties, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<ImageProperties>} 
     */
    GetImagePropertiesAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ImageProperties, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<DocumentProperties>} 
     */
    GetDocumentPropertiesAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DocumentProperties, operation)
    }
}

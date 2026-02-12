#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PhotoImportSource.ahk
#Include ..\..\Storage\IStorageFolder.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\PhotoImportFindItemsResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportSession
     * @type {Guid}
     */
    static IID => Guid("{aa63916e-ecdb-4efe-94c6-5f5cafe34cfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "get_SessionId", "put_DestinationFolder", "get_DestinationFolder", "put_AppendSessionDateToDestinationFolder", "get_AppendSessionDateToDestinationFolder", "put_SubfolderCreationMode", "get_SubfolderCreationMode", "put_DestinationFileNamePrefix", "get_DestinationFileNamePrefix", "FindItemsAsync"]

    /**
     * @type {PhotoImportSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {Guid} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {IStorageFolder} 
     */
    DestinationFolder {
        get => this.get_DestinationFolder()
        set => this.put_DestinationFolder(value)
    }

    /**
     * @type {Boolean} 
     */
    AppendSessionDateToDestinationFolder {
        get => this.get_AppendSessionDateToDestinationFolder()
        set => this.put_AppendSessionDateToDestinationFolder(value)
    }

    /**
     * @type {Integer} 
     */
    SubfolderCreationMode {
        get => this.get_SubfolderCreationMode()
        set => this.put_SubfolderCreationMode(value)
    }

    /**
     * @type {HSTRING} 
     */
    DestinationFileNamePrefix {
        get => this.get_DestinationFileNamePrefix()
        set => this.put_DestinationFileNamePrefix(value)
    }

    /**
     * 
     * @returns {PhotoImportSource} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoImportSource(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IStorageFolder} value 
     * @returns {HRESULT} 
     */
    put_DestinationFolder(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IStorageFolder} 
     */
    get_DestinationFolder() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageFolder(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AppendSessionDateToDestinationFolder(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AppendSessionDateToDestinationFolder() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SubfolderCreationMode(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubfolderCreationMode() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DestinationFileNamePrefix(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DestinationFileNamePrefix() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} contentTypeFilter 
     * @param {Integer} itemSelectionMode 
     * @returns {IAsyncOperationWithProgress<PhotoImportFindItemsResult, Integer>} 
     */
    FindItemsAsync(contentTypeFilter, itemSelectionMode) {
        result := ComCall(16, this, "int", contentTypeFilter, "int", itemSelectionMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(PhotoImportFindItemsResult, (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\PhotoImportSidecar.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PhotoImportVideoSegment.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportItem
     * @type {Guid}
     */
    static IID => Guid("{a9d07e76-9bfc-43b8-b356-633b6a988c9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_ItemKey", "get_ContentType", "get_SizeInBytes", "get_Date", "get_Sibling", "get_Sidecars", "get_VideoSegments", "get_IsSelected", "put_IsSelected", "get_Thumbnail", "get_ImportedFileNames", "get_DeletedFileNames"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    ItemKey {
        get => this.get_ItemKey()
    }

    /**
     * @type {Integer} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * @type {Integer} 
     */
    SizeInBytes {
        get => this.get_SizeInBytes()
    }

    /**
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * @type {PhotoImportSidecar} 
     */
    Sibling {
        get => this.get_Sibling()
    }

    /**
     * @type {IVectorView<PhotoImportSidecar>} 
     */
    Sidecars {
        get => this.get_Sidecars()
    }

    /**
     * @type {IVectorView<PhotoImportVideoSegment>} 
     */
    VideoSegments {
        get => this.get_VideoSegments()
    }

    /**
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
        set => this.put_IsSelected(value)
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    ImportedFileNames {
        get => this.get_ImportedFileNames()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    DeletedFileNames {
        get => this.get_DeletedFileNames()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemKey() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SizeInBytes() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        value := DateTime()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PhotoImportSidecar} 
     */
    get_Sibling() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhotoImportSidecar(value)
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportSidecar>} 
     */
    get_Sidecars() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PhotoImportSidecar, value)
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportVideoSegment>} 
     */
    get_VideoSegments() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PhotoImportVideoSegment, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSelected(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Thumbnail() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ImportedFileNames() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DeletedFileNames() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }
}

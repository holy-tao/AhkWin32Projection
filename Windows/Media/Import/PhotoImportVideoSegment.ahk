#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoImportVideoSegment.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an imported video segment.
 * @remarks
 * Video segments are produced by some video recorders that split long video files in multiple segments. The reasons might be file format limitations, file size limitations on the storage media file system, or some inherited arbitrary convention, such as the 20mn standard duration of a 35mm movie reel. The naming of the main (“first”) segment and the subsequent (“continuation”) segments depends on the video recorder. The correlation between the segments can be made on based on the full path + the video type + the last four digits, looking for digits in the first four characters to decide which one it the main file. The last continuation is typically smaller than the main file, and the timestamps may also reflect the chronological sequence. Video segments can have siblings.
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportvideosegment
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportVideoSegment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoImportVideoSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoImportVideoSegment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the imported video segment.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportvideosegment.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the size of the imported video segment, in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportvideosegment.sizeinbytes
     * @type {Integer} 
     */
    SizeInBytes {
        get => this.get_SizeInBytes()
    }

    /**
     * Gets the date of the imported video segment.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportvideosegment.date
     * @type {DateTime} 
     */
    Date {
        get => this.get_Date()
    }

    /**
     * Gets the sibling file associated with the imported video segment.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportvideosegment.sibling
     * @type {PhotoImportSidecar} 
     */
    Sibling {
        get => this.get_Sibling()
    }

    /**
     * Gets the sidecar file associated with the imported video segment.
     * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportvideosegment.sidecars
     * @type {IVectorView<PhotoImportSidecar>} 
     */
    Sidecars {
        get => this.get_Sidecars()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IPhotoImportVideoSegment")) {
            if ((queryResult := this.QueryInterface(IPhotoImportVideoSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportVideoSegment := IPhotoImportVideoSegment(outPtr)
        }

        return this.__IPhotoImportVideoSegment.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SizeInBytes() {
        if (!this.HasProp("__IPhotoImportVideoSegment")) {
            if ((queryResult := this.QueryInterface(IPhotoImportVideoSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportVideoSegment := IPhotoImportVideoSegment(outPtr)
        }

        return this.__IPhotoImportVideoSegment.get_SizeInBytes()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Date() {
        if (!this.HasProp("__IPhotoImportVideoSegment")) {
            if ((queryResult := this.QueryInterface(IPhotoImportVideoSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportVideoSegment := IPhotoImportVideoSegment(outPtr)
        }

        return this.__IPhotoImportVideoSegment.get_Date()
    }

    /**
     * 
     * @returns {PhotoImportSidecar} 
     */
    get_Sibling() {
        if (!this.HasProp("__IPhotoImportVideoSegment")) {
            if ((queryResult := this.QueryInterface(IPhotoImportVideoSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportVideoSegment := IPhotoImportVideoSegment(outPtr)
        }

        return this.__IPhotoImportVideoSegment.get_Sibling()
    }

    /**
     * 
     * @returns {IVectorView<PhotoImportSidecar>} 
     */
    get_Sidecars() {
        if (!this.HasProp("__IPhotoImportVideoSegment")) {
            if ((queryResult := this.QueryInterface(IPhotoImportVideoSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoImportVideoSegment := IPhotoImportVideoSegment(outPtr)
        }

        return this.__IPhotoImportVideoSegment.get_Sidecars()
    }

;@endregion Instance Methods
}

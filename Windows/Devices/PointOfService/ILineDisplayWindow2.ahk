#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LineDisplayCursor.ahk
#Include .\LineDisplayMarquee.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayWindow2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayWindow2
     * @type {Guid}
     */
    static IID => Guid("{a95ce2e6-bdd8-4365-8e11-de94de8dff02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Cursor", "get_Marquee", "ReadCharacterAtCursorAsync", "TryDisplayStoredBitmapAtCursorAsync", "TryDisplayStorageFileBitmapAtCursorAsync", "TryDisplayStorageFileBitmapAtCursorWithAlignmentAsync", "TryDisplayStorageFileBitmapAtCursorWithAlignmentAndWidthAsync", "TryDisplayStorageFileBitmapAtPointAsync", "TryDisplayStorageFileBitmapAtPointWithWidthAsync"]

    /**
     * @type {LineDisplayCursor} 
     */
    Cursor {
        get => this.get_Cursor()
    }

    /**
     * @type {LineDisplayMarquee} 
     */
    Marquee {
        get => this.get_Marquee()
    }

    /**
     * 
     * @returns {LineDisplayCursor} 
     */
    get_Cursor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayCursor(value)
    }

    /**
     * 
     * @returns {LineDisplayMarquee} 
     */
    get_Marquee() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayMarquee(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    ReadCharacterAtCursorAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), result_)
    }

    /**
     * 
     * @param {LineDisplayStoredBitmap} bitmap_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayStoredBitmapAtCursorAsync(bitmap_) {
        result := ComCall(9, this, "ptr", bitmap_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayStorageFileBitmapAtCursorAsync(bitmap_) {
        result := ComCall(10, this, "ptr", bitmap_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @param {Integer} horizontalAlignment_ 
     * @param {Integer} verticalAlignment_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayStorageFileBitmapAtCursorWithAlignmentAsync(bitmap_, horizontalAlignment_, verticalAlignment_) {
        result := ComCall(11, this, "ptr", bitmap_, "int", horizontalAlignment_, "int", verticalAlignment_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @param {Integer} horizontalAlignment_ 
     * @param {Integer} verticalAlignment_ 
     * @param {Integer} widthInPixels 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayStorageFileBitmapAtCursorWithAlignmentAndWidthAsync(bitmap_, horizontalAlignment_, verticalAlignment_, widthInPixels) {
        result := ComCall(12, this, "ptr", bitmap_, "int", horizontalAlignment_, "int", verticalAlignment_, "int", widthInPixels, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @param {POINT} offsetInPixels 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayStorageFileBitmapAtPointAsync(bitmap_, offsetInPixels) {
        result := ComCall(13, this, "ptr", bitmap_, "ptr", offsetInPixels, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @param {POINT} offsetInPixels 
     * @param {Integer} widthInPixels 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDisplayStorageFileBitmapAtPointWithWidthAsync(bitmap_, offsetInPixels, widthInPixels) {
        result := ComCall(14, this, "ptr", bitmap_, "ptr", offsetInPixels, "int", widthInPixels, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}

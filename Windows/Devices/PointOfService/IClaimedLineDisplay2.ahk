#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include .\LineDisplayCustomGlyphs.ahk
#Include .\LineDisplayAttributes.ahk
#Include .\LineDisplayWindow.ahk
#Include .\LineDisplayStoredBitmap.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IClaimedLineDisplay2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClaimedLineDisplay2
     * @type {Guid}
     */
    static IID => Guid("{a31c75ed-41f5-4e76-a074-795e47a46e97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatisticsAsync", "CheckHealthAsync", "CheckPowerStatusAsync", "add_StatusUpdated", "remove_StatusUpdated", "get_SupportedScreenSizesInCharacters", "get_MaxBitmapSizeInPixels", "get_SupportedCharacterSets", "get_CustomGlyphs", "GetAttributes", "TryUpdateAttributesAsync", "TrySetDescriptorAsync", "TryClearDescriptorsAsync", "TryCreateWindowAsync", "TryStoreStorageFileBitmapAsync", "TryStoreStorageFileBitmapWithAlignmentAsync", "TryStoreStorageFileBitmapWithAlignmentAndWidthAsync"]

    /**
     * @type {IVectorView<SIZE>} 
     */
    SupportedScreenSizesInCharacters {
        get => this.get_SupportedScreenSizesInCharacters()
    }

    /**
     * @type {SIZE} 
     */
    MaxBitmapSizeInPixels {
        get => this.get_MaxBitmapSizeInPixels()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedCharacterSets {
        get => this.get_SupportedCharacterSets()
    }

    /**
     * @type {LineDisplayCustomGlyphs} 
     */
    CustomGlyphs {
        get => this.get_CustomGlyphs()
    }

    /**
     * 
     * @param {IIterable<HSTRING>} statisticsCategories 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetStatisticsAsync(statisticsCategories) {
        result := ComCall(6, this, "ptr", statisticsCategories, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {Integer} level 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    CheckHealthAsync(level) {
        result := ComCall(7, this, "int", level, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    CheckPowerStatusAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedLineDisplay, LineDisplayStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<SIZE>} 
     */
    get_SupportedScreenSizesInCharacters() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetSIZE(), value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxBitmapSizeInPixels() {
        value := SIZE()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCharacterSets() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {LineDisplayCustomGlyphs} 
     */
    get_CustomGlyphs() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayCustomGlyphs(value)
    }

    /**
     * 
     * @returns {LineDisplayAttributes} 
     */
    GetAttributes() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayAttributes(value)
    }

    /**
     * 
     * @param {LineDisplayAttributes} attributes 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryUpdateAttributesAsync(attributes) {
        result := ComCall(16, this, "ptr", attributes, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Integer} descriptor 
     * @param {Integer} descriptorState 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetDescriptorAsync(descriptor, descriptorState) {
        result := ComCall(17, this, "uint", descriptor, "int", descriptorState, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryClearDescriptorsAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {RECT} viewport 
     * @param {SIZE} windowSize 
     * @returns {IAsyncOperation<LineDisplayWindow>} 
     */
    TryCreateWindowAsync(viewport, windowSize) {
        result := ComCall(19, this, "ptr", viewport, "ptr", windowSize, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LineDisplayWindow, result_)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @returns {IAsyncOperation<LineDisplayStoredBitmap>} 
     */
    TryStoreStorageFileBitmapAsync(bitmap_) {
        result := ComCall(20, this, "ptr", bitmap_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LineDisplayStoredBitmap, result_)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @param {Integer} horizontalAlignment_ 
     * @param {Integer} verticalAlignment_ 
     * @returns {IAsyncOperation<LineDisplayStoredBitmap>} 
     */
    TryStoreStorageFileBitmapWithAlignmentAsync(bitmap_, horizontalAlignment_, verticalAlignment_) {
        result := ComCall(21, this, "ptr", bitmap_, "int", horizontalAlignment_, "int", verticalAlignment_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LineDisplayStoredBitmap, result_)
    }

    /**
     * 
     * @param {StorageFile} bitmap_ 
     * @param {Integer} horizontalAlignment_ 
     * @param {Integer} verticalAlignment_ 
     * @param {Integer} widthInPixels 
     * @returns {IAsyncOperation<LineDisplayStoredBitmap>} 
     */
    TryStoreStorageFileBitmapWithAlignmentAndWidthAsync(bitmap_, horizontalAlignment_, verticalAlignment_, widthInPixels) {
        result := ComCall(22, this, "ptr", bitmap_, "int", horizontalAlignment_, "int", verticalAlignment_, "int", widthInPixels, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LineDisplayStoredBitmap, result_)
    }
}

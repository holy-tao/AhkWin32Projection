#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataPackagePropertySetView.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Storage\Streams\RandomAccessStreamReference.ahk
#Include ..\..\Storage\IStorageItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackageView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackageView
     * @type {Guid}
     */
    static IID => Guid("{7b840471-5900-4d85-a90b-10cb85fe3552}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Properties", "get_RequestedOperation", "ReportOperationCompleted", "get_AvailableFormats", "Contains", "GetDataAsync", "GetTextAsync", "GetCustomTextAsync", "GetUriAsync", "GetHtmlFormatAsync", "GetResourceMapAsync", "GetRtfAsync", "GetBitmapAsync", "GetStorageItemsAsync"]

    /**
     * @type {DataPackagePropertySetView} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {Integer} 
     */
    RequestedOperation {
        get => this.get_RequestedOperation()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    AvailableFormats {
        get => this.get_AvailableFormats()
    }

    /**
     * 
     * @returns {DataPackagePropertySetView} 
     */
    get_Properties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackagePropertySetView(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedOperation() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
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
    ReportOperationCompleted(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AvailableFormats() {
        result := ComCall(9, this, "ptr*", &formatIds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), formatIds)
    }

    /**
     * The ContainsPalette function determines whether a specified VIDEOINFOHEADER structure contains a palette.
     * @param {HSTRING} formatId 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/containspalette
     */
    Contains(formatId) {
        if(formatId is String) {
            pin := HSTRING.Create(formatId)
            formatId := pin.Value
        }
        formatId := formatId is Win32Handle ? NumGet(formatId, "ptr") : formatId

        result := ComCall(10, this, "ptr", formatId, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} formatId 
     * @returns {IAsyncOperation<IInspectable>} 
     */
    GetDataAsync(formatId) {
        if(formatId is String) {
            pin := HSTRING.Create(formatId)
            formatId := pin.Value
        }
        formatId := formatId is Win32Handle ? NumGet(formatId, "ptr") : formatId

        result := ComCall(11, this, "ptr", formatId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IInspectable, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetTextAsync() {
        result := ComCall(12, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} formatId 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetCustomTextAsync(formatId) {
        if(formatId is String) {
            pin := HSTRING.Create(formatId)
            formatId := pin.Value
        }
        formatId := formatId is Win32Handle ? NumGet(formatId, "ptr") : formatId

        result := ComCall(13, this, "ptr", formatId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Uri>} 
     */
    GetUriAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Uri, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetHtmlFormatAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IMapView<HSTRING, RandomAccessStreamReference>>} 
     */
    GetResourceMapAsync() {
        result := ComCall(16, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), RandomAccessStreamReference), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetRtfAsync() {
        result := ComCall(17, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     */
    GetBitmapAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RandomAccessStreamReference, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     */
    GetStorageItemsAsync() {
        result := ComCall(19, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IStorageItem), operation)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\FaceTracker.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.FaceAnalysis
 * @version WindowsRuntime 1.4
 */
class IFaceTrackerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaceTrackerStatics
     * @type {Guid}
     */
    static IID => Guid("{e9629198-1801-3fa5-932e-31d767af6c4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAsync", "GetSupportedBitmapPixelFormats", "IsBitmapPixelFormatSupported", "get_IsSupported"]

    /**
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * Creates an asynchronous bind context for use with asynchronous monikers.
     * @remarks
     * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
     * @returns {IAsyncOperation<FaceTracker>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/urlmon/nf-urlmon-createasyncbindctx
     */
    CreateAsync() {
        result := ComCall(6, this, "ptr*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FaceTracker, returnValue)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    GetSupportedBitmapPixelFormats() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @param {Integer} bitmapPixelFormat_ 
     * @returns {Boolean} 
     */
    IsBitmapPixelFormatSupported(bitmapPixelFormat_) {
        result := ComCall(8, this, "int", bitmapPixelFormat_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSupported() {
        result := ComCall(9, this, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}

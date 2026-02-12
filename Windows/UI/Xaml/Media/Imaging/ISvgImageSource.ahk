#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Uri.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class ISvgImageSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISvgImageSource
     * @type {Guid}
     */
    static IID => Guid("{03e1cec3-0ca8-4a4e-8d7c-c808a0838586}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UriSource", "put_UriSource", "get_RasterizePixelWidth", "put_RasterizePixelWidth", "get_RasterizePixelHeight", "put_RasterizePixelHeight", "add_Opened", "remove_Opened", "add_OpenFailed", "remove_OpenFailed", "SetSourceAsync"]

    /**
     * @type {Uri} 
     */
    UriSource {
        get => this.get_UriSource()
        set => this.put_UriSource(value)
    }

    /**
     * @type {Float} 
     */
    RasterizePixelWidth {
        get => this.get_RasterizePixelWidth()
        set => this.put_RasterizePixelWidth(value)
    }

    /**
     * @type {Float} 
     */
    RasterizePixelHeight {
        get => this.get_RasterizePixelHeight()
        set => this.put_RasterizePixelHeight(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_UriSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_UriSource(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RasterizePixelWidth() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RasterizePixelWidth(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RasterizePixelHeight() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RasterizePixelHeight(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SvgImageSource, SvgImageSourceOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_Opened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SvgImageSource, SvgImageSourceFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OpenFailed(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_OpenFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRandomAccessStream} streamSource 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetSourceAsync(streamSource) {
        result := ComCall(16, this, "ptr", streamSource, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}

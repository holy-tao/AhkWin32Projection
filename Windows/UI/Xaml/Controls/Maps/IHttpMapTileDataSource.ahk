#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\Collections\IMap.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IHttpMapTileDataSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMapTileDataSource
     * @type {Guid}
     */
    static IID => Guid("{9d03cb5c-fd79-4795-87be-7e54ca0b37d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UriFormatString", "put_UriFormatString", "get_AdditionalRequestHeaders", "get_AllowCaching", "put_AllowCaching", "add_UriRequested", "remove_UriRequested"]

    /**
     * @type {HSTRING} 
     */
    UriFormatString {
        get => this.get_UriFormatString()
        set => this.put_UriFormatString(value)
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    AdditionalRequestHeaders {
        get => this.get_AdditionalRequestHeaders()
    }

    /**
     * @type {Boolean} 
     */
    AllowCaching {
        get => this.get_AllowCaching()
        set => this.put_AllowCaching(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UriFormatString() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_UriFormatString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_AdditionalRequestHeaders() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCaching() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_AllowCaching(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<HttpMapTileDataSource, MapTileUriRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UriRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_UriRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ILoadedImageSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoadedImageSurface
     * @type {Guid}
     */
    static IID => Guid("{050c8313-6737-45ba-8531-33094febef55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DecodedPhysicalSize", "get_DecodedSize", "get_NaturalSize", "add_LoadCompleted", "remove_LoadCompleted"]

    /**
     * @type {SIZE} 
     */
    DecodedPhysicalSize {
        get => this.get_DecodedPhysicalSize()
    }

    /**
     * @type {SIZE} 
     */
    DecodedSize {
        get => this.get_DecodedSize()
    }

    /**
     * @type {SIZE} 
     */
    NaturalSize {
        get => this.get_NaturalSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_DecodedPhysicalSize() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_DecodedSize() {
        value := SIZE()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_NaturalSize() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<LoadedImageSurface, LoadedImageSourceLoadCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LoadCompleted(handler) {
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
    remove_LoadCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

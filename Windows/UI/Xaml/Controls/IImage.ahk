#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\ImageSource.ahk
#Include ..\Thickness.ahk
#Include ..\..\..\Media\PlayTo\PlayToSource.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains information about a localized image that is associated with an update or a category.
 * @see https://learn.microsoft.com/windows/win32/api//content/wuapi/nn-wuapi-iimageinformation
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IImage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImage
     * @type {Guid}
     */
    static IID => Guid("{495b7402-9af3-4e50-aa90-03388f3086d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "put_Source", "get_Stretch", "put_Stretch", "get_NineGrid", "put_NineGrid", "get_PlayToSource", "add_ImageFailed", "remove_ImageFailed", "add_ImageOpened", "remove_ImageOpened"]

    /**
     * @type {ImageSource} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * @type {Thickness} 
     */
    NineGrid {
        get => this.get_NineGrid()
        set => this.put_NineGrid(value)
    }

    /**
     * @type {PlayToSource} 
     */
    PlayToSource {
        get => this.get_PlayToSource()
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_Stretch(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_NineGrid() {
        value := Thickness()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_NineGrid(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_PlayToSource() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayToSource(value)
    }

    /**
     * 
     * @param {ExceptionRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageFailed(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_ImageFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageOpened(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_ImageOpened(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

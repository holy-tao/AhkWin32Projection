#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowTab.ahk
#Include ..\..\Graphics\Imaging\BitmapSize.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IWindowTabThumbnailRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowTabThumbnailRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2d558e54-9c4e-5abc-ab72-3350fb4937a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Tab", "get_RequestedSize", "get_Image", "put_Image", "GetDeferral", "get_IsCompositedOnWindow"]

    /**
     * @type {WindowTab} 
     */
    Tab {
        get => this.get_Tab()
    }

    /**
     * @type {BitmapSize} 
     */
    RequestedSize {
        get => this.get_RequestedSize()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCompositedOnWindow {
        get => this.get_IsCompositedOnWindow()
    }

    /**
     * 
     * @returns {WindowTab} 
     */
    get_Tab() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowTab(value)
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_RequestedSize() {
        value := BitmapSize()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Image() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompositedOnWindow() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

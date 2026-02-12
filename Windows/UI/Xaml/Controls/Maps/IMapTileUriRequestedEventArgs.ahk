#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapTileUriRequest.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapTileUriRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapTileUriRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{d2147b43-1bbf-4b98-8dd3-b7834e407e0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_X", "get_Y", "get_ZoomLevel", "get_Request"]

    /**
     * @type {Integer} 
     */
    X {
        get => this.get_X()
    }

    /**
     * @type {Integer} 
     */
    Y {
        get => this.get_Y()
    }

    /**
     * @type {Integer} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
    }

    /**
     * @type {MapTileUriRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_X() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Y() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomLevel() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {MapTileUriRequest} 
     */
    get_Request() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileUriRequest(value)
    }
}

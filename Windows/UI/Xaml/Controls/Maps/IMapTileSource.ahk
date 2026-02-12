#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapTileDataSource.ahk
#Include .\MapZoomLevelRange.ahk
#Include ..\..\..\..\Devices\Geolocation\GeoboundingBox.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapTileSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapTileSource
     * @type {Guid}
     */
    static IID => Guid("{88a76e4e-2fdf-4567-9255-1100519c8d62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataSource", "put_DataSource", "get_Layer", "put_Layer", "get_ZoomLevelRange", "put_ZoomLevelRange", "get_Bounds", "put_Bounds", "get_AllowOverstretch", "put_AllowOverstretch", "get_IsFadingEnabled", "put_IsFadingEnabled", "get_IsTransparencyEnabled", "put_IsTransparencyEnabled", "get_IsRetryEnabled", "put_IsRetryEnabled", "get_ZIndex", "put_ZIndex", "get_TilePixelSize", "put_TilePixelSize", "get_Visible", "put_Visible"]

    /**
     * @type {MapTileDataSource} 
     */
    DataSource {
        get => this.get_DataSource()
        set => this.put_DataSource(value)
    }

    /**
     * @type {Integer} 
     */
    Layer {
        get => this.get_Layer()
        set => this.put_Layer(value)
    }

    /**
     * @type {MapZoomLevelRange} 
     */
    ZoomLevelRange {
        get => this.get_ZoomLevelRange()
        set => this.put_ZoomLevelRange(value)
    }

    /**
     * @type {GeoboundingBox} 
     */
    Bounds {
        get => this.get_Bounds()
        set => this.put_Bounds(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowOverstretch {
        get => this.get_AllowOverstretch()
        set => this.put_AllowOverstretch(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFadingEnabled {
        get => this.get_IsFadingEnabled()
        set => this.put_IsFadingEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTransparencyEnabled {
        get => this.get_IsTransparencyEnabled()
        set => this.put_IsTransparencyEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsRetryEnabled {
        get => this.get_IsRetryEnabled()
        set => this.put_IsRetryEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * @type {Integer} 
     */
    TilePixelSize {
        get => this.get_TilePixelSize()
        set => this.put_TilePixelSize(value)
    }

    /**
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * 
     * @returns {MapTileDataSource} 
     */
    get_DataSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileDataSource(value)
    }

    /**
     * 
     * @param {MapTileDataSource} value 
     * @returns {HRESULT} 
     */
    put_DataSource(value) {
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
    get_Layer() {
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
    put_Layer(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MapZoomLevelRange} 
     */
    get_ZoomLevelRange() {
        value := MapZoomLevelRange()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {MapZoomLevelRange} value 
     * @returns {HRESULT} 
     */
    put_ZoomLevelRange(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {GeoboundingBox} 
     */
    get_Bounds() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
    }

    /**
     * 
     * @param {GeoboundingBox} value 
     * @returns {HRESULT} 
     */
    put_Bounds(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowOverstretch() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_AllowOverstretch(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFadingEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_IsFadingEnabled(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransparencyEnabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_IsTransparencyEnabled(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRetryEnabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_IsRetryEnabled(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZIndex() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
    put_ZIndex(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TilePixelSize() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_TilePixelSize(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_Visible(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

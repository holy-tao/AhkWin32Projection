#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapTileSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapTileSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{93fcc93c-7035-4603-99b1-e659921b6093}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataSourceProperty", "get_LayerProperty", "get_ZoomLevelRangeProperty", "get_BoundsProperty", "get_AllowOverstretchProperty", "get_IsFadingEnabledProperty", "get_IsTransparencyEnabledProperty", "get_IsRetryEnabledProperty", "get_ZIndexProperty", "get_TilePixelSizeProperty", "get_VisibleProperty"]

    /**
     * @type {DependencyProperty} 
     */
    DataSourceProperty {
        get => this.get_DataSourceProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LayerProperty {
        get => this.get_LayerProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomLevelRangeProperty {
        get => this.get_ZoomLevelRangeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    BoundsProperty {
        get => this.get_BoundsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    AllowOverstretchProperty {
        get => this.get_AllowOverstretchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsFadingEnabledProperty {
        get => this.get_IsFadingEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTransparencyEnabledProperty {
        get => this.get_IsTransparencyEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsRetryEnabledProperty {
        get => this.get_IsRetryEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZIndexProperty {
        get => this.get_ZIndexProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TilePixelSizeProperty {
        get => this.get_TilePixelSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    VisibleProperty {
        get => this.get_VisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DataSourceProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LayerProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZoomLevelRangeProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_BoundsProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_AllowOverstretchProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsFadingEnabledProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTransparencyEnabledProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsRetryEnabledProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZIndexProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TilePixelSizeProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_VisibleProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}

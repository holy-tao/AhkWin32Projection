#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a service that resolves resources from an application. This interface is used for design tool hosting scenarios and is not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.ixamluipresenterhost
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlUIPresenter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlUIPresenter
     * @type {Guid}
     */
    static IID => Guid("{a714944a-1619-4fc6-b31b-89512ef022a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RootElement", "put_RootElement", "get_ThemeKey", "put_ThemeKey", "get_ThemeResourcesXaml", "put_ThemeResourcesXaml", "SetSize", "Render", "Present"]

    /**
     * @type {UIElement} 
     */
    RootElement {
        get => this.get_RootElement()
        set => this.put_RootElement(value)
    }

    /**
     * @type {HSTRING} 
     */
    ThemeKey {
        get => this.get_ThemeKey()
        set => this.put_ThemeKey(value)
    }

    /**
     * @type {HSTRING} 
     */
    ThemeResourcesXaml {
        get => this.get_ThemeResourcesXaml()
        set => this.put_ThemeResourcesXaml(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_RootElement() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_RootElement(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ThemeKey() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_ThemeKey(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ThemeResourcesXaml() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_ThemeResourcesXaml(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {HRESULT} 
     */
    SetSize(width, height) {
        result := ComCall(12, this, "int", width, "int", height, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Render method initializes the DVD filter graph.
     * @remarks
     * The `Render` method enables the **MSWebDVD** object to fully initialize the underlying DirectShow filter graph on startup. This eliminates the slight delay that otherwise occurs when the user issues the first command to play a disc or show a menu. There is no case in which `Render` needs to be called before calling any other method. For example, if the application calls [**PlayTitle**](playtitle-method.md) before the filter graph has been initialized, the **MSWebDVD** object calls `Render` automatically before attempting to play the disc.
     * @returns {HRESULT} <span id="iRender"></span><span id="irender"></span><span id="IRENDER"></span>*iRender*
     * 
     * Specifies an integer value indicating whether the filter graph will be destroyed and rebuilt.
     * 
     * 
     * 
     * | Value | Description                                                                                         |
     * |-------|-----------------------------------------------------------------------------------------------------|
     * | 0     | The filter graph will not be destroyed and rebuilt if it already exists. This is the default value. |
     * | 1     | The filter graph will be destroyed and rebuilt if it already exists.                                |
     * 
     * 
     * 
     *  
     * 
     * 
     * 
     * No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/render-method
     */
    Render() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Represents an arbitrary affine 2D transformation defined by a 3-by-2 matrix. (PresentationTransform)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/presentationtypes/ns-presentationtypes-presentationtransform
     */
    Present() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ApplicationViewTitleBar.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationView3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationView3
     * @type {Guid}
     */
    static IID => Guid("{903c9ce5-793a-4fdf-a2b2-af1ac21e3108}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TitleBar", "get_FullScreenSystemOverlayMode", "put_FullScreenSystemOverlayMode", "get_IsFullScreenMode", "TryEnterFullScreenMode", "ExitFullScreenMode", "ShowStandardSystemOverlays", "TryResizeView", "SetPreferredMinSize"]

    /**
     * @type {ApplicationViewTitleBar} 
     */
    TitleBar {
        get => this.get_TitleBar()
    }

    /**
     * @type {Integer} 
     */
    FullScreenSystemOverlayMode {
        get => this.get_FullScreenSystemOverlayMode()
        set => this.put_FullScreenSystemOverlayMode(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFullScreenMode {
        get => this.get_IsFullScreenMode()
    }

    /**
     * 
     * @returns {ApplicationViewTitleBar} 
     */
    get_TitleBar() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ApplicationViewTitleBar(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FullScreenSystemOverlayMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_FullScreenSystemOverlayMode(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullScreenMode() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    TryEnterFullScreenMode() {
        result := ComCall(10, this, "int*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExitFullScreenMode() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowStandardSystemOverlays() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {Boolean} 
     */
    TryResizeView(value) {
        result := ComCall(13, this, "ptr", value, "int*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * 
     * @param {SIZE} minSize 
     * @returns {HRESULT} 
     */
    SetPreferredMinSize(minSize) {
        result := ComCall(14, this, "ptr", minSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

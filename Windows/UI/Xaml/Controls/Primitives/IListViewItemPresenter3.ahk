#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Media\Brush.ahk
#Include ..\..\Thickness.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IListViewItemPresenter3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewItemPresenter3
     * @type {Guid}
     */
    static IID => Guid("{36620013-0390-4e30-ad97-8744404f7010}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RevealBackground", "put_RevealBackground", "get_RevealBorderBrush", "put_RevealBorderBrush", "get_RevealBorderThickness", "put_RevealBorderThickness", "get_RevealBackgroundShowsAboveContent", "put_RevealBackgroundShowsAboveContent"]

    /**
     * @type {Brush} 
     */
    RevealBackground {
        get => this.get_RevealBackground()
        set => this.put_RevealBackground(value)
    }

    /**
     * @type {Brush} 
     */
    RevealBorderBrush {
        get => this.get_RevealBorderBrush()
        set => this.put_RevealBorderBrush(value)
    }

    /**
     * @type {Thickness} 
     */
    RevealBorderThickness {
        get => this.get_RevealBorderThickness()
        set => this.put_RevealBorderThickness(value)
    }

    /**
     * @type {Boolean} 
     */
    RevealBackgroundShowsAboveContent {
        get => this.get_RevealBackgroundShowsAboveContent()
        set => this.put_RevealBackgroundShowsAboveContent(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_RevealBackground() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_RevealBackground(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_RevealBorderBrush() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_RevealBorderBrush(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_RevealBorderThickness() {
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
    put_RevealBorderThickness(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RevealBackgroundShowsAboveContent() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_RevealBackgroundShowsAboveContent(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

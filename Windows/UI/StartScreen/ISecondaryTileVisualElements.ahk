#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class ISecondaryTileVisualElements extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryTileVisualElements
     * @type {Guid}
     */
    static IID => Guid("{1d8df333-815e-413f-9f50-a81da70a96b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Square30x30Logo", "get_Square30x30Logo", "put_Square70x70Logo", "get_Square70x70Logo", "put_Square150x150Logo", "get_Square150x150Logo", "put_Wide310x150Logo", "get_Wide310x150Logo", "put_Square310x310Logo", "get_Square310x310Logo", "put_ForegroundText", "get_ForegroundText", "put_BackgroundColor", "get_BackgroundColor", "put_ShowNameOnSquare150x150Logo", "get_ShowNameOnSquare150x150Logo", "put_ShowNameOnWide310x150Logo", "get_ShowNameOnWide310x150Logo", "put_ShowNameOnSquare310x310Logo", "get_ShowNameOnSquare310x310Logo"]

    /**
     * @type {Uri} 
     */
    Square30x30Logo {
        get => this.get_Square30x30Logo()
        set => this.put_Square30x30Logo(value)
    }

    /**
     * @type {Uri} 
     */
    Square70x70Logo {
        get => this.get_Square70x70Logo()
        set => this.put_Square70x70Logo(value)
    }

    /**
     * @type {Uri} 
     */
    Square150x150Logo {
        get => this.get_Square150x150Logo()
        set => this.put_Square150x150Logo(value)
    }

    /**
     * @type {Uri} 
     */
    Wide310x150Logo {
        get => this.get_Wide310x150Logo()
        set => this.put_Wide310x150Logo(value)
    }

    /**
     * @type {Uri} 
     */
    Square310x310Logo {
        get => this.get_Square310x310Logo()
        set => this.put_Square310x310Logo(value)
    }

    /**
     * @type {Integer} 
     */
    ForegroundText {
        get => this.get_ForegroundText()
        set => this.put_ForegroundText(value)
    }

    /**
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowNameOnSquare150x150Logo {
        get => this.get_ShowNameOnSquare150x150Logo()
        set => this.put_ShowNameOnSquare150x150Logo(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowNameOnWide310x150Logo {
        get => this.get_ShowNameOnWide310x150Logo()
        set => this.put_ShowNameOnWide310x150Logo(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowNameOnSquare310x310Logo {
        get => this.get_ShowNameOnSquare310x310Logo()
        set => this.put_ShowNameOnSquare310x310Logo(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square30x30Logo(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square30x30Logo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square70x70Logo(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square70x70Logo() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square150x150Logo(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square150x150Logo() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Wide310x150Logo(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Wide310x150Logo() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Square310x310Logo(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Square310x310Logo() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ForegroundText(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ForegroundText() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        value := Color()
        result := ComCall(19, this, "ptr", value, "int")
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
    put_ShowNameOnSquare150x150Logo(value) {
        result := ComCall(20, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowNameOnSquare150x150Logo() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_ShowNameOnWide310x150Logo(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowNameOnWide310x150Logo() {
        result := ComCall(23, this, "int*", &value := 0, "int")
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
    put_ShowNameOnSquare310x310Logo(value) {
        result := ComCall(24, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowNameOnSquare310x310Logo() {
        result := ComCall(25, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IStreetsideExperience extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreetsideExperience
     * @type {Guid}
     */
    static IID => Guid("{a558aec9-e30c-46c8-8116-484691675558}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AddressTextVisible", "put_AddressTextVisible", "get_CursorVisible", "put_CursorVisible", "get_OverviewMapVisible", "put_OverviewMapVisible", "get_StreetLabelsVisible", "put_StreetLabelsVisible", "get_ExitButtonVisible", "put_ExitButtonVisible", "get_ZoomButtonsVisible", "put_ZoomButtonsVisible"]

    /**
     * @type {Boolean} 
     */
    AddressTextVisible {
        get => this.get_AddressTextVisible()
        set => this.put_AddressTextVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    CursorVisible {
        get => this.get_CursorVisible()
        set => this.put_CursorVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    OverviewMapVisible {
        get => this.get_OverviewMapVisible()
        set => this.put_OverviewMapVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    StreetLabelsVisible {
        get => this.get_StreetLabelsVisible()
        set => this.put_StreetLabelsVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    ExitButtonVisible {
        get => this.get_ExitButtonVisible()
        set => this.put_ExitButtonVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    ZoomButtonsVisible {
        get => this.get_ZoomButtonsVisible()
        set => this.put_ZoomButtonsVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AddressTextVisible() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_AddressTextVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CursorVisible() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_CursorVisible(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OverviewMapVisible() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_OverviewMapVisible(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StreetLabelsVisible() {
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
    put_StreetLabelsVisible(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExitButtonVisible() {
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
    put_ExitButtonVisible(value) {
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
    get_ZoomButtonsVisible() {
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
    put_ZoomButtonsVisible(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

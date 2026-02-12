#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportMxdcImageQualityConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportMxdcImageQualityConfiguration
     * @type {Guid}
     */
    static IID => Guid("{0e0d0b86-d202-58a3-a1ed-2ef9dbc0f291}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NormalOutputQuality", "put_NormalOutputQuality", "get_DraftOutputQuality", "put_DraftOutputQuality", "get_HighOutputQuality", "put_HighOutputQuality", "get_PhotographicOutputQuality", "put_PhotographicOutputQuality", "get_TextOutputQuality", "put_TextOutputQuality", "get_AutomaticOutputQuality", "put_AutomaticOutputQuality", "get_FaxOutputQuality", "put_FaxOutputQuality"]

    /**
     * @type {Integer} 
     */
    NormalOutputQuality {
        get => this.get_NormalOutputQuality()
        set => this.put_NormalOutputQuality(value)
    }

    /**
     * @type {Integer} 
     */
    DraftOutputQuality {
        get => this.get_DraftOutputQuality()
        set => this.put_DraftOutputQuality(value)
    }

    /**
     * @type {Integer} 
     */
    HighOutputQuality {
        get => this.get_HighOutputQuality()
        set => this.put_HighOutputQuality(value)
    }

    /**
     * @type {Integer} 
     */
    PhotographicOutputQuality {
        get => this.get_PhotographicOutputQuality()
        set => this.put_PhotographicOutputQuality(value)
    }

    /**
     * @type {Integer} 
     */
    TextOutputQuality {
        get => this.get_TextOutputQuality()
        set => this.put_TextOutputQuality(value)
    }

    /**
     * @type {Integer} 
     */
    AutomaticOutputQuality {
        get => this.get_AutomaticOutputQuality()
        set => this.put_AutomaticOutputQuality(value)
    }

    /**
     * @type {Integer} 
     */
    FaxOutputQuality {
        get => this.get_FaxOutputQuality()
        set => this.put_FaxOutputQuality(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NormalOutputQuality() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_NormalOutputQuality(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DraftOutputQuality() {
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
    put_DraftOutputQuality(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighOutputQuality() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_HighOutputQuality(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PhotographicOutputQuality() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_PhotographicOutputQuality(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextOutputQuality() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_TextOutputQuality(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutomaticOutputQuality() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_AutomaticOutputQuality(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FaxOutputQuality() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_FaxOutputQuality(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

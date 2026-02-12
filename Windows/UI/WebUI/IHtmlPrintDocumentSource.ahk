#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class IHtmlPrintDocumentSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHtmlPrintDocumentSource
     * @type {Guid}
     */
    static IID => Guid("{cea6469a-0e05-467a-abc9-36ec1d4cdcb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Content", "put_Content", "get_LeftMargin", "put_LeftMargin", "get_TopMargin", "put_TopMargin", "get_RightMargin", "put_RightMargin", "get_BottomMargin", "put_BottomMargin", "get_EnableHeaderFooter", "put_EnableHeaderFooter", "get_ShrinkToFit", "put_ShrinkToFit", "get_PercentScale", "put_PercentScale", "get_PageRange", "TrySetPageRange"]

    /**
     * @type {Integer} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {Float} 
     */
    LeftMargin {
        get => this.get_LeftMargin()
        set => this.put_LeftMargin(value)
    }

    /**
     * @type {Float} 
     */
    TopMargin {
        get => this.get_TopMargin()
        set => this.put_TopMargin(value)
    }

    /**
     * @type {Float} 
     */
    RightMargin {
        get => this.get_RightMargin()
        set => this.put_RightMargin(value)
    }

    /**
     * @type {Float} 
     */
    BottomMargin {
        get => this.get_BottomMargin()
        set => this.put_BottomMargin(value)
    }

    /**
     * @type {Boolean} 
     */
    EnableHeaderFooter {
        get => this.get_EnableHeaderFooter()
        set => this.put_EnableHeaderFooter(value)
    }

    /**
     * @type {Boolean} 
     */
    ShrinkToFit {
        get => this.get_ShrinkToFit()
        set => this.put_ShrinkToFit(value)
    }

    /**
     * @type {Float} 
     */
    PercentScale {
        get => this.get_PercentScale()
        set => this.put_PercentScale(value)
    }

    /**
     * @type {HSTRING} 
     */
    PageRange {
        get => this.get_PageRange()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Content() {
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
    put_Content(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftMargin() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LeftMargin(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopMargin() {
        result := ComCall(10, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TopMargin(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightMargin() {
        result := ComCall(12, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RightMargin(value) {
        result := ComCall(13, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BottomMargin() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_BottomMargin(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableHeaderFooter() {
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
    put_EnableHeaderFooter(value) {
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
    get_ShrinkToFit() {
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
    put_ShrinkToFit(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PercentScale() {
        result := ComCall(20, this, "float*", &pScalePercent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pScalePercent
    }

    /**
     * 
     * @param {Float} scalePercent 
     * @returns {HRESULT} 
     */
    put_PercentScale(scalePercent) {
        result := ComCall(21, this, "float", scalePercent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PageRange() {
        pstrPageRange := HSTRING()
        result := ComCall(22, this, "ptr", pstrPageRange, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrPageRange
    }

    /**
     * 
     * @param {HSTRING} strPageRange 
     * @returns {Boolean} 
     */
    TrySetPageRange(strPageRange) {
        if(strPageRange is String) {
            pin := HSTRING.Create(strPageRange)
            strPageRange := pin.Value
        }
        strPageRange := strPageRange is Win32Handle ? NumGet(strPageRange, "ptr") : strPageRange

        result := ComCall(23, this, "ptr", strPageRange, "int*", &pfSuccess := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfSuccess
    }
}

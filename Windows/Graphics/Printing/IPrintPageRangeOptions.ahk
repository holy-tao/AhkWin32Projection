#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintPageRangeOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPageRangeOptions
     * @type {Guid}
     */
    static IID => Guid("{ce6db728-1357-46b2-a923-79f995f448fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AllowAllPages", "get_AllowAllPages", "put_AllowCurrentPage", "get_AllowCurrentPage", "put_AllowCustomSetOfPages", "get_AllowCustomSetOfPages"]

    /**
     * @type {Boolean} 
     */
    AllowAllPages {
        get => this.get_AllowAllPages()
        set => this.put_AllowAllPages(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowCurrentPage {
        get => this.get_AllowCurrentPage()
        set => this.put_AllowCurrentPage(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowCustomSetOfPages {
        get => this.get_AllowCustomSetOfPages()
        set => this.put_AllowCustomSetOfPages(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowAllPages(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowAllPages() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_AllowCurrentPage(value) {
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
    get_AllowCurrentPage() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_AllowCustomSetOfPages(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCustomSetOfPages() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

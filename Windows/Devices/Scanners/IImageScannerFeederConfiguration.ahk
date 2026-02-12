#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Scanners
 * @version WindowsRuntime 1.4
 */
class IImageScannerFeederConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageScannerFeederConfiguration
     * @type {Guid}
     */
    static IID => Guid("{74bdacee-fa97-4c17-8280-40e39c6dcc67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanAutoDetectPageSize", "get_AutoDetectPageSize", "put_AutoDetectPageSize", "get_PageSize", "put_PageSize", "get_PageOrientation", "put_PageOrientation", "get_PageSizeDimensions", "IsPageSizeSupported", "get_MaxNumberOfPages", "put_MaxNumberOfPages", "get_CanScanDuplex", "get_Duplex", "put_Duplex", "get_CanScanAhead", "get_ScanAhead", "put_ScanAhead"]

    /**
     * @type {Boolean} 
     */
    CanAutoDetectPageSize {
        get => this.get_CanAutoDetectPageSize()
    }

    /**
     * @type {Boolean} 
     */
    AutoDetectPageSize {
        get => this.get_AutoDetectPageSize()
        set => this.put_AutoDetectPageSize(value)
    }

    /**
     * @type {Integer} 
     */
    PageSize {
        get => this.get_PageSize()
        set => this.put_PageSize(value)
    }

    /**
     * @type {Integer} 
     */
    PageOrientation {
        get => this.get_PageOrientation()
        set => this.put_PageOrientation(value)
    }

    /**
     * @type {SIZE} 
     */
    PageSizeDimensions {
        get => this.get_PageSizeDimensions()
    }

    /**
     * @type {Integer} 
     */
    MaxNumberOfPages {
        get => this.get_MaxNumberOfPages()
        set => this.put_MaxNumberOfPages(value)
    }

    /**
     * @type {Boolean} 
     */
    CanScanDuplex {
        get => this.get_CanScanDuplex()
    }

    /**
     * @type {Boolean} 
     */
    Duplex {
        get => this.get_Duplex()
        set => this.put_Duplex(value)
    }

    /**
     * @type {Boolean} 
     */
    CanScanAhead {
        get => this.get_CanScanAhead()
    }

    /**
     * @type {Boolean} 
     */
    ScanAhead {
        get => this.get_ScanAhead()
        set => this.put_ScanAhead(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanAutoDetectPageSize() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoDetectPageSize() {
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
    put_AutoDetectPageSize(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageSize() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_PageSize(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageOrientation() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_PageOrientation(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PageSizeDimensions() {
        value := SIZE()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} pageSize 
     * @param {Integer} pageOrientation 
     * @returns {Boolean} 
     */
    IsPageSizeSupported(pageSize, pageOrientation) {
        result := ComCall(14, this, "int", pageSize, "int", pageOrientation, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxNumberOfPages() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
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
    put_MaxNumberOfPages(value) {
        result := ComCall(16, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanScanDuplex() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Duplex() {
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
    put_Duplex(value) {
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
    get_CanScanAhead() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ScanAhead() {
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
    put_ScanAhead(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

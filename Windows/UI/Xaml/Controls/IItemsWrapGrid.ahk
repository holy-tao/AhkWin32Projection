#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Thickness.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IItemsWrapGrid extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemsWrapGrid
     * @type {Guid}
     */
    static IID => Guid("{ddfe6b5f-ba88-4a7d-8a5b-e58caf0f4e2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GroupPadding", "put_GroupPadding", "get_Orientation", "put_Orientation", "get_MaximumRowsOrColumns", "put_MaximumRowsOrColumns", "get_ItemWidth", "put_ItemWidth", "get_ItemHeight", "put_ItemHeight", "get_FirstCacheIndex", "get_FirstVisibleIndex", "get_LastVisibleIndex", "get_LastCacheIndex", "get_ScrollingDirection", "get_GroupHeaderPlacement", "put_GroupHeaderPlacement", "get_CacheLength", "put_CacheLength"]

    /**
     * @type {Thickness} 
     */
    GroupPadding {
        get => this.get_GroupPadding()
        set => this.put_GroupPadding(value)
    }

    /**
     * @type {Integer} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * @type {Integer} 
     */
    MaximumRowsOrColumns {
        get => this.get_MaximumRowsOrColumns()
        set => this.put_MaximumRowsOrColumns(value)
    }

    /**
     * @type {Float} 
     */
    ItemWidth {
        get => this.get_ItemWidth()
        set => this.put_ItemWidth(value)
    }

    /**
     * @type {Float} 
     */
    ItemHeight {
        get => this.get_ItemHeight()
        set => this.put_ItemHeight(value)
    }

    /**
     * @type {Integer} 
     */
    FirstCacheIndex {
        get => this.get_FirstCacheIndex()
    }

    /**
     * @type {Integer} 
     */
    FirstVisibleIndex {
        get => this.get_FirstVisibleIndex()
    }

    /**
     * @type {Integer} 
     */
    LastVisibleIndex {
        get => this.get_LastVisibleIndex()
    }

    /**
     * @type {Integer} 
     */
    LastCacheIndex {
        get => this.get_LastCacheIndex()
    }

    /**
     * @type {Integer} 
     */
    ScrollingDirection {
        get => this.get_ScrollingDirection()
    }

    /**
     * @type {Integer} 
     */
    GroupHeaderPlacement {
        get => this.get_GroupHeaderPlacement()
        set => this.put_GroupHeaderPlacement(value)
    }

    /**
     * @type {Float} 
     */
    CacheLength {
        get => this.get_CacheLength()
        set => this.put_CacheLength(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_GroupPadding() {
        value := Thickness()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_GroupPadding(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Orientation() {
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
    put_Orientation(value) {
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
    get_MaximumRowsOrColumns() {
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
    put_MaximumRowsOrColumns(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemWidth() {
        result := ComCall(12, this, "double*", &value := 0, "int")
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
    put_ItemWidth(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ItemHeight() {
        result := ComCall(14, this, "double*", &value := 0, "int")
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
    put_ItemHeight(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstCacheIndex() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FirstVisibleIndex() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastVisibleIndex() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastCacheIndex() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScrollingDirection() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GroupHeaderPlacement() {
        result := ComCall(21, this, "int*", &value := 0, "int")
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
    put_GroupHeaderPlacement(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CacheLength() {
        result := ComCall(23, this, "double*", &value := 0, "int")
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
    put_CacheLength(value) {
        result := ComCall(24, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

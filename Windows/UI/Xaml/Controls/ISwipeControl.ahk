#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SwipeItems.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISwipeControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISwipeControl
     * @type {Guid}
     */
    static IID => Guid("{9ee3d96f-6704-4823-aa15-1c143bc53cf7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LeftItems", "put_LeftItems", "get_RightItems", "put_RightItems", "get_TopItems", "put_TopItems", "get_BottomItems", "put_BottomItems", "Close"]

    /**
     * @type {SwipeItems} 
     */
    LeftItems {
        get => this.get_LeftItems()
        set => this.put_LeftItems(value)
    }

    /**
     * @type {SwipeItems} 
     */
    RightItems {
        get => this.get_RightItems()
        set => this.put_RightItems(value)
    }

    /**
     * @type {SwipeItems} 
     */
    TopItems {
        get => this.get_TopItems()
        set => this.put_TopItems(value)
    }

    /**
     * @type {SwipeItems} 
     */
    BottomItems {
        get => this.get_BottomItems()
        set => this.put_BottomItems(value)
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_LeftItems() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SwipeItems(value)
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_LeftItems(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_RightItems() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SwipeItems(value)
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_RightItems(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_TopItems() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SwipeItems(value)
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_TopItems(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SwipeItems} 
     */
    get_BottomItems() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SwipeItems(value)
    }

    /**
     * 
     * @param {SwipeItems} value 
     * @returns {HRESULT} 
     */
    put_BottomItems(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

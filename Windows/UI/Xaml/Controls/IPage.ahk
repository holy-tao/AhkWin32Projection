#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Frame.ahk
#Include .\AppBar.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPage
     * @type {Guid}
     */
    static IID => Guid("{c4b27075-e641-453e-824d-012fc7cf95cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Frame", "get_NavigationCacheMode", "put_NavigationCacheMode", "get_TopAppBar", "put_TopAppBar", "get_BottomAppBar", "put_BottomAppBar"]

    /**
     * @type {Frame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {Integer} 
     */
    NavigationCacheMode {
        get => this.get_NavigationCacheMode()
        set => this.put_NavigationCacheMode(value)
    }

    /**
     * @type {AppBar} 
     */
    TopAppBar {
        get => this.get_TopAppBar()
        set => this.put_TopAppBar(value)
    }

    /**
     * @type {AppBar} 
     */
    BottomAppBar {
        get => this.get_BottomAppBar()
        set => this.put_BottomAppBar(value)
    }

    /**
     * 
     * @returns {Frame} 
     */
    get_Frame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Frame(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NavigationCacheMode() {
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
    put_NavigationCacheMode(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppBar} 
     */
    get_TopAppBar() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBar(value)
    }

    /**
     * 
     * @param {AppBar} value 
     * @returns {HRESULT} 
     */
    put_TopAppBar(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppBar} 
     */
    get_BottomAppBar() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBar(value)
    }

    /**
     * 
     * @param {AppBar} value 
     * @returns {HRESULT} 
     */
    put_BottomAppBar(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

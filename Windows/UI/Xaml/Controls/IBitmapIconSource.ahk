#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IBitmapIconSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapIconSource
     * @type {Guid}
     */
    static IID => Guid("{c8e33dc7-d4ae-4a87-947f-ac4d0bcf5af4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UriSource", "put_UriSource", "get_ShowAsMonochrome", "put_ShowAsMonochrome"]

    /**
     * @type {Uri} 
     */
    UriSource {
        get => this.get_UriSource()
        set => this.put_UriSource(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowAsMonochrome {
        get => this.get_ShowAsMonochrome()
        set => this.put_ShowAsMonochrome(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_UriSource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
    put_UriSource(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowAsMonochrome() {
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
    put_ShowAsMonochrome(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

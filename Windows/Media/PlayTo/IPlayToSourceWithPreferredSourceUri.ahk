#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class IPlayToSourceWithPreferredSourceUri extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayToSourceWithPreferredSourceUri
     * @type {Guid}
     */
    static IID => Guid("{aab253eb-3301-4dc4-afba-b2f2ed9635a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreferredSourceUri", "put_PreferredSourceUri"]

    /**
     * @type {Uri} 
     */
    PreferredSourceUri {
        get => this.get_PreferredSourceUri()
        set => this.put_PreferredSourceUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PreferredSourceUri() {
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
    put_PreferredSourceUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

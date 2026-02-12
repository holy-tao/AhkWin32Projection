#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class ICastingSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingSource
     * @type {Guid}
     */
    static IID => Guid("{f429ea72-3467-47e6-a027-522923e9d727}")

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

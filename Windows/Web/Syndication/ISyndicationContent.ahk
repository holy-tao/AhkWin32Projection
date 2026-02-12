#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationContent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationContent
     * @type {Guid}
     */
    static IID => Guid("{4641fefe-0e55-40d0-b8d0-6a2ccba9fc7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceUri", "put_SourceUri"]

    /**
     * @type {Uri} 
     */
    SourceUri {
        get => this.get_SourceUri()
        set => this.put_SourceUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SourceUri() {
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
    put_SourceUri(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

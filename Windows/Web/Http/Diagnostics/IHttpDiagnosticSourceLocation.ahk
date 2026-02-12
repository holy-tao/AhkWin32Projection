#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IHttpDiagnosticSourceLocation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpDiagnosticSourceLocation
     * @type {Guid}
     */
    static IID => Guid("{54a9d260-8860-423f-b6fa-d77716f647a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceUri", "get_LineNumber", "get_ColumnNumber"]

    /**
     * @type {Uri} 
     */
    SourceUri {
        get => this.get_SourceUri()
    }

    /**
     * @type {Integer} 
     */
    LineNumber {
        get => this.get_LineNumber()
    }

    /**
     * @type {Integer} 
     */
    ColumnNumber {
        get => this.get_ColumnNumber()
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
     * @returns {Integer} 
     */
    get_LineNumber() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColumnNumber() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

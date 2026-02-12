#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpContentCodingHeaderValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpContentCodingHeaderValue
     * @type {Guid}
     */
    static IID => Guid("{bcf7f92a-9376-4d85-bccc-9f4f9acab434}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentCoding"]

    /**
     * @type {HSTRING} 
     */
    ContentCoding {
        get => this.get_ContentCoding()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentCoding() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

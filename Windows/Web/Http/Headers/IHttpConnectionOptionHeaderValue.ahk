#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpConnectionOptionHeaderValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpConnectionOptionHeaderValue
     * @type {Guid}
     */
    static IID => Guid("{cb4af27a-4e90-45eb-8dcd-fd1408f4c44f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Token"]

    /**
     * @type {HSTRING} 
     */
    Token {
        get => this.get_Token()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Token() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

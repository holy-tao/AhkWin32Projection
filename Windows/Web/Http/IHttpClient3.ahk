#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpClient3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpClient3
     * @type {Guid}
     */
    static IID => Guid("{1172fd01-9899-4194-963f-8f9d72a7ec15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DefaultPrivacyAnnotation", "put_DefaultPrivacyAnnotation"]

    /**
     * @type {HSTRING} 
     */
    DefaultPrivacyAnnotation {
        get => this.get_DefaultPrivacyAnnotation()
        set => this.put_DefaultPrivacyAnnotation(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DefaultPrivacyAnnotation() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DefaultPrivacyAnnotation(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

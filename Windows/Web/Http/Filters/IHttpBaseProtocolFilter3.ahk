#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpBaseProtocolFilter3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpBaseProtocolFilter3
     * @type {Guid}
     */
    static IID => Guid("{d43f4d4c-bd42-43ae-8717-ad2c8f4b2937}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CookieUsageBehavior", "put_CookieUsageBehavior"]

    /**
     * @type {Integer} 
     */
    CookieUsageBehavior {
        get => this.get_CookieUsageBehavior()
        set => this.put_CookieUsageBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CookieUsageBehavior() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_CookieUsageBehavior(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

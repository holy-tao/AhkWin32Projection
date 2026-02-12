#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpBaseProtocolFilter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpBaseProtocolFilter2
     * @type {Guid}
     */
    static IID => Guid("{2ec30013-9427-4900-a017-fa7da3b5c9ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxVersion", "put_MaxVersion"]

    /**
     * @type {Integer} 
     */
    MaxVersion {
        get => this.get_MaxVersion()
        set => this.put_MaxVersion(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxVersion() {
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
    put_MaxVersion(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

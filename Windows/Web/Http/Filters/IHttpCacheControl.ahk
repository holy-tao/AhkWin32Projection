#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpCacheControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpCacheControl
     * @type {Guid}
     */
    static IID => Guid("{c77e1cb4-3cea-4eb5-ac85-04e186e63ab7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReadBehavior", "put_ReadBehavior", "get_WriteBehavior", "put_WriteBehavior"]

    /**
     * @type {Integer} 
     */
    ReadBehavior {
        get => this.get_ReadBehavior()
        set => this.put_ReadBehavior(value)
    }

    /**
     * @type {Integer} 
     */
    WriteBehavior {
        get => this.get_WriteBehavior()
        set => this.put_WriteBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadBehavior() {
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
    put_ReadBehavior(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteBehavior() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_WriteBehavior(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

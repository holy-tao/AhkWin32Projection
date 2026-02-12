#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IFileUnprotectOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileUnprotectOptions
     * @type {Guid}
     */
    static IID => Guid("{7d1312f1-3b0d-4dd8-a1f8-1ec53822e2f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Audit", "get_Audit"]

    /**
     * @type {Boolean} 
     */
    Audit {
        get => this.get_Audit()
        set => this.put_Audit(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Audit(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Audit() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContactSignificantOther2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactSignificantOther2
     * @type {Guid}
     */
    static IID => Guid("{8d7bd474-3f03-45f8-ba0f-c4ed37d64219}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Relationship", "put_Relationship"]

    /**
     * @type {Integer} 
     */
    Relationship {
        get => this.get_Relationship()
        set => this.put_Relationship(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Relationship() {
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
    put_Relationship(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

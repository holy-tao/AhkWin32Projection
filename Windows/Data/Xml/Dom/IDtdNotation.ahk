#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Xml.Dom
 * @version WindowsRuntime 1.4
 */
class IDtdNotation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDtdNotation
     * @type {Guid}
     */
    static IID => Guid("{8cb4e04d-6d46-4edb-ab73-df83c51ad397}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PublicId", "get_SystemId"]

    /**
     * @type {IInspectable} 
     */
    PublicId {
        get => this.get_PublicId()
    }

    /**
     * @type {IInspectable} 
     */
    SystemId {
        get => this.get_SystemId()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_PublicId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SystemId() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }
}

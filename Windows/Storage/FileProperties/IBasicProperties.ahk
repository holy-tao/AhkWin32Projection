#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class IBasicProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBasicProperties
     * @type {Guid}
     */
    static IID => Guid("{d05d55db-785e-4a66-be02-9beec58aea81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Size", "get_DateModified", "get_ItemDate"]

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {DateTime} 
     */
    DateModified {
        get => this.get_DateModified()
    }

    /**
     * @type {DateTime} 
     */
    ItemDate {
        get => this.get_ItemDate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateModified() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ItemDate() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ITableActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITableActionEntity
     * @type {Guid}
     */
    static IID => Guid("{0f252cdb-ba24-5dbb-9d17-1b300773d141}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTextContent", "get_RowCount", "get_ColumnCount"]

    /**
     * @type {Integer} 
     */
    RowCount {
        get => this.get_RowCount()
    }

    /**
     * @type {Integer} 
     */
    ColumnCount {
        get => this.get_ColumnCount()
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetTextContent(result_) {
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RowCount() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColumnCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

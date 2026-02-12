#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class ICoreDragOperation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreDragOperation2
     * @type {Guid}
     */
    static IID => Guid("{824b1e2c-d99a-4fc3-8507-6c182f33b46a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowedOperations", "put_AllowedOperations"]

    /**
     * @type {Integer} 
     */
    AllowedOperations {
        get => this.get_AllowedOperations()
        set => this.put_AllowedOperations(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedOperations() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_AllowedOperations(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

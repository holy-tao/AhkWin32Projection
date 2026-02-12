#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\JumpListItem.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class IJumpList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJumpList
     * @type {Guid}
     */
    static IID => Guid("{b0234c3e-cd6f-4cb6-a611-61fd505f3ed1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Items", "get_SystemGroupKind", "put_SystemGroupKind", "SaveAsync"]

    /**
     * @type {IVector<JumpListItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {Integer} 
     */
    SystemGroupKind {
        get => this.get_SystemGroupKind()
        set => this.put_SystemGroupKind(value)
    }

    /**
     * 
     * @returns {IVector<JumpListItem>} 
     */
    get_Items() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(JumpListItem, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemGroupKind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_SystemGroupKind(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}

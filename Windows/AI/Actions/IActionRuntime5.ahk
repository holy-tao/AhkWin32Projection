#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CustomActionEntityStore.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionRuntime5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionRuntime5
     * @type {Guid}
     */
    static IID => Guid("{c2e995b1-52a9-5f3a-bebb-a04655e96218}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CustomEntityStore"]

    /**
     * @type {CustomActionEntityStore} 
     */
    CustomEntityStore {
        get => this.get_CustomEntityStore()
    }

    /**
     * 
     * @returns {CustomActionEntityStore} 
     */
    get_CustomEntityStore() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CustomActionEntityStore(value)
    }
}

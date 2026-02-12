#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionCatalog2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionCatalog2
     * @type {Guid}
     */
    static IID => Guid("{370360b1-a14b-5ea8-b611-b5f70342ba44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActionsForInputs", "GetActionsForInputs2"]

    /**
     * 
     * @param {Integer} inputEntities_length 
     * @param {Pointer<ActionEntity>} inputEntities 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetActionsForInputs(inputEntities_length, inputEntities, result_) {
        result := ComCall(6, this, "uint", inputEntities_length, "ptr*", inputEntities, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} inputEntities_length 
     * @param {Pointer<ActionEntity>} inputEntities 
     * @param {WindowId} invokerWindowId 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetActionsForInputs2(inputEntities_length, inputEntities, invokerWindowId, result_) {
        invokerWindowId := invokerWindowId is Win32Handle ? NumGet(invokerWindowId, "ptr") : invokerWindowId

        result := ComCall(7, this, "uint", inputEntities_length, "ptr*", inputEntities, "ptr", invokerWindowId, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

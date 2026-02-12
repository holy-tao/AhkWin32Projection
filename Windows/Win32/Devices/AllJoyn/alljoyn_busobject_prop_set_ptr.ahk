#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_busobject_prop_set_ptr extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} context_ 
     * @param {PSTR} ifcName 
     * @param {PSTR} propName 
     * @param {alljoyn_msgarg} val_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, ifcName, propName, val_) {
        ifcName := ifcName is String ? StrPtr(ifcName) : ifcName
        propName := propName is String ? StrPtr(propName) : propName
        val_ := val_ is Win32Handle ? NumGet(val_, "ptr") : val_

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, context_Marshal, context_, "ptr", ifcName, "ptr", propName, "ptr", val_, "int")
        return result
    }
}

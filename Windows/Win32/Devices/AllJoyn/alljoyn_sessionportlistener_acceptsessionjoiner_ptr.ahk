#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_sessionportlistener_acceptsessionjoiner_ptr extends IUnknown {

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
     * @param {Integer} sessionPort 
     * @param {PSTR} joiner 
     * @param {alljoyn_sessionopts} opts 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, sessionPort, joiner, opts) {
        joiner := joiner is String ? StrPtr(joiner) : joiner
        opts := opts is Win32Handle ? NumGet(opts, "ptr") : opts

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, context_Marshal, context_, "ushort", sessionPort, "ptr", joiner, "ptr", opts, "int")
        return result
    }
}

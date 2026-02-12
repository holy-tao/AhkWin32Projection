#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_about_announced_ptr extends IUnknown {

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
     * @param {PSTR} busName 
     * @param {Integer} version_ 
     * @param {Integer} port 
     * @param {alljoyn_msgarg} objectDescriptionArg 
     * @param {alljoyn_msgarg} aboutDataArg 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, busName, version_, port, objectDescriptionArg, aboutDataArg) {
        busName := busName is String ? StrPtr(busName) : busName
        objectDescriptionArg := objectDescriptionArg is Win32Handle ? NumGet(objectDescriptionArg, "ptr") : objectDescriptionArg
        aboutDataArg := aboutDataArg is Win32Handle ? NumGet(aboutDataArg, "ptr") : aboutDataArg

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, context_Marshal, context_, "ptr", busName, "ushort", version_, "ushort", port, "ptr", objectDescriptionArg, "ptr", aboutDataArg)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles general events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.typedeventhandler-2
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class TypedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for TypedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{9de1c534-6ae1-11e0-84e1-18a905bcc53f}")

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
     * @param {Generic} sender 
     * @param {Generic} args 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, args) {
        result := ComCall(3, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

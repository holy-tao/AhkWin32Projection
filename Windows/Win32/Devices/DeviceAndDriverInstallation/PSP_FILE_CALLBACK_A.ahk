#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FileCallback callback function is used by a few setup functions. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api//content/setupapi/nc-setupapi-psp_file_callback_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class PSP_FILE_CALLBACK_A extends IUnknown {

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
     * @param {Pointer<Void>} Context_ 
     * @param {Integer} Notification_ 
     * @param {Pointer} Param1 
     * @param {Pointer} Param2 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Context_, Notification_, Param1, Param2) {
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, Context_Marshal, Context_, "uint", Notification_, "ptr", Param1, "ptr", Param2, "uint")
        return result
    }
}

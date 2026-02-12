#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implement this function to receive information for each task that VDMEnumTaskWOWEx enumerates.
 * @remarks
 * You can use the value of the <i>hTask16</i> parameter in a call to terminate the task.
 * @see https://learn.microsoft.com/windows/win32/api//content/vdmdbg/nc-vdmdbg-taskenumprocex
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class TASKENUMPROC extends IUnknown {

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
     * @param {Integer} dwThreadId 
     * @param {Integer} hMod16 
     * @param {Integer} hTask16 
     * @param {LPARAM} lpUserDefined 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwThreadId, hMod16, hTask16, lpUserDefined) {
        lpUserDefined := lpUserDefined is Win32Handle ? NumGet(lpUserDefined, "ptr") : lpUserDefined

        result := ComCall(3, this, "uint", dwThreadId, "ushort", hMod16, "ushort", hTask16, "ptr", lpUserDefined, "int")
        return result
    }
}

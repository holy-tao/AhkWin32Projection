#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * The <i>lpValue</i> parameter is a pointer to a <b>DWORD</b> value that specifies the child process policy. The policy specifies whether to allow a child process to be created.
  * 
  * For information on the possible values for the <b>DWORD</b> to which <i>lpValue</i> points, see Remarks.
  * 
  * Supported in Windows 10 and newer and Windows Server 2016 and newer.
 * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-updateprocthreadattribute
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class PROC extends IUnknown {

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
     * @returns {Pointer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke() {
        result := ComCall(3, this, "ptr")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the CopyFile2 function.
 * @remarks
 * The <b>COPYFILE2_CALLBACK_STREAM_FINISHED</b> message is the last message for a paused 
 *     copy. If <b>COPYFILE2_PROGRESS_PAUSE</b> is returned in response to a 
 *     <b>COPYFILE2_CALLBACK_STREAM_FINISHED</b> message then no further callbacks will be sent.
 * 
 * To compile an application that uses the <b>PCOPYFILE2_PROGRESS_ROUTINE</b> 
 *     function pointer type, define the <b>_WIN32_WINNT</b> macro as 0x0601 or later. For more 
 *     information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
 * 
 * <table>
 * <tr>
 * <th>Technology</th>
 * <th>Supported</th>
 * </tr>
 * <tr>
 * <td>
 * Server Message Block (SMB) 3.0 protocol
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SMB 3.0 Transparent Failover (TFO)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SMB 3.0 with Scale-out File Shares (SO)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Cluster Shared Volume File System (CsvFS)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Resilient File System (ReFS)
 * 
 * </td>
 * <td>
 * Yes
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nc-winbase-pcopyfile2_progress_routine
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class PCOPYFILE2_PROGRESS_ROUTINE extends IUnknown {

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
     * @param {Pointer<COPYFILE2_MESSAGE>} pMessage 
     * @param {Pointer<Void>} pvCallbackContext 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pMessage, pvCallbackContext) {
        pvCallbackContextMarshal := pvCallbackContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pMessage, pvCallbackContextMarshal, pvCallbackContext, "int")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the CopyFileEx, MoveFileTransacted, and MoveFileWithProgress functions.
 * @remarks
 * An application can use this information to display a progress bar that shows the total number of bytes copied 
 *     as a percent of the total file size.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nc-winbase-lpprogress_routine
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class LPPROGRESS_ROUTINE extends IUnknown {

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
     * @param {Integer} TotalFileSize 
     * @param {Integer} TotalBytesTransferred 
     * @param {Integer} StreamSize 
     * @param {Integer} StreamBytesTransferred 
     * @param {Integer} dwStreamNumber 
     * @param {Integer} dwCallbackReason 
     * @param {HANDLE} hSourceFile 
     * @param {HANDLE} hDestinationFile 
     * @param {Pointer<Void>} lpData 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(TotalFileSize, TotalBytesTransferred, StreamSize, StreamBytesTransferred, dwStreamNumber, dwCallbackReason, hSourceFile, hDestinationFile, lpData) {
        hSourceFile := hSourceFile is Win32Handle ? NumGet(hSourceFile, "ptr") : hSourceFile
        hDestinationFile := hDestinationFile is Win32Handle ? NumGet(hDestinationFile, "ptr") : hDestinationFile

        lpDataMarshal := lpData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int64", TotalFileSize, "int64", TotalBytesTransferred, "int64", StreamSize, "int64", StreamBytesTransferred, "uint", dwStreamNumber, "uint", dwCallbackReason, "ptr", hSourceFile, "ptr", hDestinationFile, lpDataMarshal, lpData, "uint")
        return result
    }
}

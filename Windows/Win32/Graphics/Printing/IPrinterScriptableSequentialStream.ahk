#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptableSequentialStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptableSequentialStream
     * @type {Guid}
     */
    static IID => Guid("{2072838a-316f-467a-a949-27f68c44a854}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write"]

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Integer} cbRead 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(cbRead) {
        result := ComCall(7, this, "int", cbRead, "ptr*", &ppArray := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppArray)
    }

    /**
     * This article helps you to configure the Script Task.
     * @param {IDispatch} pArray 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(pArray) {
        result := ComCall(8, this, "ptr", pArray, "int*", &pcbWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbWritten
    }
}

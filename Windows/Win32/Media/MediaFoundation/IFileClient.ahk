#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IFileClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileClient
     * @type {Guid}
     */
    static IID => Guid("{bfccd196-1244-4840-ab44-480975c4ffe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectDiskSize", "Write", "Read"]

    /**
     * 
     * @param {Pointer<Integer>} pqwSize 
     * @returns {HRESULT} 
     */
    GetObjectDiskSize(pqwSize) {
        pqwSizeMarshal := pqwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pqwSizeMarshal, pqwSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This article helps you to configure the Script Task.
     * @param {IFileIo} pFio 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(pFio) {
        result := ComCall(4, this, "ptr", pFio, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {IFileIo} pFio 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(pFio) {
        result := ComCall(5, this, "ptr", pFio, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

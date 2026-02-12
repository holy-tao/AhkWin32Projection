#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechAudioFormat.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechBaseStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechBaseStream
     * @type {Guid}
     */
    static IID => Guid("{6450336f-7d49-4ced-8097-49d6dee37294}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "putref_Format", "Read", "Write", "Seek"]

    /**
     * @type {ISpeechAudioFormat} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_Format() {
        result := ComCall(7, this, "ptr*", &AudioFormat := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechAudioFormat(AudioFormat)
    }

    /**
     * 
     * @param {ISpeechAudioFormat} AudioFormat 
     * @returns {HRESULT} 
     */
    putref_Format(AudioFormat) {
        result := ComCall(8, this, "ptr", AudioFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Pointer<VARIANT>} Buffer_ 
     * @param {Integer} NumberOfBytes 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(Buffer_, NumberOfBytes, BytesRead) {
        BytesReadMarshal := BytesRead is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", Buffer_, "int", NumberOfBytes, BytesReadMarshal, BytesRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This article helps you to configure the Script Task.
     * @param {VARIANT} Buffer_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(Buffer_) {
        result := ComCall(10, this, "ptr", Buffer_, "int*", &BytesWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BytesWritten
    }

    /**
     * Seek Method
     * @remarks
     * Use the **Seek** method in conjunction with the [Index](./index-property.md) property if the underlying provider supports indexes on the **Recordset** object. Use the [Supports](./supports-method.md)**(adSeek)** method to determine whether the underlying provider supports **Seek**, and the **Supports(adIndex)** method to determine whether the provider supports indexes. (For example, the [OLE DB Provider for Microsoft Jet](../../guide/appendixes/microsoft-ole-db-provider-for-microsoft-jet.md) supports **Seek** and **Index**.)  
     *   
     *  If **Seek** does not find the desired row, no error occurs, and the row is positioned at the end of the **Recordset**. Set the **Index** property to the desired index before executing this method.  
     *   
     *  This method is supported only with server-side cursors. Seek is not supported when the **Recordset** object's [CursorLocation](./cursorlocation-property-ado.md) property value is **adUseClient**.  
     *   
     *  This method can only be used when the **Recordset** object has been opened with a [CommandTypeEnum](./commandtypeenum.md) value of **adCmdTableDirect**.
     * @param {VARIANT} Position 
     * @param {Integer} Origin 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/seek-method
     */
    Seek(Position, Origin) {
        NewPosition := VARIANT()
        result := ComCall(11, this, "ptr", Position, "uint", Origin, "ptr", NewPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NewPosition
    }
}

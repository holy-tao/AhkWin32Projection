#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IFileIo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileIo
     * @type {Guid}
     */
    static IID => Guid("{11993196-1244-4840-ab44-480975c4ffe4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetLength", "SetLength", "GetCurrentPosition", "SetCurrentPosition", "IsEndOfStream", "Read", "Write", "Seek", "Close"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {Integer} eAccessMode 
     * @param {Integer} eOpenMode 
     * @param {PWSTR} pwszFileName 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/roapi/nf-roapi-initialize
     */
    Initialize(eAccessMode, eOpenMode, pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "int", eAccessMode, "int", eOpenMode, "ptr", pwszFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the length, in bytes, of a valid security identifier (SID).
     * @param {Pointer<Integer>} pqwLength 
     * @returns {HRESULT} If the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is valid, the return value is the length, in bytes, of the <b>SID</b> structure.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid, the return value is undefined. Before calling <b>GetLengthSid</b>, pass the SID to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsid">IsValidSid</a> function to verify that the SID is valid.
     * @see https://learn.microsoft.com/windows/win32/api//content/securitybaseapi/nf-securitybaseapi-getlengthsid
     */
    GetLength(pqwLength) {
        pqwLengthMarshal := pqwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pqwLengthMarshal, pqwLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} qwLength 
     * @returns {HRESULT} 
     */
    SetLength(qwLength) {
        result := ComCall(5, this, "uint", qwLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetCurrentPositionEx function retrieves the current position in logical coordinates.
     * @param {Pointer<Integer>} pqwPosition 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getcurrentpositionex
     */
    GetCurrentPosition(pqwPosition) {
        pqwPositionMarshal := pqwPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pqwPositionMarshal, pqwPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} qwPosition 
     * @returns {HRESULT} 
     */
    SetCurrentPosition(qwPosition) {
        result := ComCall(7, this, "uint", qwPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbEndOfStream 
     * @returns {HRESULT} 
     */
    IsEndOfStream(pbEndOfStream) {
        pbEndOfStreamMarshal := pbEndOfStream is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pbEndOfStreamMarshal, pbEndOfStream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Pointer<Integer>} pbt 
     * @param {Integer} ul 
     * @param {Pointer<Integer>} pulRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(pbt, ul, pulRead) {
        pbtMarshal := pbt is VarRef ? "char*" : "ptr"
        pulReadMarshal := pulRead is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pbtMarshal, pbt, "uint", ul, pulReadMarshal, pulRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This article helps you to configure the Script Task.
     * @param {Pointer<Integer>} pbt 
     * @param {Integer} ul 
     * @param {Pointer<Integer>} pulWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(pbt, ul, pulWritten) {
        pbtMarshal := pbt is VarRef ? "char*" : "ptr"
        pulWrittenMarshal := pulWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pbtMarshal, pbt, "uint", ul, pulWrittenMarshal, pulWritten, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @param {Integer} eSeekOrigin 
     * @param {Integer} qwSeekOffset 
     * @param {Integer} dwSeekFlags 
     * @param {Pointer<Integer>} pqwCurrentPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/seek-method
     */
    Seek(eSeekOrigin, qwSeekOffset, dwSeekFlags, pqwCurrentPosition) {
        pqwCurrentPositionMarshal := pqwCurrentPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "int", eSeekOrigin, "uint", qwSeekOffset, "uint", dwSeekFlags, pqwCurrentPositionMarshal, pqwCurrentPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

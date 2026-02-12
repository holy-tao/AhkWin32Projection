#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * ISQLServerErrorInfo::GetErrorInfo (Native Client OLE DB provider)
 * @remarks
 * The [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client OLE DB provider allocates memory for the SSERRORINFO and OLECHAR strings returned through the pointers passed by the consumer. The consumer must deallocate this memory by using the **IMalloc::Free** method when it no longer requires access to the error data.  
 *   
 *  The SSERRORINFO structure is defined as follows:  
 *   
 * ```  
 * typedef struct tagSSErrorInfo  
 *    {  
 *    LPOLESTR pwszMessage;  
 *    LPOLESTR pwszServer;  
 *    LPOLESTR pwszProcedure;  
 *    LONG lNative;  
 *    BYTE bState;  
 *    BYTE bClass;  
 *    WORD wLineNumber;  
 *    }  
 * SSERRORINFO;  
 * ```  
 *   
 * |Member|Description|  
 * |------------|-----------------|  
 * |*pwszMessage*|The error message from [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)]. The message is returned through the **IErrorInfo::GetDescription** method.|  
 * |*pwszServer*|The name of the instance of [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] on which the error occurred.|  
 * |*pwszProcedure*|The name of the stored procedure generating the error if the error occurred in a stored procedure; otherwise, an empty string.|  
 * |*lNative*|The [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] error number. The error number is identical to that returned in the *plNativeError* parameter of the **ISQLErrorInfo::GetSQLInfo** method.|  
 * |*bState*|The state of the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] error.|  
 * |*bClass*|The severity of the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] error.|  
 * |*wLineNumber*|When applicable, the line of a [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] stored procedure that generated the error message. If no procedure is involved, the default value is 1.|  
 *   
 *  Pointers in the structure reference addresses in the string returned in the *ppErrorStrings* argument.
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-interfaces/isqlservererrorinfo-geterrorinfo-ole-db
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISQLServerErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISQLServerErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{5cf4ca12-ef21-11d0-97e7-00c04fc2ad98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetErrorInfo"]

    /**
     * ISQLServerErrorInfo::GetErrorInfo (Native Client OLE DB provider)
     * @remarks
     * The [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] Native Client OLE DB provider allocates memory for the SSERRORINFO and OLECHAR strings returned through the pointers passed by the consumer. The consumer must deallocate this memory by using the **IMalloc::Free** method when it no longer requires access to the error data.  
     *   
     *  The SSERRORINFO structure is defined as follows:  
     *   
     * ```  
     * typedef struct tagSSErrorInfo  
     *    {  
     *    LPOLESTR pwszMessage;  
     *    LPOLESTR pwszServer;  
     *    LPOLESTR pwszProcedure;  
     *    LONG lNative;  
     *    BYTE bState;  
     *    BYTE bClass;  
     *    WORD wLineNumber;  
     *    }  
     * SSERRORINFO;  
     * ```  
     *   
     * |Member|Description|  
     * |------------|-----------------|  
     * |*pwszMessage*|The error message from [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)]. The message is returned through the **IErrorInfo::GetDescription** method.|  
     * |*pwszServer*|The name of the instance of [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] on which the error occurred.|  
     * |*pwszProcedure*|The name of the stored procedure generating the error if the error occurred in a stored procedure; otherwise, an empty string.|  
     * |*lNative*|The [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] error number. The error number is identical to that returned in the *plNativeError* parameter of the **ISQLErrorInfo::GetSQLInfo** method.|  
     * |*bState*|The state of the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] error.|  
     * |*bClass*|The severity of the [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] error.|  
     * |*wLineNumber*|When applicable, the line of a [!INCLUDE[ssNoVersion](../../includes/ssnoversion-md.md)] stored procedure that generated the error message. If no procedure is involved, the default value is 1.|  
     *   
     *  Pointers in the structure reference addresses in the string returned in the *ppErrorStrings* argument.
     * @param {Pointer<Pointer<SSERRORINFO>>} ppErrorInfo 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-interfaces/isqlservererrorinfo-geterrorinfo-ole-db
     */
    GetErrorInfo(ppErrorInfo) {
        ppErrorInfoMarshal := ppErrorInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppErrorInfoMarshal, ppErrorInfo, "ptr*", &ppStringsBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppStringsBuffer
    }
}

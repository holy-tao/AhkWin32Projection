#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDDEDATA.ahk" { HDDEDATA }
#Import "..\..\Security\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }
#Import ".\HSZ.ahk" { HSZ }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HCONV.ahk" { HCONV }
#Import ".\CONVCONTEXT.ahk" { CONVCONTEXT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Security\SECURITY_QUALITY_OF_SERVICE.ahk" { SECURITY_QUALITY_OF_SERVICE }

/**
 * Contains information about the current Dynamic Data Exchange (DDE) transaction. A DDE debugging application can use this structure when monitoring transactions that the system passes to the DDE callback functions of other applications.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-moncbstruct
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct MONCBSTRUCT {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     */
    cb : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the transaction occurred. Windows time is the number of milliseconds that have elapsed since the system was booted.
     */
    dwTime : UInt32

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the task (application instance) containing the DDE callback function that received the transaction.
     */
    hTask : HANDLE

    /**
     * Type: <b>DWORD</b>
     * 
     * The value returned by the DDE callback function that processed the transaction.
     */
    dwRet : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The transaction type.
     */
    wType : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The format of the data exchanged (if any) during the transaction.
     */
    wFmt : UInt32

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the conversation in which the transaction took place.
     */
    hConv : HCONV

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to a string.
     */
    hsz1 : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to a string.
     */
    hsz2 : HSZ

    /**
     * Type: <b>HDDEDATA</b>
     * 
     * A handle to the data exchanged (if any) during the transaction.
     */
    hData : HDDEDATA

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional data.
     */
    dwData1 : IntPtr

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional data.
     */
    dwData2 : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a></b>
     * 
     * The language information used to share data in different languages.
     */
    cc : CONVCONTEXT

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount, in bytes, of data being passed with the transaction. This value can be more than 32 bytes.
     */
    cbData : UInt32

    /**
     * Type: <b>DWORD[8]</b>
     * 
     * Contains the first 32 bytes of data being passed with the transaction (<c>8 * sizeof(DWORD)</c>).
     */
    Data : UInt32[8]

}

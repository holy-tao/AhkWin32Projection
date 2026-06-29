#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\PRINTER_NOTIFY_INFO.ahk" { PRINTER_NOTIFY_INFO }
#Import "..\Gdi\HDC.ahk" { HDC }
#Import ".\PRINTER_OPTIONSW.ahk" { PRINTER_OPTIONSW }
#Import ".\PRINTER_DEFAULTSW.ahk" { PRINTER_DEFAULTSW }
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import ".\EPrintXPSJobProgress.ahk" { EPrintXPSJobProgress }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\ATTRIBUTE_INFO_3.ahk" { ATTRIBUTE_INFO_3 }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DOC_INFO_1W.ahk" { DOC_INFO_1W }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SHOWUIPARAMS.ahk" { SHOWUIPARAMS }
#Import ".\PRINTER_DEFAULTSA.ahk" { PRINTER_DEFAULTSA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FINDPRINTERCHANGENOTIFICATION_HANDLE.ahk" { FINDPRINTERCHANGENOTIFICATION_HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\PrintAsyncNotifyConversationStyle.ahk" { PrintAsyncNotifyConversationStyle }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DEVQUERYPRINT_INFO.ahk" { DEVQUERYPRINT_INFO }
#Import ".\PrintNamedProperty.ahk" { PrintNamedProperty }
#Import ".\BIDI_RESPONSE_CONTAINER.ahk" { BIDI_RESPONSE_CONTAINER }
#Import ".\PRINTER_HANDLE.ahk" { PRINTER_HANDLE }
#Import ".\PrintPropertyValue.ahk" { PrintPropertyValue }
#Import ".\IPrintAsyncNotifyCallback.ahk" { IPrintAsyncNotifyCallback }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\Gdi\DEVMODEW.ahk" { DEVMODEW }
#Import ".\CORE_PRINTER_DRIVERW.ahk" { CORE_PRINTER_DRIVERW }
#Import ".\PRINTER_NOTIFY_INFO_DATA.ahk" { PRINTER_NOTIFY_INFO_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PRINTER_OPTIONSA.ahk" { PRINTER_OPTIONSA }
#Import ".\DOC_INFO_1A.ahk" { DOC_INFO_1A }
#Import ".\PRINTER_NOTIFY_OPTIONS.ahk" { PRINTER_NOTIFY_OPTIONS }
#Import ".\EPrintXPSJobOperation.ahk" { EPrintXPSJobOperation }
#Import ".\PrintAsyncNotifyUserFilter.ahk" { PrintAsyncNotifyUserFilter }
#Import ".\IPrintAsyncNotifyChannel.ahk" { IPrintAsyncNotifyChannel }
#Import ".\CORE_PRINTER_DRIVERA.ahk" { CORE_PRINTER_DRIVERA }
#Import "..\..\Storage\Xps\DOCINFOW.ahk" { DOCINFOW }
#Import ".\PRINT_EXECUTION_DATA.ahk" { PRINT_EXECUTION_DATA }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */

;@region Functions
/**
 * 
 * @param {HWND} hWndOwner 
 * @param {Pointer<PFNPROPSHEETUI>} _pfnPropSheetUI 
 * @param {LPARAM} _lParam 
 * @param {Pointer<Integer>} pResult 
 * @returns {Integer} 
 */
export CommonPropertySheetUIA(hWndOwner, _pfnPropSheetUI, _lParam, pResult) {
    pResultMarshal := pResult is VarRef ? "uint*" : "ptr"

    result := DllCall("COMPSTUI.dll\CommonPropertySheetUIA", HWND, hWndOwner, "ptr", _pfnPropSheetUI, LPARAM, _lParam, pResultMarshal, pResult, Int32)
    return result
}

/**
 * 
 * @param {HWND} hWndOwner 
 * @param {Pointer<PFNPROPSHEETUI>} _pfnPropSheetUI 
 * @param {LPARAM} _lParam 
 * @param {Pointer<Integer>} pResult 
 * @returns {Integer} 
 */
export CommonPropertySheetUIW(hWndOwner, _pfnPropSheetUI, _lParam, pResult) {
    pResultMarshal := pResult is VarRef ? "uint*" : "ptr"

    result := DllCall("COMPSTUI.dll\CommonPropertySheetUIW", HWND, hWndOwner, "ptr", _pfnPropSheetUI, LPARAM, _lParam, pResultMarshal, pResult, Int32)
    return result
}

/**
 * 
 * @param {HWND} hDlg 
 * @returns {Pointer} 
 */
export GetCPSUIUserData(hDlg) {
    result := DllCall("COMPSTUI.dll\GetCPSUIUserData", HWND, hDlg, IntPtr)
    return result
}

/**
 * 
 * @param {HWND} hDlg 
 * @param {Pointer} CPSUIUserData 
 * @returns {BOOL} 
 */
export SetCPSUIUserData(hDlg, CPSUIUserData) {
    result := DllCall("COMPSTUI.dll\SetCPSUIUserData", HWND, hDlg, "ptr", CPSUIUserData, BOOL)
    return result
}

/**
 * The EnumPrinters function enumerates available printers, print servers, domains, or print providers.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If **EnumPrinters** returns a [**PRINTER\_INFO\_1**](printer-info-1.md) structure in which PRINTER\_ENUM\_CONTAINER is specified, this indicates that there is a hierarchy of printer objects. An application can enumerate the hierarchy by calling **EnumPrinters** again, setting *Name* to the value of the **PRINTER\_INFO\_1** structure's **pName** member.
 * 
 * The **EnumPrinters** function does not retrieve security information. If [**PRINTER\_INFO\_2**](printer-info-2.md) structures are returned in the array pointed to by *pPrinterEnum*, their *pSecurityDescriptor* members will be set to **NULL**.
 * 
 * To get information about the default printer, call [**GetDefaultPrinter**](getdefaultprinter.md).
 * 
 * The [**PRINTER\_INFO\_4**](printer-info-4.md) structure provides an easy and extremely fast way to retrieve the names of the printers installed on a local machine, as well as the remote connections that a user has established. When **EnumPrinters** is called with a **PRINTER\_INFO\_4** data structure, that function queries the registry for the specified information, then returns immediately. This differs from the behavior of **EnumPrinters** when called with other levels of **PRINTER\_INFO\_\*** data structures. In particular, when **EnumPrinters** is called with a level 2 ([**PRINTER\_INFO\_2**](printer-info-2.md)) data structure, it performs an [**OpenPrinter**](openprinter.md) call on each remote connection. If a remote connection is down, or the remote server no longer exists, or the remote printer no longer exists, the function must wait for RPC to time out and consequently fail the **OpenPrinter** call. This can take a while. Passing a **PRINTER\_INFO\_4** structure lets an application retrieve a bare minimum of required information; if more detailed information is desired, a subsequent **EnumPrinters** level 2 call can be made.
 * 
 * **Windows Vista:** The printer data returned by **EnumPrinters** is retrieved from a local cache when the value of *Level* is 4.
 * 
 * The following table shows the **EnumPrinters** output for various *Flags* values when the *Level* parameter is set to 1.
 * 
 * In the *Name* parameter column of the table, you should substitute an appropriate name for Print Provider, Domain, and Machine. For example, for "Print Provider," you could use the name of the network print provider or the name of the local print provider. To retrieve print provider names, call **EnumPrinters** with *Name* set to **NULL**.
 * 
 * 
 * 
 * | *Flags* parameter                                  | *Name* parameter                            | Result                                                                                            |
 * |----------------------------------------------------|---------------------------------------------|---------------------------------------------------------------------------------------------------|
 * | PRINTER\_ENUM\_LOCAL (and not PRINTER\_ENUM\_NAME) | The *Name* parameter is ignored.<br/> | All local printers.<br/>                                                                    |
 * | PRINTER\_ENUM\_NAME                                | "Print Provider"<br/>                 | All domain names<br/>                                                                       |
 * | PRINTER\_ENUM\_NAME                                | "Print Provider!Domain"<br/>          | All printers and print servers in the computer's domain<br/>                                |
 * | PRINTER\_ENUM\_NAME                                | "Print Provider!!\\\\Machine"<br/>    | All printers shared at \\\\Machine<br/>                                                     |
 * | PRINTER\_ENUM\_NAME                                | An empty string, ""<br/>              | All local printers.<br/>                                                                    |
 * | PRINTER\_ENUM\_NAME                                | **NULL**<br/>                         | All print providers in the computer's domain<br/>                                           |
 * | PRINTER\_ENUM\_CONNECTIONS                         | The *Name* parameter is ignored.<br/> | All connected remote printers<br/>                                                          |
 * | PRINTER\_ENUM\_NETWORK                             | The *Name* parameter is ignored.<br/> | All printers in the computer's domain<br/>                                                  |
 * | PRINTER\_ENUM\_REMOTE                              | An empty string, ""<br/>              | All printers and print servers in the computer's domain<br/>                                |
 * | PRINTER\_ENUM\_REMOTE                              | "Print Provider"<br/>                 | Same as PRINTER\_ENUM\_NAME<br/>                                                            |
 * | PRINTER\_ENUM\_REMOTE                              | "Print Provider!Domain"<br/>          | All printers and print servers in computer's domain, regardless of *Domain* specified.<br/> |
 * | PRINTER\_ENUM\_CATEGORY\_3D                        | The *Name* parameter is ignored.<br/> | Only 3D printers are enumerated.<br/>                                                       |
 * | PRINTER\_ENUM\_CATEGORY\_ALL                       | The *Name* parameter is ignored.<br/> | 3D printers are enumerated, along with all other printers.<br/>                             |
 * @param {Integer} Flags The types of print objects that the function should enumerate. This value can be one or more of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                               | Meaning                                                                                                                                                                                                                                                |
 * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="PRINTER_ENUM_LOCAL"></span><span id="printer_enum_local"></span><dl> <dt>**PRINTER\_ENUM\_LOCAL**</dt> </dl>                       | If the PRINTER\_ENUM\_NAME flag is not also passed, the function ignores the *Name* parameter, and enumerates the locally installed printers. If PRINTER\_ENUM\_NAME is also passed, the function enumerates the local printers on *Name*. <br/> |
 * | <span id="PRINTER_ENUM_NAME"></span><span id="printer_enum_name"></span><dl> <dt>**PRINTER\_ENUM\_NAME**</dt> </dl>                          | The function enumerates the printer identified by *Name*. This can be a server, a domain, or a print provider. If *Name* is **NULL**, the function enumerates available print providers.<br/>                                                    |
 * | <span id="PRINTER_ENUM_SHARED"></span><span id="printer_enum_shared"></span><dl> <dt>**PRINTER\_ENUM\_SHARED**</dt> </dl>                    | The function enumerates printers that have the shared attribute. Cannot be used in isolation; use an OR operation to combine with another PRINTER\_ENUM type.<br/>                                                                               |
 * | <span id="PRINTER_ENUM_CONNECTIONS"></span><span id="printer_enum_connections"></span><dl> <dt>**PRINTER\_ENUM\_CONNECTIONS**</dt> </dl>     | The function enumerates the list of printers to which the user has made previous connections.<br/>                                                                                                                                               |
 * | <span id="PRINTER_ENUM_NETWORK"></span><span id="printer_enum_network"></span><dl> <dt>**PRINTER\_ENUM\_NETWORK**</dt> </dl>                 | The function enumerates network printers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                                                |
 * | <span id="PRINTER_ENUM_REMOTE"></span><span id="printer_enum_remote"></span><dl> <dt>**PRINTER\_ENUM\_REMOTE**</dt> </dl>                    | The function enumerates network printers and print servers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                              |
 * | <span id="PRINTER_ENUM_CATEGORY_3D"></span><span id="printer_enum_category_3d"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_3D**</dt> </dl>    | The function enumerates only 3D printers.<br/>                                                                                                                                                                                                   |
 * | <span id="PRINTER_ENUM_CATEGORY_ALL"></span><span id="printer_enum_category_all"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_ALL**</dt> </dl> | The function enumerates all print devices, including 3D printers.<br/>                                                                                                                                                                           |
 * 
 * 
 * 
 *  
 * 
 * If *Level* is 4, you can only use the PRINTER\_ENUM\_CONNECTIONS and PRINTER\_ENUM\_LOCAL constants.
 * 
 * > [!Note]  
 * > 3D print devices are not enumerated by default. You must include both **PRINTER\_ENUM\_CATEGORY\_3D** and **PRINTER\_ENUM\_LOCAL** to enumerate only 3D printers. To include 3D printers, along with all other local printers, use **PRINTER\_ENUM\_CATEGORY\_ALL** and **PRINTER\_ENUM\_LOCAL**.
 * @param {PSTR} Name If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is non-**NULL**, then *Name* is a pointer to a null-terminated string that specifies the name of the object to enumerate. This string can be the name of a server, a domain, or a print provider.
 * 
 * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is **NULL**, then the function enumerates the available print providers.
 * 
 * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_REMOTE, and *Name* is **NULL**, then the function enumerates the printers in the user's domain.
 * 
 * If *Level* is 2 or 5,*Name* is a pointer to a null-terminated string that specifies the name of a server whose printers are to be enumerated. If this string is **NULL**, then the function enumerates the printers installed on the local computer.
 * 
 * If *Level* is 4, *Name* should be **NULL**. The function always queries on the local computer.
 * 
 * When *Name* is **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_CONNECTIONS enumerates printers that are installed on the local machine. These printers include those that are physically attached to the local machine as well as remote printers to which it has a network connection.
 * 
 * When *Name* is not **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_NAME enumerates the local printers that are installed on the server *Name*.
 * @param {Integer} Level The type of data structures pointed to by *pPrinterEnum*. Valid values are 1, 2, 4, and 5, which correspond to the [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), and [**PRINTER\_INFO\_5**](printer-info-5.md) data structures.
 * 
 * This value can be 1, 2, 4, or 5.
 * @param {Integer} pPrinterEnum A pointer to a buffer that receives an array of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures. Each structure contains data that describes an available print object.
 * 
 * If *Level* is 1, the array contains [**PRINTER\_INFO\_1**](printer-info-1.md) structures. If *Level* is 2, the array contains [**PRINTER\_INFO\_2**](printer-info-2.md) structures. If *Level* is 4, the array contains [**PRINTER\_INFO\_4**](printer-info-4.md) structures. If *Level* is 5, the array contains [**PRINTER\_INFO\_5**](printer-info-5.md) structures.
 * 
 * The buffer must be large enough to receive the array of data structures and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinterEnum*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @param {Pointer<Integer>} pcReturned A pointer to a value that receives the number of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures that the function returns in the array to which *pPrinterEnum* points.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinters
 */
export EnumPrintersA(Flags, Name, Level, pPrinterEnum, cbBuf, pcbNeeded, pcReturned) {
    Name := Name is String ? StrPtr(Name) : Name

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\EnumPrintersA", "uint", Flags, "ptr", Name, "uint", Level, "ptr", pPrinterEnum, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The EnumPrinters function enumerates available printers, print servers, domains, or print providers.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If **EnumPrinters** returns a [**PRINTER\_INFO\_1**](printer-info-1.md) structure in which PRINTER\_ENUM\_CONTAINER is specified, this indicates that there is a hierarchy of printer objects. An application can enumerate the hierarchy by calling **EnumPrinters** again, setting *Name* to the value of the **PRINTER\_INFO\_1** structure's **pName** member.
 * 
 * The **EnumPrinters** function does not retrieve security information. If [**PRINTER\_INFO\_2**](printer-info-2.md) structures are returned in the array pointed to by *pPrinterEnum*, their *pSecurityDescriptor* members will be set to **NULL**.
 * 
 * To get information about the default printer, call [**GetDefaultPrinter**](getdefaultprinter.md).
 * 
 * The [**PRINTER\_INFO\_4**](printer-info-4.md) structure provides an easy and extremely fast way to retrieve the names of the printers installed on a local machine, as well as the remote connections that a user has established. When **EnumPrinters** is called with a **PRINTER\_INFO\_4** data structure, that function queries the registry for the specified information, then returns immediately. This differs from the behavior of **EnumPrinters** when called with other levels of **PRINTER\_INFO\_\*** data structures. In particular, when **EnumPrinters** is called with a level 2 ([**PRINTER\_INFO\_2**](printer-info-2.md)) data structure, it performs an [**OpenPrinter**](openprinter.md) call on each remote connection. If a remote connection is down, or the remote server no longer exists, or the remote printer no longer exists, the function must wait for RPC to time out and consequently fail the **OpenPrinter** call. This can take a while. Passing a **PRINTER\_INFO\_4** structure lets an application retrieve a bare minimum of required information; if more detailed information is desired, a subsequent **EnumPrinters** level 2 call can be made.
 * 
 * **Windows Vista:** The printer data returned by **EnumPrinters** is retrieved from a local cache when the value of *Level* is 4.
 * 
 * The following table shows the **EnumPrinters** output for various *Flags* values when the *Level* parameter is set to 1.
 * 
 * In the *Name* parameter column of the table, you should substitute an appropriate name for Print Provider, Domain, and Machine. For example, for "Print Provider," you could use the name of the network print provider or the name of the local print provider. To retrieve print provider names, call **EnumPrinters** with *Name* set to **NULL**.
 * 
 * 
 * 
 * | *Flags* parameter                                  | *Name* parameter                            | Result                                                                                            |
 * |----------------------------------------------------|---------------------------------------------|---------------------------------------------------------------------------------------------------|
 * | PRINTER\_ENUM\_LOCAL (and not PRINTER\_ENUM\_NAME) | The *Name* parameter is ignored.<br/> | All local printers.<br/>                                                                    |
 * | PRINTER\_ENUM\_NAME                                | "Print Provider"<br/>                 | All domain names<br/>                                                                       |
 * | PRINTER\_ENUM\_NAME                                | "Print Provider!Domain"<br/>          | All printers and print servers in the computer's domain<br/>                                |
 * | PRINTER\_ENUM\_NAME                                | "Print Provider!!\\\\Machine"<br/>    | All printers shared at \\\\Machine<br/>                                                     |
 * | PRINTER\_ENUM\_NAME                                | An empty string, ""<br/>              | All local printers.<br/>                                                                    |
 * | PRINTER\_ENUM\_NAME                                | **NULL**<br/>                         | All print providers in the computer's domain<br/>                                           |
 * | PRINTER\_ENUM\_CONNECTIONS                         | The *Name* parameter is ignored.<br/> | All connected remote printers<br/>                                                          |
 * | PRINTER\_ENUM\_NETWORK                             | The *Name* parameter is ignored.<br/> | All printers in the computer's domain<br/>                                                  |
 * | PRINTER\_ENUM\_REMOTE                              | An empty string, ""<br/>              | All printers and print servers in the computer's domain<br/>                                |
 * | PRINTER\_ENUM\_REMOTE                              | "Print Provider"<br/>                 | Same as PRINTER\_ENUM\_NAME<br/>                                                            |
 * | PRINTER\_ENUM\_REMOTE                              | "Print Provider!Domain"<br/>          | All printers and print servers in computer's domain, regardless of *Domain* specified.<br/> |
 * | PRINTER\_ENUM\_CATEGORY\_3D                        | The *Name* parameter is ignored.<br/> | Only 3D printers are enumerated.<br/>                                                       |
 * | PRINTER\_ENUM\_CATEGORY\_ALL                       | The *Name* parameter is ignored.<br/> | 3D printers are enumerated, along with all other printers.<br/>                             |
 * @param {Integer} Flags The types of print objects that the function should enumerate. This value can be one or more of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                               | Meaning                                                                                                                                                                                                                                                |
 * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="PRINTER_ENUM_LOCAL"></span><span id="printer_enum_local"></span><dl> <dt>**PRINTER\_ENUM\_LOCAL**</dt> </dl>                       | If the PRINTER\_ENUM\_NAME flag is not also passed, the function ignores the *Name* parameter, and enumerates the locally installed printers. If PRINTER\_ENUM\_NAME is also passed, the function enumerates the local printers on *Name*. <br/> |
 * | <span id="PRINTER_ENUM_NAME"></span><span id="printer_enum_name"></span><dl> <dt>**PRINTER\_ENUM\_NAME**</dt> </dl>                          | The function enumerates the printer identified by *Name*. This can be a server, a domain, or a print provider. If *Name* is **NULL**, the function enumerates available print providers.<br/>                                                    |
 * | <span id="PRINTER_ENUM_SHARED"></span><span id="printer_enum_shared"></span><dl> <dt>**PRINTER\_ENUM\_SHARED**</dt> </dl>                    | The function enumerates printers that have the shared attribute. Cannot be used in isolation; use an OR operation to combine with another PRINTER\_ENUM type.<br/>                                                                               |
 * | <span id="PRINTER_ENUM_CONNECTIONS"></span><span id="printer_enum_connections"></span><dl> <dt>**PRINTER\_ENUM\_CONNECTIONS**</dt> </dl>     | The function enumerates the list of printers to which the user has made previous connections.<br/>                                                                                                                                               |
 * | <span id="PRINTER_ENUM_NETWORK"></span><span id="printer_enum_network"></span><dl> <dt>**PRINTER\_ENUM\_NETWORK**</dt> </dl>                 | The function enumerates network printers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                                                |
 * | <span id="PRINTER_ENUM_REMOTE"></span><span id="printer_enum_remote"></span><dl> <dt>**PRINTER\_ENUM\_REMOTE**</dt> </dl>                    | The function enumerates network printers and print servers in the computer's domain. This value is valid only if *Level* is 1.<br/>                                                                                                              |
 * | <span id="PRINTER_ENUM_CATEGORY_3D"></span><span id="printer_enum_category_3d"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_3D**</dt> </dl>    | The function enumerates only 3D printers.<br/>                                                                                                                                                                                                   |
 * | <span id="PRINTER_ENUM_CATEGORY_ALL"></span><span id="printer_enum_category_all"></span><dl> <dt>**PRINTER\_ENUM\_CATEGORY\_ALL**</dt> </dl> | The function enumerates all print devices, including 3D printers.<br/>                                                                                                                                                                           |
 * 
 * 
 * 
 *  
 * 
 * If *Level* is 4, you can only use the PRINTER\_ENUM\_CONNECTIONS and PRINTER\_ENUM\_LOCAL constants.
 * 
 * > [!Note]  
 * > 3D print devices are not enumerated by default. You must include both **PRINTER\_ENUM\_CATEGORY\_3D** and **PRINTER\_ENUM\_LOCAL** to enumerate only 3D printers. To include 3D printers, along with all other local printers, use **PRINTER\_ENUM\_CATEGORY\_ALL** and **PRINTER\_ENUM\_LOCAL**.
 * @param {PWSTR} Name If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is non-**NULL**, then *Name* is a pointer to a null-terminated string that specifies the name of the object to enumerate. This string can be the name of a server, a domain, or a print provider.
 * 
 * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_NAME, and *Name* is **NULL**, then the function enumerates the available print providers.
 * 
 * If *Level* is 1, *Flags* contains PRINTER\_ENUM\_REMOTE, and *Name* is **NULL**, then the function enumerates the printers in the user's domain.
 * 
 * If *Level* is 2 or 5,*Name* is a pointer to a null-terminated string that specifies the name of a server whose printers are to be enumerated. If this string is **NULL**, then the function enumerates the printers installed on the local computer.
 * 
 * If *Level* is 4, *Name* should be **NULL**. The function always queries on the local computer.
 * 
 * When *Name* is **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_CONNECTIONS enumerates printers that are installed on the local machine. These printers include those that are physically attached to the local machine as well as remote printers to which it has a network connection.
 * 
 * When *Name* is not **NULL**, setting *Flags* to PRINTER\_ENUM\_LOCAL \| PRINTER\_ENUM\_NAME enumerates the local printers that are installed on the server *Name*.
 * @param {Integer} Level The type of data structures pointed to by *pPrinterEnum*. Valid values are 1, 2, 4, and 5, which correspond to the [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), and [**PRINTER\_INFO\_5**](printer-info-5.md) data structures.
 * 
 * This value can be 1, 2, 4, or 5.
 * @param {Integer} pPrinterEnum A pointer to a buffer that receives an array of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures. Each structure contains data that describes an available print object.
 * 
 * If *Level* is 1, the array contains [**PRINTER\_INFO\_1**](printer-info-1.md) structures. If *Level* is 2, the array contains [**PRINTER\_INFO\_2**](printer-info-2.md) structures. If *Level* is 4, the array contains [**PRINTER\_INFO\_4**](printer-info-4.md) structures. If *Level* is 5, the array contains [**PRINTER\_INFO\_5**](printer-info-5.md) structures.
 * 
 * The buffer must be large enough to receive the array of data structures and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinterEnum*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @param {Pointer<Integer>} pcReturned A pointer to a value that receives the number of [**PRINTER\_INFO\_1**](printer-info-1.md), [**PRINTER\_INFO\_2**](printer-info-2.md) , [**PRINTER\_INFO\_4**](printer-info-4.md), or [**PRINTER\_INFO\_5**](printer-info-5.md) structures that the function returns in the array to which *pPrinterEnum* points.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinters
 */
export EnumPrintersW(Flags, Name, Level, pPrinterEnum, cbBuf, pcbNeeded, pcReturned) {
    Name := Name is String ? StrPtr(Name) : Name

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\EnumPrintersW", "uint", Flags, "ptr", Name, "uint", Level, "ptr", pPrinterEnum, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The GetSpoolFileHandle function retrieves a handle for the spool file associated with the job currently submitted by the application.
 * @remarks
 * With the handle to the spool file, your application can write to the spool file with calls to [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile) followed by [**CommitSpoolData**](commitspooldata.md).
 * 
 * Your application must not call [**ClosePrinter**](closeprinter.md) on *hPrinter* until after it has accessed the spool file for the last time. Then it should call [**CloseSpoolFileHandle**](closespoolfilehandle.md) followed by **ClosePrinter**. Attempts to access the spool file handle after the original *hPrinter* has been closed will fail even if the file handle itself has not been closed. **CloseSpoolFileHandle** will itself fail if **ClosePrinter** is called first.
 * 
 * This function will fail if it is called before the print job has finished spooling.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer to which the job was submitted. This should be the same handle that was used to submit the job. (Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.)
 * @returns {HANDLE} If the function succeeds, it returns a handle to the spool file.
 * 
 * If the function fails, it returns **INVALID\_HANDLE\_VALUE**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getspoolfilehandle
 */
export GetSpoolFileHandle(hPrinter) {
    A_LastError := 0

    result := DllCall("winspool.drv\GetSpoolFileHandle", PRINTER_HANDLE, hPrinter, HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The CommitSpoolData function notifies the print spooler that a specified amount of data has been written to a specified spool file and is ready to be rendered.
 * @remarks
 * Applications submitting a spooler print job can call [**GetSpoolFileHandle**](getspoolfilehandle.md) and then directly write data to the spool file handle by calling [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile). To notify the print spooler that the file contains data which is ready to be rendered, the application must call **CommitSpoolData** and provide the number of available bytes.
 * 
 * If **CommitSpoolData** is called multiple times, each call must use the spool file handle returned by the previous call. When no more data will be written to the spool file, [**CloseSpoolFileHandle**](closespoolfilehandle.md) should be called for the file handle returned by the last call to **CommitSpoolData**.
 * 
 * Before calling **CommitSpoolData**, applications must set the file pointer to the position it had before it wrote data to the file. In the process of rendering the data in the spooler file, the print spooler will move the spool file pointer *cbCommit* bytes from the current value of file pointer.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer to which the job was submitted. This should be the same handle that was used to obtain *hSpoolFile* with [**GetSpoolFileHandle**](getspoolfilehandle.md).
 * @param {HANDLE} hSpoolFile A handle to the spool file being changed. On the first call of **CommitSpoolData**, this should be the same handle that was returned by [**GetSpoolFileHandle**](getspoolfilehandle.md). Subsequent calls to **CommitSpoolData** should pass the handle returned by the preceding call. See Remarks.
 * @param {Integer} cbCommit The number of bytes committed to the print spooler.
 * @returns {HANDLE} If the function succeeds, it returns a handle to the spool file.
 * 
 * If the function fails, it returns INVALID\_HANDLE\_VALUE.
 * @see https://learn.microsoft.com/windows/win32/printdocs/commitspooldata
 */
export CommitSpoolData(hPrinter, hSpoolFile, cbCommit) {
    result := DllCall("winspool.drv\CommitSpoolData", PRINTER_HANDLE, hPrinter, HANDLE, hSpoolFile, "uint", cbCommit, HANDLE.Owned)
    return result
}

/**
 * The CloseSpoolFileHandle function closes a handle to a spool file associated with the print job currently submitted by the application.
 * @remarks
 * Your application must not call [**ClosePrinter**](closeprinter.md) on *hPrinter* until after it has accessed the spool file for the last time. Then it should call **CloseSpoolFileHandle** followed by **ClosePrinter**. Attempts to access the spool file handle after the original *hPrinter* has been closed will fail even if the file handle itself has not been closed. **CloseSpoolFileHandle** will fail if **ClosePrinter** is called first.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer to which the job was submitted. This should be the same handle that was used to obtain *hSpoolFile* with [**GetSpoolFileHandle**](getspoolfilehandle.md).
 * @param {HANDLE} hSpoolFile A handle to the spool file being closed. If [**CommitSpoolData**](commitspooldata.md) has not been called since [**GetSpoolFileHandle**](getspoolfilehandle.md) was called, then this should be the same handle that was returned by **GetSpoolFileHandle**. Otherwise, it should be the handle that was returned by the most recent call to **CommitSpoolData**.
 * @returns {BOOL} **TRUE**, if it succeeds, **FALSE** otherwise.
 * @see https://learn.microsoft.com/windows/win32/printdocs/closespoolfilehandle
 */
export CloseSpoolFileHandle(hPrinter, hSpoolFile) {
    result := DllCall("winspool.drv\CloseSpoolFileHandle", PRINTER_HANDLE, hPrinter, HANDLE, hSpoolFile, BOOL)
    return result
}

/**
 * The OpenPrinter function retrieves a handle to the specified printer or print server or other types of handles in the print subsystem.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > A handle obtained for a remote printer by a call to **OpenPrinter** for a remote printer accesses the printer through a local cache in the print spooler service. This cache isn't real-time accurate. To obtain accurate data, replace the OpenPrinter call with [**OpenPrinter2**](openprinter2.md) with pOptions.dwFlags set to PRINTER\_OPTION\_NO\_CACHE. Note that only OpenPrinter2W is functional. The function returns a printer handle that uses other Printing API calls and bypasses the local cache. This method blocks while waiting for network communication with the remote printer, so it might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages user interface interaction might make the application appear unresponsive.
 * 
 *  
 * 
 * > [!Note]  
 * > A handle obtained by a call to **OpenPrinter** for a remote printer will access the printer through a local cache in the print spooler service. This cache is, by design, not real time accurate. If you need to obtain accurate data, replace the **OpenPrinter** call with [**OpenPrinter2**](openprinter2.md) with *pOptions.dwFlags* set to [**PRINTER\_OPTION\_NO\_CACHE**](printer-options.md). Note that only **OpenPrinter2W** is functional. Doing so the function returns a printer handle that makes other Printing API calls to bypass the local cache. Note that this approach will block while waiting for the round-trip network communication to the remote printer, so it may not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation - factors that are difficult to predict when writing an application. Therefore calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The handle pointed to by *phPrinter* is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
 * 
 * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
 * 
 * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) settings defined in the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure of the *pDefault* parameter are not used when the value of the *pDatatype* member of the [**DOC\_INFO\_1**](doc-info-1.md) structure that was passed in the *pDocInfo* parameter of the [**StartDocPrinter**](startdocprinter.md) call is "RAW". When a high-level document (such as an Adobe PDF or Microsoft Word file) or other printer data (such PCL, PS, or HPGL) is sent directly to a printer with *pDatatype* set to "RAW", the document must fully describe the **DEVMODE**-style print job settings in the language understood by the hardware.
 * 
 * You can call the **OpenPrinter** function to open a handle to a print server or to determine the access rights that a client has to a print server. To do so, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you finish with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
 * 
 * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the access rights that you need to the printer. The access rights can be one of the following. (If *pDefault* is **NULL**, then the access rights are PRINTER\_ACCESS\_USE.)
 * 
 * 
 * 
 * | Desired Access value                        | Meaning                                                                                                                                                                                      |
 * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
 * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
 * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except for SYNCHRONIZE (see [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                     |
 * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
 * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
 * 
 * 
 * 
 *  
 * 
 * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter** call will fail with a return value of zero and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
 * @param {PSTR} pPrinterName A pointer to a null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
 * 
 * For a printer object use: PrinterName, Job xxxx. For an XcvMonitor, use: ServerName, XcvMonitor MonitorName. For an XcvPort, use: ServerName, XcvPort PortName.
 * 
 * If **NULL**, it indicates the local printer server.
 * @param {Pointer<PRINTER_HANDLE>} phPrinter A pointer to a variable that receives a handle (not thread safe) to the open printer or print server object.
 * 
 * The *phPrinter* parameter can return an Xcv handle for use with the XcvData function. For more information about XcvData, see the DDK.
 * @param {Pointer<PRINTER_DEFAULTSA>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter
 */
export OpenPrinterA(pPrinterName, phPrinter, pDefault) {
    pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

    A_LastError := 0

    result := DllCall("winspool.drv\OpenPrinterA", "ptr", pPrinterName, PRINTER_HANDLE.Ptr, phPrinter, PRINTER_DEFAULTSA.Ptr, pDefault, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The OpenPrinter function retrieves a handle to the specified printer or print server or other types of handles in the print subsystem.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > A handle obtained for a remote printer by a call to **OpenPrinter** for a remote printer accesses the printer through a local cache in the print spooler service. This cache isn't real-time accurate. To obtain accurate data, replace the OpenPrinter call with [**OpenPrinter2**](openprinter2.md) with pOptions.dwFlags set to PRINTER\_OPTION\_NO\_CACHE. Note that only OpenPrinter2W is functional. The function returns a printer handle that uses other Printing API calls and bypasses the local cache. This method blocks while waiting for network communication with the remote printer, so it might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages user interface interaction might make the application appear unresponsive.
 * 
 *  
 * 
 * > [!Note]  
 * > A handle obtained by a call to **OpenPrinter** for a remote printer will access the printer through a local cache in the print spooler service. This cache is, by design, not real time accurate. If you need to obtain accurate data, replace the **OpenPrinter** call with [**OpenPrinter2**](openprinter2.md) with *pOptions.dwFlags* set to [**PRINTER\_OPTION\_NO\_CACHE**](printer-options.md). Note that only **OpenPrinter2W** is functional. Doing so the function returns a printer handle that makes other Printing API calls to bypass the local cache. Note that this approach will block while waiting for the round-trip network communication to the remote printer, so it may not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation - factors that are difficult to predict when writing an application. Therefore calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The handle pointed to by *phPrinter* is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
 * 
 * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
 * 
 * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) settings defined in the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure of the *pDefault* parameter are not used when the value of the *pDatatype* member of the [**DOC\_INFO\_1**](doc-info-1.md) structure that was passed in the *pDocInfo* parameter of the [**StartDocPrinter**](startdocprinter.md) call is "RAW". When a high-level document (such as an Adobe PDF or Microsoft Word file) or other printer data (such PCL, PS, or HPGL) is sent directly to a printer with *pDatatype* set to "RAW", the document must fully describe the **DEVMODE**-style print job settings in the language understood by the hardware.
 * 
 * You can call the **OpenPrinter** function to open a handle to a print server or to determine the access rights that a client has to a print server. To do so, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you finish with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
 * 
 * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the access rights that you need to the printer. The access rights can be one of the following. (If *pDefault* is **NULL**, then the access rights are PRINTER\_ACCESS\_USE.)
 * 
 * 
 * 
 * | Desired Access value                        | Meaning                                                                                                                                                                                      |
 * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
 * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
 * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except for SYNCHRONIZE (see [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                     |
 * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
 * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
 * 
 * 
 * 
 *  
 * 
 * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter** call will fail with a return value of zero and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
 * @param {PWSTR} pPrinterName A pointer to a null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
 * 
 * For a printer object use: PrinterName, Job xxxx. For an XcvMonitor, use: ServerName, XcvMonitor MonitorName. For an XcvPort, use: ServerName, XcvPort PortName.
 * 
 * If **NULL**, it indicates the local printer server.
 * @param {Pointer<PRINTER_HANDLE>} phPrinter A pointer to a variable that receives a handle (not thread safe) to the open printer or print server object.
 * 
 * The *phPrinter* parameter can return an Xcv handle for use with the XcvData function. For more information about XcvData, see the DDK.
 * @param {Pointer<PRINTER_DEFAULTSW>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter
 */
export OpenPrinterW(pPrinterName, phPrinter, pDefault) {
    pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

    A_LastError := 0

    result := DllCall("winspool.drv\OpenPrinterW", "ptr", pPrinterName, PRINTER_HANDLE.Ptr, phPrinter, PRINTER_DEFAULTSW.Ptr, pDefault, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The ResetPrinter function specifies the data type and device mode values to be used for printing documents submitted by the StartDocPrinter function. These values can be overridden by using the SetJob function after document printing has started.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter Handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Pointer<PRINTER_DEFAULTSA>} pDefault Pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure.
 * 
 * The **ResetPrinter** function ignores the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. Set that member to zero.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/resetprinter
 */
export ResetPrinterA(hPrinter, pDefault) {
    result := DllCall("winspool.drv\ResetPrinterA", PRINTER_HANDLE, hPrinter, PRINTER_DEFAULTSA.Ptr, pDefault, BOOL)
    return result
}

/**
 * The ResetPrinter function specifies the data type and device mode values to be used for printing documents submitted by the StartDocPrinter function. These values can be overridden by using the SetJob function after document printing has started.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter Handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Pointer<PRINTER_DEFAULTSW>} pDefault Pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure.
 * 
 * The **ResetPrinter** function ignores the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. Set that member to zero.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/resetprinter
 */
export ResetPrinterW(hPrinter, pDefault) {
    result := DllCall("winspool.drv\ResetPrinterW", PRINTER_HANDLE, hPrinter, PRINTER_DEFAULTSW.Ptr, pDefault, BOOL)
    return result
}

/**
 * The SetJob function pauses, resumes, cancels, or restarts a print job on a specified printer. You can also use the SetJob function to set print job parameters, such as the print job priority and the document name.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * You can use the **SetJob** function to set various print job parameters by supplying a pointer to a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), [**JOB\_INFO\_3**](job-info-3.md), or [**JOB\_INFO\_4**](job-info-4.md) structure that contains the necessary data.
 * 
 * To remove or delete all of the print jobs for a particular printer, call the [**SetPrinter**](setprinter.md) function with its *Command* parameter set to **PRINTER\_CONTROL\_PURGE**.
 * 
 * The following members of a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure are ignored on a call to **SetJob**: **JobId**, **pPrinterName**, **pMachineName**, **pUserName**, **pDrivername**, **Size**, **Submitted**, **Time**, and **TotalPages**.
 * 
 * You must have **PRINTER\_ACCESS\_ADMINISTER** access permission for a printer in order to change a print job's position in the print queue.
 * 
 * If you do not want to set a print job's position in the print queue, you should set the **Position** member of the [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure to **JOB\_POSITION\_UNSPECIFIED**.
 * 
 * Use the **SetJob** function with the [**JOB\_INFO\_3**](job-info-3.md) structure to link together a set of print jobs (also known as a chain). This is useful in situations where a single document consists of several parts that you want to render separately. To print jobs A, B, C, and D in order, call **SetJob** with [**JOB\_INFO\_4**](job-info-4.md) to link A to B, B to C, and C to D.
 * 
 * If you link print jobs, note the following:
 * 
 * -   Jobs can be added to the beginning or end of a chain.
 * -   All jobs in the chain must have the same data type.
 * -   The chain must be completely linked before spooling begins, otherwise the spooler may print and delete spooled jobs before you link them all. There are two ways to keep the chain from printing prematurely:
 * 
 *     -   Pause the first job in the chain until the chain is completely linked. The paused state of the first job governs the state of all jobs in the chain.
 *     -   Keep the first job incomplete, that is, do not call [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc) or [**ScheduleJob**](schedulejob.md) for the first job. However, if 'print while spooling' is enabled (the default), this method blocks the port while the chain is built, which also prevents the printing of non-related jobs.
 * 
 * -   The application must handle the case where the user deletes a job in the chain before the chain finishes printing. [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **INVALID\_PARAMETER** when a JobID does not exist.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer object of interest. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} JobId Identifier that specifies the print job. You obtain a print job identifier by calling the [**AddJob**](addjob.md) function or the [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function.
 * 
 * If the *Level* parameter is set to 3, the *JobId* parameter must match the **JobId** member of the [**JOB\_INFO\_3**](job-info-3.md) structure pointed to by *pJob*
 * @param {Integer} Level The type of job information structure pointed to by the *pJob* parameter.
 * 
 * **All versions of Windows**: You can set the *Level* parameter to 0, 1, or 2. When you set *Level* to 0, *pJob* should be **NULL**. Use these values when you are not setting any print job parameters.
 * 
 * You can also set the *Level* parameter to 3.
 * 
 * Starting with **Windows Vista**: You can also set the *Level* parameter to 4.
 * @param {Integer} Command The print job operation to perform. This parameter can be one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                            | Meaning                                                                            |
 * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
 * | <span id="JOB_CONTROL_CANCEL"></span><span id="job_control_cancel"></span><dl> <dt>**JOB\_CONTROL\_CANCEL**</dt> </dl>                                    | Do not use. To delete a print job, use **JOB\_CONTROL\_DELETE**.<br/>        |
 * | <span id="JOB_CONTROL_PAUSE"></span><span id="job_control_pause"></span><dl> <dt>**JOB\_CONTROL\_PAUSE**</dt> </dl>                                       | Pause the print job.<br/>                                                    |
 * | <span id="JOB_CONTROL_RESTART"></span><span id="job_control_restart"></span><dl> <dt>**JOB\_CONTROL\_RESTART**</dt> </dl>                                 | Restart the print job. A job can only be restarted if it was printing.<br/>  |
 * | <span id="JOB_CONTROL_RESUME"></span><span id="job_control_resume"></span><dl> <dt>**JOB\_CONTROL\_RESUME**</dt> </dl>                                    | Resume a paused print job.<br/>                                              |
 * | <span id="JOB_CONTROL_DELETE"></span><span id="job_control_delete"></span><dl> <dt>**JOB\_CONTROL\_DELETE**</dt> </dl>                                    | Delete the print job.<br/>                                                   |
 * | <span id="JOB_CONTROL_SENT_TO_PRINTER"></span><span id="job_control_sent_to_printer"></span><dl> <dt>**JOB\_CONTROL\_SENT\_TO\_PRINTER**</dt> </dl>       | Used by port monitors to end the print job.<br/>                             |
 * | <span id="JOB_CONTROL_LAST_PAGE_EJECTED"></span><span id="job_control_last_page_ejected"></span><dl> <dt>**JOB\_CONTROL\_LAST\_PAGE\_EJECTED**</dt> </dl> | Used by language monitors to end the print job.<br/>                         |
 * | <span id="JOB_CONTROL_RETAIN"></span><span id="job_control_retain"></span><dl> <dt>**JOB\_CONTROL\_RETAIN**</dt> </dl>                                    | **Windows Vista and later**: Keep the job in the queue after it prints.<br/> |
 * | <span id="JOB_CONTROL_RELEASE"></span><span id="job_control_release"></span><dl> <dt>**JOB\_CONTROL\_RELEASE**</dt> </dl>                                 | **Windows Vista and later**: Release the print job.<br/>                     |
 * 
 * 
 * 
 *  
 * 
 * You can use the same call to the **SetJob** function to set print job parameters and to give a command to a print job. Thus, *Command* does not need to be 0 if you are setting print job parameters, although it can be.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setjob
 */
export SetJobA(hPrinter, JobId, Level, Command) {
    static pJob := 0 ;Reserved parameters must always be NULL

    result := DllCall("winspool.drv\SetJobA", PRINTER_HANDLE, hPrinter, "uint", JobId, "uint", Level, "char*", pJob, "uint", Command, BOOL)
    return result
}

/**
 * The SetJob function pauses, resumes, cancels, or restarts a print job on a specified printer. You can also use the SetJob function to set print job parameters, such as the print job priority and the document name.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * You can use the **SetJob** function to set various print job parameters by supplying a pointer to a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), [**JOB\_INFO\_3**](job-info-3.md), or [**JOB\_INFO\_4**](job-info-4.md) structure that contains the necessary data.
 * 
 * To remove or delete all of the print jobs for a particular printer, call the [**SetPrinter**](setprinter.md) function with its *Command* parameter set to **PRINTER\_CONTROL\_PURGE**.
 * 
 * The following members of a [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure are ignored on a call to **SetJob**: **JobId**, **pPrinterName**, **pMachineName**, **pUserName**, **pDrivername**, **Size**, **Submitted**, **Time**, and **TotalPages**.
 * 
 * You must have **PRINTER\_ACCESS\_ADMINISTER** access permission for a printer in order to change a print job's position in the print queue.
 * 
 * If you do not want to set a print job's position in the print queue, you should set the **Position** member of the [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_4**](job-info-4.md) structure to **JOB\_POSITION\_UNSPECIFIED**.
 * 
 * Use the **SetJob** function with the [**JOB\_INFO\_3**](job-info-3.md) structure to link together a set of print jobs (also known as a chain). This is useful in situations where a single document consists of several parts that you want to render separately. To print jobs A, B, C, and D in order, call **SetJob** with [**JOB\_INFO\_4**](job-info-4.md) to link A to B, B to C, and C to D.
 * 
 * If you link print jobs, note the following:
 * 
 * -   Jobs can be added to the beginning or end of a chain.
 * -   All jobs in the chain must have the same data type.
 * -   The chain must be completely linked before spooling begins, otherwise the spooler may print and delete spooled jobs before you link them all. There are two ways to keep the chain from printing prematurely:
 * 
 *     -   Pause the first job in the chain until the chain is completely linked. The paused state of the first job governs the state of all jobs in the chain.
 *     -   Keep the first job incomplete, that is, do not call [**EndDoc**](/windows/desktop/api/Wingdi/nf-wingdi-enddoc) or [**ScheduleJob**](schedulejob.md) for the first job. However, if 'print while spooling' is enabled (the default), this method blocks the port while the chain is built, which also prevents the printing of non-related jobs.
 * 
 * -   The application must handle the case where the user deletes a job in the chain before the chain finishes printing. [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **INVALID\_PARAMETER** when a JobID does not exist.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer object of interest. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} JobId Identifier that specifies the print job. You obtain a print job identifier by calling the [**AddJob**](addjob.md) function or the [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function.
 * 
 * If the *Level* parameter is set to 3, the *JobId* parameter must match the **JobId** member of the [**JOB\_INFO\_3**](job-info-3.md) structure pointed to by *pJob*
 * @param {Integer} Level The type of job information structure pointed to by the *pJob* parameter.
 * 
 * **All versions of Windows**: You can set the *Level* parameter to 0, 1, or 2. When you set *Level* to 0, *pJob* should be **NULL**. Use these values when you are not setting any print job parameters.
 * 
 * You can also set the *Level* parameter to 3.
 * 
 * Starting with **Windows Vista**: You can also set the *Level* parameter to 4.
 * @param {Integer} Command The print job operation to perform. This parameter can be one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                            | Meaning                                                                            |
 * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
 * | <span id="JOB_CONTROL_CANCEL"></span><span id="job_control_cancel"></span><dl> <dt>**JOB\_CONTROL\_CANCEL**</dt> </dl>                                    | Do not use. To delete a print job, use **JOB\_CONTROL\_DELETE**.<br/>        |
 * | <span id="JOB_CONTROL_PAUSE"></span><span id="job_control_pause"></span><dl> <dt>**JOB\_CONTROL\_PAUSE**</dt> </dl>                                       | Pause the print job.<br/>                                                    |
 * | <span id="JOB_CONTROL_RESTART"></span><span id="job_control_restart"></span><dl> <dt>**JOB\_CONTROL\_RESTART**</dt> </dl>                                 | Restart the print job. A job can only be restarted if it was printing.<br/>  |
 * | <span id="JOB_CONTROL_RESUME"></span><span id="job_control_resume"></span><dl> <dt>**JOB\_CONTROL\_RESUME**</dt> </dl>                                    | Resume a paused print job.<br/>                                              |
 * | <span id="JOB_CONTROL_DELETE"></span><span id="job_control_delete"></span><dl> <dt>**JOB\_CONTROL\_DELETE**</dt> </dl>                                    | Delete the print job.<br/>                                                   |
 * | <span id="JOB_CONTROL_SENT_TO_PRINTER"></span><span id="job_control_sent_to_printer"></span><dl> <dt>**JOB\_CONTROL\_SENT\_TO\_PRINTER**</dt> </dl>       | Used by port monitors to end the print job.<br/>                             |
 * | <span id="JOB_CONTROL_LAST_PAGE_EJECTED"></span><span id="job_control_last_page_ejected"></span><dl> <dt>**JOB\_CONTROL\_LAST\_PAGE\_EJECTED**</dt> </dl> | Used by language monitors to end the print job.<br/>                         |
 * | <span id="JOB_CONTROL_RETAIN"></span><span id="job_control_retain"></span><dl> <dt>**JOB\_CONTROL\_RETAIN**</dt> </dl>                                    | **Windows Vista and later**: Keep the job in the queue after it prints.<br/> |
 * | <span id="JOB_CONTROL_RELEASE"></span><span id="job_control_release"></span><dl> <dt>**JOB\_CONTROL\_RELEASE**</dt> </dl>                                 | **Windows Vista and later**: Release the print job.<br/>                     |
 * 
 * 
 * 
 *  
 * 
 * You can use the same call to the **SetJob** function to set print job parameters and to give a command to a print job. Thus, *Command* does not need to be 0 if you are setting print job parameters, although it can be.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setjob
 */
export SetJobW(hPrinter, JobId, Level, Command) {
    static pJob := 0 ;Reserved parameters must always be NULL

    result := DllCall("winspool.drv\SetJobW", PRINTER_HANDLE, hPrinter, "uint", JobId, "uint", Level, "char*", pJob, "uint", Command, BOOL)
    return result
}

/**
 * The GetJob function retrieves information about a specified print job.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the print-job data is retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} JobId Identifies the print job for which to retrieve data. Use the [**AddJob**](addjob.md) function or [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function to get a print job identifier.
 * @param {Integer} Level The type of information returned in the *pJob* buffer. If *Level* is 1, *pJob* receives a [**JOB\_INFO\_1**](job-info-1.md) structure. If *Level* is 2, *pJob* receives a [**JOB\_INFO\_2**](job-info-2.md) structure.
 * @param {Integer} pJob A pointer to a buffer that receives a [**JOB\_INFO\_1**](job-info-1.md) or a [**JOB\_INFO\_2**](job-info-2.md) structure containing information about the job. The buffer must be large enough to store the strings pointed to by the structure members.
 * 
 * To determine the required buffer size, call **GetJob** with *cbBuf* set to zero. **GetJob** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the array.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getjob
 */
export GetJobA(hPrinter, JobId, Level, pJob, cbBuf, pcbNeeded) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetJobA", PRINTER_HANDLE, hPrinter, "uint", JobId, "uint", Level, "ptr", pJob, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetJob function retrieves information about a specified print job.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the print-job data is retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} JobId Identifies the print job for which to retrieve data. Use the [**AddJob**](addjob.md) function or [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function to get a print job identifier.
 * @param {Integer} Level The type of information returned in the *pJob* buffer. If *Level* is 1, *pJob* receives a [**JOB\_INFO\_1**](job-info-1.md) structure. If *Level* is 2, *pJob* receives a [**JOB\_INFO\_2**](job-info-2.md) structure.
 * @param {Integer} pJob A pointer to a buffer that receives a [**JOB\_INFO\_1**](job-info-1.md) or a [**JOB\_INFO\_2**](job-info-2.md) structure containing information about the job. The buffer must be large enough to store the strings pointed to by the structure members.
 * 
 * To determine the required buffer size, call **GetJob** with *cbBuf* set to zero. **GetJob** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the array.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getjob
 */
export GetJobW(hPrinter, JobId, Level, pJob, cbBuf, pcbNeeded) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetJobW", PRINTER_HANDLE, hPrinter, "uint", JobId, "uint", Level, "ptr", pJob, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The EnumJobs function retrieves information about a specified set of print jobs for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The [**JOB\_INFO\_1**](job-info-1.md) structure contains general print-job information; the [**JOB\_INFO\_2**](job-info-2.md) structure has much more detailed information. The [**JOB\_INFO\_3**](job-info-3.md) structure contains information about how jobs are linked.
 * 
 * To determine the number of print jobs in the printer queue, call the [**GetPrinter**](getprinter.md) function with the *Level* parameter set to 2.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer object whose print jobs the function enumerates. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} FirstJob The zero-based position within the print queue of the first print job to enumerate. For example, a value of 0 specifies that enumeration should begin at the first print job in the print queue; a value of 9 specifies that enumeration should begin at the tenth print job in the print queue.
 * @param {Integer} NoJobs The total number of print jobs to enumerate.
 * @param {Integer} Level The type of information returned in the *pJob* buffer.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                                                              |
 * |------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_1**](job-info-1.md) structures<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_2**](job-info-2.md) structures<br/> |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_3**](job-info-3.md) structures<br/> |
 * @param {Integer} pJob A pointer to a buffer that receives an array of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumJobs** with *cbBuf* set to zero. **EnumJobs** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the *pJob* buffer.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds. If the function fails, the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures returned in the *pJob* buffer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumjobs
 */
export EnumJobsA(hPrinter, FirstJob, NoJobs, Level, pJob, cbBuf, pcbNeeded, pcReturned) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\EnumJobsA", PRINTER_HANDLE, hPrinter, "uint", FirstJob, "uint", NoJobs, "uint", Level, "ptr", pJob, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The EnumJobs function retrieves information about a specified set of print jobs for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The [**JOB\_INFO\_1**](job-info-1.md) structure contains general print-job information; the [**JOB\_INFO\_2**](job-info-2.md) structure has much more detailed information. The [**JOB\_INFO\_3**](job-info-3.md) structure contains information about how jobs are linked.
 * 
 * To determine the number of print jobs in the printer queue, call the [**GetPrinter**](getprinter.md) function with the *Level* parameter set to 2.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer object whose print jobs the function enumerates. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} FirstJob The zero-based position within the print queue of the first print job to enumerate. For example, a value of 0 specifies that enumeration should begin at the first print job in the print queue; a value of 9 specifies that enumeration should begin at the tenth print job in the print queue.
 * @param {Integer} NoJobs The total number of print jobs to enumerate.
 * @param {Integer} Level The type of information returned in the *pJob* buffer.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                                                              |
 * |------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_1**](job-info-1.md) structures<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_2**](job-info-2.md) structures<br/> |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | *pJob* receives an array of [**JOB\_INFO\_3**](job-info-3.md) structures<br/> |
 * @param {Integer} pJob A pointer to a buffer that receives an array of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumJobs** with *cbBuf* set to zero. **EnumJobs** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the *pJob* buffer.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds. If the function fails, the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of [**JOB\_INFO\_1**](job-info-1.md), [**JOB\_INFO\_2**](job-info-2.md), or [**JOB\_INFO\_3**](job-info-3.md) structures returned in the *pJob* buffer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumjobs
 */
export EnumJobsW(hPrinter, FirstJob, NoJobs, Level, pJob, cbBuf, pcbNeeded, pcReturned) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\EnumJobsW", PRINTER_HANDLE, hPrinter, "uint", FirstJob, "uint", NoJobs, "uint", Level, "ptr", pJob, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddPrinter function adds a printer to the list of supported printers for a specified server.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * The returned handle is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
 * 
 * The following are the members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure that can be set before the **AddPrinter** function is called:
 * 
 * -   **Attributes**
 * -   **pPrintProcessor**
 * -   **DefaultPriority**
 * -   **Priority**
 * -   **pComment**
 * -   **pSecurityDescriptor**
 * -   **pDatatype**
 * -   **pSepFile**
 * -   **pDevMode**
 * -   **pShareName**
 * -   **pLocation**
 * -   **StartTime**
 * -   **pParameters**
 * -   **UntilTime**
 * 
 * The **Status**, **cJobs**, and **AveragePPM** members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure are reserved for use by the [**GetPrinter**](getprinter.md) function. They must not be set before calling **AddPrinter**.
 * 
 * If **pSecurityDescriptor** is **NULL**, the system assigns a default security descriptor to the printer. The default security descriptor has the following permissions.
 * 
 * 
 * 
 * | Value                          | Description                                                                                                                                                                                                                                                                                                                                            |
 * |--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | Administrators and Power Users | Full control on the print queue. This means members of these groups can print, manage the queue (can delete the queue, change any setting of the queue, including the security descriptor), and manage the print jobs of all users (delete, pause, resume, restart jobs).Note that Power Users do not exist before Windows XP Professional.<br/> |
 * | Creator/Owner                  | Can manage own jobs. This means that user who submit jobs can manage (delete, pause, resume, restart) their own jobs.                                                                                                                                                                                                                                  |
 * | Everyone                       | Execute and standard read control. This means that members of the everyone group can print and read properties of the print queue.                                                                                                                                                                                                                     |
 * 
 * 
 * 
 *  
 * 
 * After an application creates a printer object with the **AddPrinter** function, it must use the [**PrinterProperties**](printerproperties.md) function to specify the correct settings for the printer driver associated with the printer object.
 * 
 * The **AddPrinter** function returns an error if a printer object with the same name already exists, unless that object is marked as pending deletion. In that case, the existing printer is not deleted, and the **AddPrinter** creation parameters are used to change the existing printer settings (as if the application had used the [**SetPrinter**](setprinter.md) function).
 * 
 * Use the [**EnumPrintProcessors**](enumprintprocessors.md) function to enumerate the set of print processors installed on a server. Use the [**EnumPrintProcessorDatatypes**](enumprintprocessordatatypes.md) function to enumerate the set of data types that a print processor supports. Use the [**EnumPorts**](enumports.md) function to enumerate the set of available ports. Use the [**EnumPrinterDrivers**](enumprinterdrivers.md) function to enumerate the installed printer drivers.
 * 
 * The caller of the **AddPrinter** function must have SERVER\_ACCESS\_ADMINISTER access to the server on which the printer is to be created. The handle returned by the function will have PRINTER\_ALL\_ACCESS permission, and can be used to perform administrative operations on the printer.
 * 
 * If the **DrvPrinterEvent** function is passed the PRINTER\_EVENT\_FLAG\_NO\_UI flag, the driver should not use a UI call during **DrvPrinterEvent**. To do UI-related jobs, the installer should either use the **VendorSetup** entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about **VendorSetup**, see the Microsoft Windows Driver Development Kit (DDK).
 * 
 * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing is enabled when you run **AddPrinter**.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the printer should be installed. If this string is **NULL**, the printer is installed locally.
 * @param {Integer} Level The version of the structure to which *pPrinter* points. This value must be 2.
 * @param {Pointer<Integer>} pPrinter A pointer to a [**PRINTER\_INFO\_2**](printer-info-2.md) structure that contains information about the printer. You must specify non-**NULL** values for the **pPrinterName**, **pPortName**, **pDriverName**, and **pPrintProcessor** members of this structure before calling **AddPrinter**.
 * @returns {PRINTER_HANDLE} If the function succeeds, the return value is a handle (not thread safe) to a new printer object. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
 * 
 * If the function fails, the return value is **NULL**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinter
 */
export AddPrinterA(pName, Level, pPrinter) {
    pName := pName is String ? StrPtr(pName) : pName

    pPrinterMarshal := pPrinter is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\AddPrinterA", "ptr", pName, "uint", Level, pPrinterMarshal, pPrinter, PRINTER_HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddPrinter function adds a printer to the list of supported printers for a specified server.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * The returned handle is not thread safe. If callers need to use it concurrently on multiple threads, they must provide custom synchronization access to the printer handle using the [Synchronization Functions](/windows/desktop/Sync/synchronization-functions). To avoid writing custom code the application can open a printer handle on each thread, as needed.
 * 
 * The following are the members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure that can be set before the **AddPrinter** function is called:
 * 
 * -   **Attributes**
 * -   **pPrintProcessor**
 * -   **DefaultPriority**
 * -   **Priority**
 * -   **pComment**
 * -   **pSecurityDescriptor**
 * -   **pDatatype**
 * -   **pSepFile**
 * -   **pDevMode**
 * -   **pShareName**
 * -   **pLocation**
 * -   **StartTime**
 * -   **pParameters**
 * -   **UntilTime**
 * 
 * The **Status**, **cJobs**, and **AveragePPM** members of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure are reserved for use by the [**GetPrinter**](getprinter.md) function. They must not be set before calling **AddPrinter**.
 * 
 * If **pSecurityDescriptor** is **NULL**, the system assigns a default security descriptor to the printer. The default security descriptor has the following permissions.
 * 
 * 
 * 
 * | Value                          | Description                                                                                                                                                                                                                                                                                                                                            |
 * |--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | Administrators and Power Users | Full control on the print queue. This means members of these groups can print, manage the queue (can delete the queue, change any setting of the queue, including the security descriptor), and manage the print jobs of all users (delete, pause, resume, restart jobs).Note that Power Users do not exist before Windows XP Professional.<br/> |
 * | Creator/Owner                  | Can manage own jobs. This means that user who submit jobs can manage (delete, pause, resume, restart) their own jobs.                                                                                                                                                                                                                                  |
 * | Everyone                       | Execute and standard read control. This means that members of the everyone group can print and read properties of the print queue.                                                                                                                                                                                                                     |
 * 
 * 
 * 
 *  
 * 
 * After an application creates a printer object with the **AddPrinter** function, it must use the [**PrinterProperties**](printerproperties.md) function to specify the correct settings for the printer driver associated with the printer object.
 * 
 * The **AddPrinter** function returns an error if a printer object with the same name already exists, unless that object is marked as pending deletion. In that case, the existing printer is not deleted, and the **AddPrinter** creation parameters are used to change the existing printer settings (as if the application had used the [**SetPrinter**](setprinter.md) function).
 * 
 * Use the [**EnumPrintProcessors**](enumprintprocessors.md) function to enumerate the set of print processors installed on a server. Use the [**EnumPrintProcessorDatatypes**](enumprintprocessordatatypes.md) function to enumerate the set of data types that a print processor supports. Use the [**EnumPorts**](enumports.md) function to enumerate the set of available ports. Use the [**EnumPrinterDrivers**](enumprinterdrivers.md) function to enumerate the installed printer drivers.
 * 
 * The caller of the **AddPrinter** function must have SERVER\_ACCESS\_ADMINISTER access to the server on which the printer is to be created. The handle returned by the function will have PRINTER\_ALL\_ACCESS permission, and can be used to perform administrative operations on the printer.
 * 
 * If the **DrvPrinterEvent** function is passed the PRINTER\_EVENT\_FLAG\_NO\_UI flag, the driver should not use a UI call during **DrvPrinterEvent**. To do UI-related jobs, the installer should either use the **VendorSetup** entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about **VendorSetup**, see the Microsoft Windows Driver Development Kit (DDK).
 * 
 * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing is enabled when you run **AddPrinter**.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the printer should be installed. If this string is **NULL**, the printer is installed locally.
 * @param {Integer} Level The version of the structure to which *pPrinter* points. This value must be 2.
 * @param {Pointer<Integer>} pPrinter A pointer to a [**PRINTER\_INFO\_2**](printer-info-2.md) structure that contains information about the printer. You must specify non-**NULL** values for the **pPrinterName**, **pPortName**, **pDriverName**, and **pPrintProcessor** members of this structure before calling **AddPrinter**.
 * @returns {PRINTER_HANDLE} If the function succeeds, the return value is a handle (not thread safe) to a new printer object. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
 * 
 * If the function fails, the return value is **NULL**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinter
 */
export AddPrinterW(pName, Level, pPrinter) {
    pName := pName is String ? StrPtr(pName) : pName

    pPrinterMarshal := pPrinter is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\AddPrinterW", "ptr", pName, "uint", Level, pPrinterMarshal, pPrinter, PRINTER_HANDLE.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DeletePrinter function deletes the specified printer object.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If there are print jobs remaining to be processed for the specified printer, **DeletePrinter** marks the printer for pending deletion, and then deletes it when all the print jobs have been printed. No print jobs can be added to a printer that is marked for pending deletion.
 * 
 * A printer marked for pending deletion cannot be held, but its print jobs can be held, resumed, and restarted. If the printer is held and there are jobs for the printer, **DeletePrinter** fails with ERROR\_ACCESS\_DENIED.
 * 
 * Note that **DeletePrinter** does not close the handle that is passed to it. Thus, the application must still call [**ClosePrinter**](closeprinter.md).
 * @param {PRINTER_HANDLE} hPrinter Handle to a printer object that will be deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinter
 */
export DeletePrinter(hPrinter) {
    A_LastError := 0

    result := DllCall("winspool.drv\DeletePrinter", PRINTER_HANDLE, hPrinter, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The SetPrinter function sets the data for a specified printer or sets the state of the specified printer by pausing printing, resuming printing, or clearing all print jobs.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * You cannot use **SetPrinter** to change the default printer.
 * 
 * To modify the current printer settings, call the [**GetPrinter**](getprinter.md) function to retrieve the current settings into a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, modify the members of that structure as necessary, and then call **SetPrinter**.
 * 
 * The **SetPrinter** function ignores the **pServerName**, **AveragePPM**, **Status**, and **cJobs** members of a [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
 * 
 * Pausing a printer suspends scheduling of all print jobs for that printer, except for the one print job that may be currently printing. Print jobs can be submitted to a paused printer, but no jobs will be scheduled to print on that printer until printing is resumed. If a printer is cleared, all print jobs for that printer are deleted, except for the current print job.
 * 
 * If you use **SetPrinter** to modify the default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure for a printer (globally setting the printer defaults), you must first call the [**DocumentProperties**](documentproperties.md) function to validate the **DEVMODE** structure.
 * 
 * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function can set only those components of the security descriptor that the caller has permission to modify. To set particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) or [**OpenPrinter2**](openprinter2.md) function to retrieve a handle to the printer. The following table shows the access rights required to modify the various security descriptor components.
 * 
 * 
 * 
 * | Access permission            | Security descriptor component             |
 * |------------------------------|-------------------------------------------|
 * | **WRITE\_OWNER**             | Owner<br/> Primary group<br/> |
 * | **WRITE\_DAC**               | Discretionary access-control list (DACL)  |
 * | **ACCESS\_SYSTEM\_SECURITY** | System access-control list (SACL)         |
 * 
 * 
 * 
 *  
 * 
 * If the security descriptor contains a component that the caller does not have the access right to modify, **SetPrinter** fails. Those components of a security descriptor that you don't want to modify should be **NULL** or not be present, as appropriate. If you do not want to modify the security descriptor, and are calling **SetPrinter** with a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, set the **pSecurityDescriptor** member of that structure to **NULL**.
 * 
 * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If **SetPrinter** is called by a machine admin, it enables the exception. If it is called by a non-admin and the exception has not already been enabled, the call fails.
 * 
 * You can use level 7 with the [**PRINTER\_INFO\_7**](printer-info-7.md) structure to publish, unpublish, or update directory service data for the printer. The directory service data for a printer includes all the data stored under the SPLDS\_\* keys by calls to the [**SetPrinterDataEx**](setprinterdataex.md) function for the printer. Before calling **SetPrinter**, set the **pszObjectGUID** member of **PRINTER\_INFO\_7** to **NULL** and set the *dwAction* member to one of the following values.
 * 
 * 
 * 
 * | Value                             | Description                                                                                                                                                                                                                                                                                                                                                                             |
 * |-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **DSPRINT\_PUBLISH**<br/>   | Publishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                        |
 * | **DSPRINT\_REPUBLISH**<br/> | The directory service data for the printer is unpublished and then published again, refreshing all properties in the published printer. Re-publishing also changes the GUID of the published printer. Use this value if you suspect the printer's published data has been corrupted.<br/>                                                                                         |
 * | **DSPRINT\_UNPUBLISH**<br/> | Unpublishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                      |
 * | **DSPRINT\_UPDATE**<br/>    | Updates the directory service data. This is the same as **DSPRINT\_PUBLISH**, except that **SetPrinter** fails with **ERROR\_FILE\_NOT\_FOUND** if the printer is not already published.<br/> Use **DSPRINT\_UPDATE** to update published properties but not force publishing. Printer drivers should always use **DSPRINT\_UPDATE** rather than **DSPRINT\_PUBLISH**.<br/> |
 * 
 * 
 * 
 *  
 * 
 * **DSPRINT\_PENDING** is not a valid *dwAction* value for **SetPrinter**.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The type of data that the function stores into the buffer pointed to by *pPrinter*. If the *Command* parameter is not equal to zero, the *Level* parameter must be zero.
 * 
 * This value can be 0, 2, 3, 4, 5, 6, 7, 8, or 9.
 * @param {Pointer<Integer>} pPrinter A pointer to a buffer containing data to set for the printer, or containing information for the command specified by the *Command* parameter. The type of data in the buffer is determined by the value of *Level*.
 * 
 * 
 * 
 * | Level                                                                                                | Structure                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
 * |------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="0"></span><dl> <dt>**0**</dt> </dl> | If the *Command* parameter is **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must contain a **DWORD** value that specifies the new printer status to set. For a list of the possible status values, see the **Status** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure. Note that **PRINTER\_STATUS\_PAUSED** and **PRINTER\_STATUS\_PENDING\_DELETION** are not valid status values to set.<br/> If *Level* is 0, but the *Command* parameter is not **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must be **NULL**.<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                     |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                         |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/>                                                                                                                                                                                                                                                                                                                                         |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                       |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                              |
 * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure. The *dwAction* member of this structure indicates whether **SetPrinter** should publish, unpublish, re-publish, or update the printer's data in the directory service.<br/>                                                                                                                                                                                                                                                                                                                |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                        |
 * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                      |
 * @param {Integer} Command The action to perform.
 * 
 * If the *Level* parameter is nonzero, set the value of this parameter to zero. In this case, the printer retains its current state and the function reconfigures the printer data as specified by the *Level* and *pPrinter* parameters.
 * 
 * If the *Level* parameter is zero, set the value of this parameter to one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                  | Meaning                                                                                                                                             |
 * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="PRINTER_CONTROL_PAUSE"></span><span id="printer_control_pause"></span><dl> <dt>**PRINTER\_CONTROL\_PAUSE**</dt> </dl>                 | Pause the printer.<br/>                                                                                                                       |
 * | <span id="PRINTER_CONTROL_PURGE"></span><span id="printer_control_purge"></span><dl> <dt>**PRINTER\_CONTROL\_PURGE**</dt> </dl>                 | Delete all print jobs in the printer.<br/>                                                                                                    |
 * | <span id="PRINTER_CONTROL_RESUME"></span><span id="printer_control_resume"></span><dl> <dt>**PRINTER\_CONTROL\_RESUME**</dt> </dl>              | Resume a paused printer.<br/>                                                                                                                 |
 * | <span id="PRINTER_CONTROL_SET_STATUS"></span><span id="printer_control_set_status"></span><dl> <dt>**PRINTER\_CONTROL\_SET\_STATUS**</dt> </dl> | Set the printer status.<br/> Set the *pPrinter* parameter to a pointer to a **DWORD** value that specifies the new printer status.<br/> |
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * 
 * If *Level* is 7 and the publish action failed, **SetPrinter** returns **ERROR\_IO\_PENDING** and attempts to complete the action in the background. If *Level* is 7 and the update action failed, **SetPrinter** returns **ERROR\_FILE\_NOT\_FOUND**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setprinter
 */
export SetPrinterA(hPrinter, Level, pPrinter, Command) {
    pPrinterMarshal := pPrinter is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\SetPrinterA", PRINTER_HANDLE, hPrinter, "uint", Level, pPrinterMarshal, pPrinter, "uint", Command, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The SetPrinter function sets the data for a specified printer or sets the state of the specified printer by pausing printing, resuming printing, or clearing all print jobs.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * You cannot use **SetPrinter** to change the default printer.
 * 
 * To modify the current printer settings, call the [**GetPrinter**](getprinter.md) function to retrieve the current settings into a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, modify the members of that structure as necessary, and then call **SetPrinter**.
 * 
 * The **SetPrinter** function ignores the **pServerName**, **AveragePPM**, **Status**, and **cJobs** members of a [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
 * 
 * Pausing a printer suspends scheduling of all print jobs for that printer, except for the one print job that may be currently printing. Print jobs can be submitted to a paused printer, but no jobs will be scheduled to print on that printer until printing is resumed. If a printer is cleared, all print jobs for that printer are deleted, except for the current print job.
 * 
 * If you use **SetPrinter** to modify the default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure for a printer (globally setting the printer defaults), you must first call the [**DocumentProperties**](documentproperties.md) function to validate the **DEVMODE** structure.
 * 
 * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function can set only those components of the security descriptor that the caller has permission to modify. To set particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) or [**OpenPrinter2**](openprinter2.md) function to retrieve a handle to the printer. The following table shows the access rights required to modify the various security descriptor components.
 * 
 * 
 * 
 * | Access permission            | Security descriptor component             |
 * |------------------------------|-------------------------------------------|
 * | **WRITE\_OWNER**             | Owner<br/> Primary group<br/> |
 * | **WRITE\_DAC**               | Discretionary access-control list (DACL)  |
 * | **ACCESS\_SYSTEM\_SECURITY** | System access-control list (SACL)         |
 * 
 * 
 * 
 *  
 * 
 * If the security descriptor contains a component that the caller does not have the access right to modify, **SetPrinter** fails. Those components of a security descriptor that you don't want to modify should be **NULL** or not be present, as appropriate. If you do not want to modify the security descriptor, and are calling **SetPrinter** with a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, set the **pSecurityDescriptor** member of that structure to **NULL**.
 * 
 * The Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If **SetPrinter** is called by a machine admin, it enables the exception. If it is called by a non-admin and the exception has not already been enabled, the call fails.
 * 
 * You can use level 7 with the [**PRINTER\_INFO\_7**](printer-info-7.md) structure to publish, unpublish, or update directory service data for the printer. The directory service data for a printer includes all the data stored under the SPLDS\_\* keys by calls to the [**SetPrinterDataEx**](setprinterdataex.md) function for the printer. Before calling **SetPrinter**, set the **pszObjectGUID** member of **PRINTER\_INFO\_7** to **NULL** and set the *dwAction* member to one of the following values.
 * 
 * 
 * 
 * | Value                             | Description                                                                                                                                                                                                                                                                                                                                                                             |
 * |-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **DSPRINT\_PUBLISH**<br/>   | Publishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                        |
 * | **DSPRINT\_REPUBLISH**<br/> | The directory service data for the printer is unpublished and then published again, refreshing all properties in the published printer. Re-publishing also changes the GUID of the published printer. Use this value if you suspect the printer's published data has been corrupted.<br/>                                                                                         |
 * | **DSPRINT\_UNPUBLISH**<br/> | Unpublishes the directory service data.<br/>                                                                                                                                                                                                                                                                                                                                      |
 * | **DSPRINT\_UPDATE**<br/>    | Updates the directory service data. This is the same as **DSPRINT\_PUBLISH**, except that **SetPrinter** fails with **ERROR\_FILE\_NOT\_FOUND** if the printer is not already published.<br/> Use **DSPRINT\_UPDATE** to update published properties but not force publishing. Printer drivers should always use **DSPRINT\_UPDATE** rather than **DSPRINT\_PUBLISH**.<br/> |
 * 
 * 
 * 
 *  
 * 
 * **DSPRINT\_PENDING** is not a valid *dwAction* value for **SetPrinter**.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The type of data that the function stores into the buffer pointed to by *pPrinter*. If the *Command* parameter is not equal to zero, the *Level* parameter must be zero.
 * 
 * This value can be 0, 2, 3, 4, 5, 6, 7, 8, or 9.
 * @param {Pointer<Integer>} pPrinter A pointer to a buffer containing data to set for the printer, or containing information for the command specified by the *Command* parameter. The type of data in the buffer is determined by the value of *Level*.
 * 
 * 
 * 
 * | Level                                                                                                | Structure                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
 * |------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="0"></span><dl> <dt>**0**</dt> </dl> | If the *Command* parameter is **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must contain a **DWORD** value that specifies the new printer status to set. For a list of the possible status values, see the **Status** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure. Note that **PRINTER\_STATUS\_PAUSED** and **PRINTER\_STATUS\_PENDING\_DELETION** are not valid status values to set.<br/> If *Level* is 0, but the *Command* parameter is not **PRINTER\_CONTROL\_SET\_STATUS**, *pPrinter* must be **NULL**.<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                     |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                         |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/>                                                                                                                                                                                                                                                                                                                                         |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                       |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                              |
 * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure. The *dwAction* member of this structure indicates whether **SetPrinter** should publish, unpublish, re-publish, or update the printer's data in the directory service.<br/>                                                                                                                                                                                                                                                                                                                |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                        |
 * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                                                                                                                                                                                                                                                                                                                                                                      |
 * @param {Integer} Command The action to perform.
 * 
 * If the *Level* parameter is nonzero, set the value of this parameter to zero. In this case, the printer retains its current state and the function reconfigures the printer data as specified by the *Level* and *pPrinter* parameters.
 * 
 * If the *Level* parameter is zero, set the value of this parameter to one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                  | Meaning                                                                                                                                             |
 * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="PRINTER_CONTROL_PAUSE"></span><span id="printer_control_pause"></span><dl> <dt>**PRINTER\_CONTROL\_PAUSE**</dt> </dl>                 | Pause the printer.<br/>                                                                                                                       |
 * | <span id="PRINTER_CONTROL_PURGE"></span><span id="printer_control_purge"></span><dl> <dt>**PRINTER\_CONTROL\_PURGE**</dt> </dl>                 | Delete all print jobs in the printer.<br/>                                                                                                    |
 * | <span id="PRINTER_CONTROL_RESUME"></span><span id="printer_control_resume"></span><dl> <dt>**PRINTER\_CONTROL\_RESUME**</dt> </dl>              | Resume a paused printer.<br/>                                                                                                                 |
 * | <span id="PRINTER_CONTROL_SET_STATUS"></span><span id="printer_control_set_status"></span><dl> <dt>**PRINTER\_CONTROL\_SET\_STATUS**</dt> </dl> | Set the printer status.<br/> Set the *pPrinter* parameter to a pointer to a **DWORD** value that specifies the new printer status.<br/> |
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * 
 * If *Level* is 7 and the publish action failed, **SetPrinter** returns **ERROR\_IO\_PENDING** and attempts to complete the action in the background. If *Level* is 7 and the update action failed, **SetPrinter** returns **ERROR\_FILE\_NOT\_FOUND**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setprinter
 */
export SetPrinterW(hPrinter, Level, pPrinter, Command) {
    pPrinterMarshal := pPrinter is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\SetPrinterW", PRINTER_HANDLE, hPrinter, "uint", Level, pPrinterMarshal, pPrinter, "uint", Command, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The GetPrinter function retrieves information about a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **pDevMode** member in the [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_8**](printer-info-8.md), and [**PRINTER\_INFO\_9**](printer-info-9.md) structures can be **NULL**. When this happens, the printer is unusable until the driver is reinstalled successfully.
 * 
 * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function retrieves only those components of the security descriptor that the caller has permission to read. To retrieve particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) function to retrieve a handle to the printer. The following table shows the access rights required to read the various security descriptor components.
 * 
 * 
 * 
 * | Access Right                        | Security Descriptor Component                                                                 |
 * |-------------------------------------|-----------------------------------------------------------------------------------------------|
 * | READ\_CONTROL<br/>            | Owner<br/> Primary group<br/> Discretionary access-control list (DACL)<br/> |
 * | ACCESS\_SYSTEM\_SECURITY<br/> | System access-control list (SACL)<br/>                                                  |
 * 
 * 
 * 
 *  
 * 
 * If you specify level 7, the **dwAction** member of [**PRINTER\_INFO\_7**](printer-info-7.md) returns one of the following values to indicate whether the printer is published in the directory service.
 * 
 * 
 * 
 * | dwAction value     | Meaning                                                                                                                                                                                                                                                  |
 * |--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | DSPRINT\_PUBLISH   | The printer is published. The **pszObjectGUID** member contains the GUID of the directory services print queue object associated with the printer.                                                                                                       |
 * | DSPRINT\_UNPUBLISH | The printer is not published.                                                                                                                                                                                                                            |
 * | DSPRINT\_PENDING   | Indicates that the system is attempting to complete a publish or unpublish operation. If a [**SetPrinter**](setprinter.md) call fails to publish or unpublish a printer, the system makes further attempts to complete the operation in the background. |
 * 
 * 
 * 
 *  
 * 
 * Starting with Windows Vista, the printer data returned by **GetPrinter** is retrieved from a local cache when *hPrinter* refers to a printer hosted by a print server and there is at least one open connection to the print server. In all other configurations, the printer data is queried from the print server.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function retrieves information. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The level or type of structure that the function stores into the buffer pointed to by *pPrinter*.
 * 
 * This value can be 1, 2, 3, 4, 5, 6, 7, 8 or 9.
 * @param {Integer} pPrinter A pointer to a buffer that receives a structure containing information about the specified printer. The buffer must be large enough to receive the structure and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
 * 
 * The type of structure is determined by the value of *Level*.
 * 
 * 
 * 
 * | Level                                                                                                | Structure                                                                                                                                                                                                        |
 * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | A [**PRINTER\_INFO\_1**](printer-info-1.md) structure containing general printer information.<br/>                                                                                                        |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                             |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                 |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/> |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                               |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                      |
 * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure that indicates whether the printer is published in the directory service.<br/>                                                                      |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                |
 * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                              |
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinter*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that the function sets to the size, in bytes, of the printer information. If *cbBuf* is smaller than this value, **GetPrinter** fails, and the value represents the required buffer size. If *cbBuf* is equal to or greater than this value, **GetPrinter** succeeds, and the value represents the number of bytes stored in the buffer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinter
 */
export GetPrinterA(hPrinter, Level, pPrinter, cbBuf, pcbNeeded) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\GetPrinterA", PRINTER_HANDLE, hPrinter, "uint", Level, "ptr", pPrinter, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The GetPrinter function retrieves information about a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **pDevMode** member in the [**PRINTER\_INFO\_2**](printer-info-2.md), [**PRINTER\_INFO\_8**](printer-info-8.md), and [**PRINTER\_INFO\_9**](printer-info-9.md) structures can be **NULL**. When this happens, the printer is unusable until the driver is reinstalled successfully.
 * 
 * For the [**PRINTER\_INFO\_2**](printer-info-2.md) and [**PRINTER\_INFO\_3**](printer-info-3.md) structures that contain a pointer to a security descriptor, the function retrieves only those components of the security descriptor that the caller has permission to read. To retrieve particular security descriptor components, you must specify the necessary access rights when you call the [**OpenPrinter**](openprinter.md) function to retrieve a handle to the printer. The following table shows the access rights required to read the various security descriptor components.
 * 
 * 
 * 
 * | Access Right                        | Security Descriptor Component                                                                 |
 * |-------------------------------------|-----------------------------------------------------------------------------------------------|
 * | READ\_CONTROL<br/>            | Owner<br/> Primary group<br/> Discretionary access-control list (DACL)<br/> |
 * | ACCESS\_SYSTEM\_SECURITY<br/> | System access-control list (SACL)<br/>                                                  |
 * 
 * 
 * 
 *  
 * 
 * If you specify level 7, the **dwAction** member of [**PRINTER\_INFO\_7**](printer-info-7.md) returns one of the following values to indicate whether the printer is published in the directory service.
 * 
 * 
 * 
 * | dwAction value     | Meaning                                                                                                                                                                                                                                                  |
 * |--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | DSPRINT\_PUBLISH   | The printer is published. The **pszObjectGUID** member contains the GUID of the directory services print queue object associated with the printer.                                                                                                       |
 * | DSPRINT\_UNPUBLISH | The printer is not published.                                                                                                                                                                                                                            |
 * | DSPRINT\_PENDING   | Indicates that the system is attempting to complete a publish or unpublish operation. If a [**SetPrinter**](setprinter.md) call fails to publish or unpublish a printer, the system makes further attempts to complete the operation in the background. |
 * 
 * 
 * 
 *  
 * 
 * Starting with Windows Vista, the printer data returned by **GetPrinter** is retrieved from a local cache when *hPrinter* refers to a printer hosted by a print server and there is at least one open connection to the print server. In all other configurations, the printer data is queried from the print server.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function retrieves information. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The level or type of structure that the function stores into the buffer pointed to by *pPrinter*.
 * 
 * This value can be 1, 2, 3, 4, 5, 6, 7, 8 or 9.
 * @param {Integer} pPrinter A pointer to a buffer that receives a structure containing information about the specified printer. The buffer must be large enough to receive the structure and any strings or other data to which the structure members point. If the buffer is too small, the *pcbNeeded* parameter returns the required buffer size.
 * 
 * The type of structure is determined by the value of *Level*.
 * 
 * 
 * 
 * | Level                                                                                                | Structure                                                                                                                                                                                                        |
 * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | A [**PRINTER\_INFO\_1**](printer-info-1.md) structure containing general printer information.<br/>                                                                                                        |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | A [**PRINTER\_INFO\_2**](printer-info-2.md) structure containing detailed information about the printer.<br/>                                                                                             |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | A [**PRINTER\_INFO\_3**](printer-info-3.md) structure containing the printer's security information.<br/>                                                                                                 |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | A [**PRINTER\_INFO\_4**](printer-info-4.md) structure containing minimal printer information, including the name of the printer, the name of the server, and whether the printer is remote or local.<br/> |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | A [**PRINTER\_INFO\_5**](printer-info-5.md) structure containing printer information such as printer attributes and time-out settings.<br/>                                                               |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | A [**PRINTER\_INFO\_6**](printer-info-6.md) structure specifying the status value of a printer.<br/>                                                                                                      |
 * | <span id="7"></span><dl> <dt>**7**</dt> </dl> | A [**PRINTER\_INFO\_7**](printer-info-7.md) structure that indicates whether the printer is published in the directory service.<br/>                                                                      |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | A [**PRINTER\_INFO\_8**](printer-info-8.md) structure specifying the global default printer settings.<br/>                                                                                                |
 * | <span id="9"></span><dl> <dt>**9**</dt> </dl> | A [**PRINTER\_INFO\_9**](printer-info-9.md) structure specifying the per-user default printer settings.<br/>                                                                                              |
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrinter*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that the function sets to the size, in bytes, of the printer information. If *cbBuf* is smaller than this value, **GetPrinter** fails, and the value represents the required buffer size. If *cbBuf* is equal to or greater than this value, **GetPrinter** succeeds, and the value represents the number of bytes stored in the buffer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinter
 */
export GetPrinterW(hPrinter, Level, pPrinter, cbBuf, pcbNeeded) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\GetPrinterW", PRINTER_HANDLE, hPrinter, "uint", Level, "ptr", pPrinter, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddPrinterDriver function installs a local or remote printer driver and associates the configuration, data, and driver files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before an application calls the **AddPrinterDriver** function, all files required by the driver must be copied to the system's printer-driver directory. An application can retrieve the name of this directory by calling the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
 * 
 * An application can determine which printer drivers are currently installed by calling the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed.
 * 
 * If *pName* is **NULL**, the driver will be installed locally.
 * @param {Integer} Level The version of the structure to which *pDriverInfo* points.
 * 
 * This value can be 2, 3, 4, 6, or 8.
 * @param {Pointer<Integer>} pDriverInfo A pointer to a structure containing printer driver information. This depends on the value of *Level*.
 * 
 * 
 * 
 * | Value | Printer Drive Structure                  |
 * |-------|------------------------------------------|
 * | 2     | [**DRIVER\_INFO\_2**](driver-info-2.md) |
 * | 3     | [**DRIVER\_INFO\_3**](driver-info-3.md) |
 * | 4     | [**DRIVER\_INFO\_4**](driver-info-4.md) |
 * | 6     | [**DRIVER\_INFO\_6**](driver-info-6.md) |
 * | 8     | [**DRIVER\_INFO\_8**](driver-info-8.md) |
 * 
 * 
 * 
 *  
 * 
 * If the **pEnvironment** member of the structure pointed to by *pDriverInfo* is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriver
 */
export AddPrinterDriverA(pName, Level, pDriverInfo) {
    pName := pName is String ? StrPtr(pName) : pName

    pDriverInfoMarshal := pDriverInfo is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\AddPrinterDriverA", "ptr", pName, "uint", Level, pDriverInfoMarshal, pDriverInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddPrinterDriver function installs a local or remote printer driver and associates the configuration, data, and driver files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before an application calls the **AddPrinterDriver** function, all files required by the driver must be copied to the system's printer-driver directory. An application can retrieve the name of this directory by calling the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
 * 
 * An application can determine which printer drivers are currently installed by calling the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed.
 * 
 * If *pName* is **NULL**, the driver will be installed locally.
 * @param {Integer} Level The version of the structure to which *pDriverInfo* points.
 * 
 * This value can be 2, 3, 4, 6, or 8.
 * @param {Pointer<Integer>} pDriverInfo A pointer to a structure containing printer driver information. This depends on the value of *Level*.
 * 
 * 
 * 
 * | Value | Printer Drive Structure                  |
 * |-------|------------------------------------------|
 * | 2     | [**DRIVER\_INFO\_2**](driver-info-2.md) |
 * | 3     | [**DRIVER\_INFO\_3**](driver-info-3.md) |
 * | 4     | [**DRIVER\_INFO\_4**](driver-info-4.md) |
 * | 6     | [**DRIVER\_INFO\_6**](driver-info-6.md) |
 * | 8     | [**DRIVER\_INFO\_8**](driver-info-8.md) |
 * 
 * 
 * 
 *  
 * 
 * If the **pEnvironment** member of the structure pointed to by *pDriverInfo* is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriver
 */
export AddPrinterDriverW(pName, Level, pDriverInfo) {
    pName := pName is String ? StrPtr(pName) : pName

    pDriverInfoMarshal := pDriverInfo is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\AddPrinterDriverW", "ptr", pName, "uint", Level, pDriverInfoMarshal, pDriverInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddPrinterDriverEx function installs a local or remote printer driver and links the configuration, data, and driver files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before calling the **AddPrinterDriverEx** function, all files required by the driver must be copied to the system's printer-driver directory. To retrieve the name of this directory, call the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
 * 
 * To determine which printer drivers are currently installed, call the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
 * 
 * If the printer driver has been successfully added, the function calls the DrvDriverEvent (DRIVER\_EVENT\_INITIALIZE, Level, DRIVER\_INFO\_\*, lparam ) function to allow the driver to perform any initializations required during the installation of a printer driver. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK)
 * 
 * The driver should not use a UI call during the call to **DrvDriverEvent**. To do UI-related jobs, the installer should either use the VendorSetup entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about VendorSetup, see the DDK.
 * 
 * The files that are referenced in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure must be local to the machine from which the call is made. A file name can be a UNC name as long as the UNC name is the local machine.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed. If this parameter is **NULL**, the function installs the driver on the local computer.
 * @param {Integer} Level The version of the structure to which *pDriverInfo* points. This value can be 2, 3, 4, 6, or 8.
 * @param {Pointer<Integer>} lpbDriverInfo 
 * @param {Integer} dwFileCopyFlags The options for copying the driver files. This parameter can be one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                         | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="APD_COPY_ALL_FILES"></span><span id="apd_copy_all_files"></span><dl> <dt>**APD\_COPY\_ALL\_FILES**</dt> </dl>                | Add the printer driver and copy all the files in the printer-driver directory. The file time stamps are ignored with this option.<br/>                                                                                                                                                                                                                                                                                                                                                                                  |
 * | <span id="APD_COPY_FROM_DIRECTORY"></span><span id="apd_copy_from_directory"></span><dl> <dt>**APD\_COPY\_FROM\_DIRECTORY**</dt> </dl> | Add the printer driver using the fully qualified file names specified in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure. This flag is ORed in conjunction with one of the other copy flags. If this flag is set, **AddPrinterDriverEx** will fail if the files do not exist where they are specified to exist by the **DRIVER\_INFO\_6** structure. The files do not need to be copied to the system's printer-driver directory. See the Remarks.<br/> **Windows 2000:** This flag is not supported.<br/> |
 * | <span id="APD_COPY_NEW_FILES"></span><span id="apd_copy_new_files"></span><dl> <dt>**APD\_COPY\_NEW\_FILES**</dt> </dl>                | Add the printer driver and copy the files in the printer-driver directory that are newer than any corresponding files that are currently in use. This flag emulates the behavior of [**AddPrinterDriver**](addprinterdriver.md).<br/>                                                                                                                                                                                                                                                                                  |
 * | <span id="APD_STRICT_DOWNGRADE"></span><span id="apd_strict_downgrade"></span><dl> <dt>**APD\_STRICT\_DOWNGRADE**</dt> </dl>           | Add the printer driver only if all the files in the printer-driver directory are older than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
 * | <span id="APD_STRICT_UPGRADE"></span><span id="apd_strict_upgrade"></span><dl> <dt>**APD\_STRICT\_UPGRADE**</dt> </dl>                 | Add the printer driver only if all the files in the printer-driver directory are newer than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * 
 * If the printer driver is known to have problems working with the operating system, **AddPrinterDriverEx** will fail with one of the following error codes:
 * 
 * 
 * 
 * | Error Code                      | Meaning                                                                                                                                                   |
 * |---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | ERROR\_PRINTER\_DRIVER\_BLOCKED | The driver does not work on the operating system.                                                                                                         |
 * | ERROR\_PRINTER\_DRIVER\_WARNED  | The driver is unreliable on the operating system. However, if APD\_INSTALL\_WARNED\_DRIVER is specified, the driver is installed and no warning is given. |
 * 
 * 
 * 
 *  
 * 
 * For more information, see the Remarks.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriverex
 */
export AddPrinterDriverExA(pName, Level, lpbDriverInfo, dwFileCopyFlags) {
    pName := pName is String ? StrPtr(pName) : pName

    lpbDriverInfoMarshal := lpbDriverInfo is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\AddPrinterDriverExA", "ptr", pName, "uint", Level, lpbDriverInfoMarshal, lpbDriverInfo, "uint", dwFileCopyFlags, BOOL)
    return result
}

/**
 * The AddPrinterDriverEx function installs a local or remote printer driver and links the configuration, data, and driver files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before calling the **AddPrinterDriverEx** function, all files required by the driver must be copied to the system's printer-driver directory. To retrieve the name of this directory, call the [**GetPrinterDriverDirectory**](getprinterdriverdirectory.md) function.
 * 
 * To determine which printer drivers are currently installed, call the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
 * 
 * If the printer driver has been successfully added, the function calls the DrvDriverEvent (DRIVER\_EVENT\_INITIALIZE, Level, DRIVER\_INFO\_\*, lparam ) function to allow the driver to perform any initializations required during the installation of a printer driver. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK)
 * 
 * The driver should not use a UI call during the call to **DrvDriverEvent**. To do UI-related jobs, the installer should either use the VendorSetup entry in the printer's .inf file or, for Plug and Play devices, the installer can use a device-specific co-installer. For more information about VendorSetup, see the DDK.
 * 
 * The files that are referenced in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure must be local to the machine from which the call is made. A file name can be a UNC name as long as the UNC name is the local machine.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the driver should be installed. If this parameter is **NULL**, the function installs the driver on the local computer.
 * @param {Integer} Level The version of the structure to which *pDriverInfo* points. This value can be 2, 3, 4, 6, or 8.
 * @param {Pointer<Integer>} lpbDriverInfo 
 * @param {Integer} dwFileCopyFlags The options for copying the driver files. This parameter can be one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                         | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="APD_COPY_ALL_FILES"></span><span id="apd_copy_all_files"></span><dl> <dt>**APD\_COPY\_ALL\_FILES**</dt> </dl>                | Add the printer driver and copy all the files in the printer-driver directory. The file time stamps are ignored with this option.<br/>                                                                                                                                                                                                                                                                                                                                                                                  |
 * | <span id="APD_COPY_FROM_DIRECTORY"></span><span id="apd_copy_from_directory"></span><dl> <dt>**APD\_COPY\_FROM\_DIRECTORY**</dt> </dl> | Add the printer driver using the fully qualified file names specified in the [**DRIVER\_INFO\_6**](driver-info-6.md) structure. This flag is ORed in conjunction with one of the other copy flags. If this flag is set, **AddPrinterDriverEx** will fail if the files do not exist where they are specified to exist by the **DRIVER\_INFO\_6** structure. The files do not need to be copied to the system's printer-driver directory. See the Remarks.<br/> **Windows 2000:** This flag is not supported.<br/> |
 * | <span id="APD_COPY_NEW_FILES"></span><span id="apd_copy_new_files"></span><dl> <dt>**APD\_COPY\_NEW\_FILES**</dt> </dl>                | Add the printer driver and copy the files in the printer-driver directory that are newer than any corresponding files that are currently in use. This flag emulates the behavior of [**AddPrinterDriver**](addprinterdriver.md).<br/>                                                                                                                                                                                                                                                                                  |
 * | <span id="APD_STRICT_DOWNGRADE"></span><span id="apd_strict_downgrade"></span><dl> <dt>**APD\_STRICT\_DOWNGRADE**</dt> </dl>           | Add the printer driver only if all the files in the printer-driver directory are older than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
 * | <span id="APD_STRICT_UPGRADE"></span><span id="apd_strict_upgrade"></span><dl> <dt>**APD\_STRICT\_UPGRADE**</dt> </dl>                 | Add the printer driver only if all the files in the printer-driver directory are newer than any corresponding files currently in use.<br/>                                                                                                                                                                                                                                                                                                                                                                              |
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * 
 * If the printer driver is known to have problems working with the operating system, **AddPrinterDriverEx** will fail with one of the following error codes:
 * 
 * 
 * 
 * | Error Code                      | Meaning                                                                                                                                                   |
 * |---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | ERROR\_PRINTER\_DRIVER\_BLOCKED | The driver does not work on the operating system.                                                                                                         |
 * | ERROR\_PRINTER\_DRIVER\_WARNED  | The driver is unreliable on the operating system. However, if APD\_INSTALL\_WARNED\_DRIVER is specified, the driver is installed and no warning is given. |
 * 
 * 
 * 
 *  
 * 
 * For more information, see the Remarks.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterdriverex
 */
export AddPrinterDriverExW(pName, Level, lpbDriverInfo, dwFileCopyFlags) {
    pName := pName is String ? StrPtr(pName) : pName

    lpbDriverInfoMarshal := lpbDriverInfo is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\AddPrinterDriverExW", "ptr", pName, "uint", Level, lpbDriverInfoMarshal, lpbDriverInfo, "uint", dwFileCopyFlags, BOOL)
    return result
}

/**
 * The EnumPrinterDrivers function enumerates the printer drivers installed on a specified printer server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the printer drivers are enumerated.
 * 
 * If *pName* is **NULL**, the function enumerates the local printer drivers.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, Windows x64, or Windows NT R4000). If this parameter is **NULL**, the function uses the current environment of the caller/client (not of the destination/server).
 * 
 * If the *pEnvironment* string specifies "all", **EnumPrinterDrivers** enumerates printer drivers for all platforms installed on the specified server.
 * @param {Integer} Level The type of information structure returned in the *pDriverInfo* buffer. It can be one of the following.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                             |
 * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
 * @param {Integer} pDriverInfo A pointer to a buffer that receives an array of DRIVER\_INFO\_\* structures, as specified by *Level*. Each structure contains data that describes an available printer driver. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumPrinterDrivers** with *cbBuf* set to zero. **EnumPrinterDrivers** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDriverInfo*
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDriverInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDriverInfo* buffer. This is the number of printer drivers installed on the specified print server.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdrivers
 */
export EnumPrinterDriversA(pName, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\EnumPrinterDriversA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The EnumPrinterDrivers function enumerates the printer drivers installed on a specified printer server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the printer drivers are enumerated.
 * 
 * If *pName* is **NULL**, the function enumerates the local printer drivers.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, Windows x64, or Windows NT R4000). If this parameter is **NULL**, the function uses the current environment of the caller/client (not of the destination/server).
 * 
 * If the *pEnvironment* string specifies "all", **EnumPrinterDrivers** enumerates printer drivers for all platforms installed on the specified server.
 * @param {Integer} Level The type of information structure returned in the *pDriverInfo* buffer. It can be one of the following.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                             |
 * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
 * @param {Integer} pDriverInfo A pointer to a buffer that receives an array of DRIVER\_INFO\_\* structures, as specified by *Level*. Each structure contains data that describes an available printer driver. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumPrinterDrivers** with *cbBuf* set to zero. **EnumPrinterDrivers** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDriverInfo*
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDriverInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDriverInfo* buffer. This is the number of printer drivers installed on the specified print server.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdrivers
 */
export EnumPrinterDriversW(pName, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\EnumPrinterDriversW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The GetPrinterDriver function retrieves driver data for the specified printer. If the driver is not installed on the local computer, GetPrinterDriver installs it.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The [**DRIVER\_INFO\_2**](driver-info-2.md), [**DRIVER\_INFO\_3**](driver-info-3.md), [**DRIVER\_INFO\_4**](driver-info-4.md), [**DRIVER\_INFO\_5**](driver-info-5.md), and [**DRIVER\_INFO\_6**](driver-info-6.md) structures contain the file name or the full path and file name of the printer driver in the **pDriverPath** member. An application can use the path and file name to load a printer driver by calling the [**LoadLibrary**](/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya) function and supplying the path and file name as the single argument.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the driver data should be retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The printer driver structure returned in the *pDriverInfo* buffer. This parameter can be one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                             |
 * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
 * @param {Integer} pDriverInfo A pointer to a buffer that receives a structure containing information about the driver, as specified by Level. The buffer must be large enough to store the strings pointed to by the structure members.
 * 
 * To determine the required buffer size, call **GetPrinterDriver** with *cbBuf* set to zero. **GetPrinterDriver** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the array at which *pDriverInfo* points.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * 
 * For a non-existent driver, the function returns ERROR\_UNKNOWN\_PRINTER\_DRIVER.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver
 */
export GetPrinterDriverA(hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDriverA", PRINTER_HANDLE, hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetPrinterDriver function retrieves driver data for the specified printer. If the driver is not installed on the local computer, GetPrinterDriver installs it.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The [**DRIVER\_INFO\_2**](driver-info-2.md), [**DRIVER\_INFO\_3**](driver-info-3.md), [**DRIVER\_INFO\_4**](driver-info-4.md), [**DRIVER\_INFO\_5**](driver-info-5.md), and [**DRIVER\_INFO\_6**](driver-info-6.md) structures contain the file name or the full path and file name of the printer driver in the **pDriverPath** member. An application can use the path and file name to load a printer driver by calling the [**LoadLibrary**](/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya) function and supplying the path and file name as the single argument.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the driver data should be retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The printer driver structure returned in the *pDriverInfo* buffer. This parameter can be one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                             |
 * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
 * @param {Integer} pDriverInfo A pointer to a buffer that receives a structure containing information about the driver, as specified by Level. The buffer must be large enough to store the strings pointed to by the structure members.
 * 
 * To determine the required buffer size, call **GetPrinterDriver** with *cbBuf* set to zero. **GetPrinterDriver** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the array at which *pDriverInfo* points.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * 
 * For a non-existent driver, the function returns ERROR\_UNKNOWN\_PRINTER\_DRIVER.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver
 */
export GetPrinterDriverW(hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDriverW", PRINTER_HANDLE, hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetPrinterDriverDirectory function retrieves the path of the printer-driver directory.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the printer driver resides. If this parameter is **NULL**, the local driver-directory path is retrieved.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The structure level. This value must be 1.
 * @param {Integer} pDriverDirectory A pointer to a buffer that receives the path.
 * @param {Integer} cbBuf The size of the buffer to which *pDriverDirectory* points.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverdirectory
 */
export GetPrinterDriverDirectoryA(pName, pEnvironment, Level, pDriverDirectory, cbBuf, pcbNeeded) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDriverDirectoryA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverDirectory, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetPrinterDriverDirectory function retrieves the path of the printer-driver directory.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the printer driver resides. If this parameter is **NULL**, the local driver-directory path is retrieved.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The structure level. This value must be 1.
 * @param {Integer} pDriverDirectory A pointer to a buffer that receives the path.
 * @param {Integer} cbBuf The size of the buffer to which *pDriverDirectory* points.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverdirectory
 */
export GetPrinterDriverDirectoryW(pName, pEnvironment, Level, pDriverDirectory, cbBuf, pcbNeeded) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDriverDirectoryW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pDriverDirectory, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The DeletePrinterDriver function removes the specified printer-driver name from the list of names of supported drivers on a server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * The **DeletePrinterDriver** function does not delete the associated files, it merely removes the driver name from the list returned by the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
 * 
 * Before calling **DeletePrinterDriver**, you must delete all printer objects that use the printer driver.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the printer-driver name will be removed locally.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client machine (not of the destination application and print server).
 * @param {PSTR} pDriverName A pointer to a null-terminated string specifying the name of the driver that should be deleted.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriver
 */
export DeletePrinterDriverA(pName, pEnvironment, pDriverName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

    result := DllCall("winspool.drv\DeletePrinterDriverA", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, BOOL)
    return result
}

/**
 * The DeletePrinterDriver function removes the specified printer-driver name from the list of names of supported drivers on a server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * The **DeletePrinterDriver** function does not delete the associated files, it merely removes the driver name from the list returned by the [**EnumPrinterDrivers**](enumprinterdrivers.md) function.
 * 
 * Before calling **DeletePrinterDriver**, you must delete all printer objects that use the printer driver.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the printer-driver name will be removed locally.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client machine (not of the destination application and print server).
 * @param {PWSTR} pDriverName A pointer to a null-terminated string specifying the name of the driver that should be deleted.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriver
 */
export DeletePrinterDriverW(pName, pEnvironment, pDriverName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

    result := DllCall("winspool.drv\DeletePrinterDriverW", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, BOOL)
    return result
}

/**
 * The DeletePrinterDriverEx function removes the specified printer-driver name from the list of names of supported drivers on a server and deletes the files associated with the driver. This function can also delete specific versions of the driver.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * Before the function deletes the driver files, it calls the driver's **DrvDriverEvent** function, allowing the driver to remove any private files that are not used. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK).
 * 
 * If the driver files are currently loaded, the function moves them to a temp directory and marks them for deletion on restart.
 * 
 * Before calling **DeletePrinterDriverEx**, you must delete all printer objects that use the printer driver.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the function deletes the printer-driver from the local computer.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client computer (not of the destination application and print server).
 * @param {PSTR} pDriverName A pointer to a null-terminated string specifying the name of the driver to delete.
 * @param {Integer} dwDeleteFlag The options for deleting files and versions of the driver. This parameter can be one or more of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                     | Meaning                                                                                                                                                                               |
 * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="DPD_DELETE_SPECIFIC_VERSION"></span><span id="dpd_delete_specific_version"></span><dl> <dt>**DPD\_DELETE\_SPECIFIC\_VERSION**</dt> </dl> | Deletes the version specified in *dwVersionFlag*. This does not ensure that the driver will be removed from the list of supported drivers for the server.<br/>                  |
 * | <span id="DPD_DELETE_UNUSED_FILES"></span><span id="dpd_delete_unused_files"></span><dl> <dt>**DPD\_DELETE\_UNUSED\_FILES**</dt> </dl>             | Removes any unused driver files.<br/>                                                                                                                                           |
 * | <span id="DPD_DELETE_ALL_FILES"></span><span id="dpd_delete_all_files"></span><dl> <dt>**DPD\_DELETE\_ALL\_FILES**</dt> </dl>                      | Deletes the driver only if all its associated files can be removed. The delete operation fails if any of the driver's files are being used by some other installed driver.<br/> |
 * 
 * 
 * 
 *  
 * 
 * If DPD\_DELETE\_SPECIFIC\_VERSION is not specified, the function deletes all versions of the driver if none of them is in use. If neither DPD\_DELETE\_UNUSED\_FILES nor DPD\_DELETE\_ALL\_FILES is specified, the function does not delete driver files.
 * @param {Integer} dwVersionFlag The version of the driver to be deleted. This parameter can be 0, 1, 2 or 3. This parameter is used only if *dwDeleteFlag* includes the DPD\_DELETE\_SPECIFIC\_VERSION flag.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverex
 */
export DeletePrinterDriverExA(pName, pEnvironment, pDriverName, dwDeleteFlag, dwVersionFlag) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

    result := DllCall("winspool.drv\DeletePrinterDriverExA", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "uint", dwDeleteFlag, "uint", dwVersionFlag, BOOL)
    return result
}

/**
 * The DeletePrinterDriverEx function removes the specified printer-driver name from the list of names of supported drivers on a server and deletes the files associated with the driver. This function can also delete specific versions of the driver.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * Before the function deletes the driver files, it calls the driver's **DrvDriverEvent** function, allowing the driver to remove any private files that are not used. For more information about **DrvDriverEvent**, see the Microsoft Windows Driver Development Kit (DDK).
 * 
 * If the driver files are currently loaded, the function moves them to a temp directory and marks them for deletion on restart.
 * 
 * Before calling **DeletePrinterDriverEx**, you must delete all printer objects that use the printer driver.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the driver is to be deleted. If this parameter is **NULL**, the function deletes the printer-driver from the local computer.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the driver is to be deleted (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the driver name is deleted from the current environment of the calling application and client computer (not of the destination application and print server).
 * @param {PWSTR} pDriverName A pointer to a null-terminated string specifying the name of the driver to delete.
 * @param {Integer} dwDeleteFlag The options for deleting files and versions of the driver. This parameter can be one or more of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                     | Meaning                                                                                                                                                                               |
 * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="DPD_DELETE_SPECIFIC_VERSION"></span><span id="dpd_delete_specific_version"></span><dl> <dt>**DPD\_DELETE\_SPECIFIC\_VERSION**</dt> </dl> | Deletes the version specified in *dwVersionFlag*. This does not ensure that the driver will be removed from the list of supported drivers for the server.<br/>                  |
 * | <span id="DPD_DELETE_UNUSED_FILES"></span><span id="dpd_delete_unused_files"></span><dl> <dt>**DPD\_DELETE\_UNUSED\_FILES**</dt> </dl>             | Removes any unused driver files.<br/>                                                                                                                                           |
 * | <span id="DPD_DELETE_ALL_FILES"></span><span id="dpd_delete_all_files"></span><dl> <dt>**DPD\_DELETE\_ALL\_FILES**</dt> </dl>                      | Deletes the driver only if all its associated files can be removed. The delete operation fails if any of the driver's files are being used by some other installed driver.<br/> |
 * 
 * 
 * 
 *  
 * 
 * If DPD\_DELETE\_SPECIFIC\_VERSION is not specified, the function deletes all versions of the driver if none of them is in use. If neither DPD\_DELETE\_UNUSED\_FILES nor DPD\_DELETE\_ALL\_FILES is specified, the function does not delete driver files.
 * @param {Integer} dwVersionFlag The version of the driver to be deleted. This parameter can be 0, 1, 2 or 3. This parameter is used only if *dwDeleteFlag* includes the DPD\_DELETE\_SPECIFIC\_VERSION flag.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverex
 */
export DeletePrinterDriverExW(pName, pEnvironment, pDriverName, dwDeleteFlag, dwVersionFlag) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pDriverName := pDriverName is String ? StrPtr(pDriverName) : pDriverName

    result := DllCall("winspool.drv\DeletePrinterDriverExW", "ptr", pName, "ptr", pEnvironment, "ptr", pDriverName, "uint", dwDeleteFlag, "uint", dwVersionFlag, BOOL)
    return result
}

/**
 * The AddPrintProcessor function installs a print processor on the specified server and adds the print-processor name to the list of supported print processors.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before calling the **AddPrintProcessor** function, an application should verify that the file containing the print processor is stored in the system print-processor directory. An application can retrieve the name of the system print-processor directory by calling the [**GetPrintProcessorDirectory**](getprintprocessordirectory.md) function.
 * 
 * An application can determine the name of existing print processors by calling the [**EnumPrintProcessors**](enumprintprocessors.md) function.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor should be installed. If this parameter is **NULL**, the print processor is installed locally.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
 * @param {PSTR} pPathName A pointer to a null-terminated string that specifies the name of the file that contains the print processor. This file must be in the system print-processor directory.
 * @param {PSTR} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprocessor
 */
export AddPrintProcessorA(pName, pEnvironment, pPathName, pPrintProcessorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pPathName := pPathName is String ? StrPtr(pPathName) : pPathName
    pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

    result := DllCall("winspool.drv\AddPrintProcessorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPathName, "ptr", pPrintProcessorName, BOOL)
    return result
}

/**
 * The AddPrintProcessor function installs a print processor on the specified server and adds the print-processor name to the list of supported print processors.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before calling the **AddPrintProcessor** function, an application should verify that the file containing the print processor is stored in the system print-processor directory. An application can retrieve the name of the system print-processor directory by calling the [**GetPrintProcessorDirectory**](getprintprocessordirectory.md) function.
 * 
 * An application can determine the name of existing print processors by calling the [**EnumPrintProcessors**](enumprintprocessors.md) function.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor should be installed. If this parameter is **NULL**, the print processor is installed locally.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the caller/client (not of the destination/server) is used.
 * @param {PWSTR} pPathName A pointer to a null-terminated string that specifies the name of the file that contains the print processor. This file must be in the system print-processor directory.
 * @param {PWSTR} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprocessor
 */
export AddPrintProcessorW(pName, pEnvironment, pPathName, pPrintProcessorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pPathName := pPathName is String ? StrPtr(pPathName) : pPathName
    pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

    result := DllCall("winspool.drv\AddPrintProcessorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPathName, "ptr", pPrintProcessorName, BOOL)
    return result
}

/**
 * The EnumPrintProcessors function enumerates the print processors installed on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the print processors reside. If this parameter is **NULL**, the local print processors are enumerated.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The type of information returned in the *pPrintProcessorInfo* buffer. This parameter must be 1.
 * @param {Integer} pPrintProcessorInfo A pointer to a buffer that receives an array of [**PRINTPROCESSOR\_INFO\_1**](printprocessor-info-1.md) structures. Each structure describes an available print processor. The buffer must be large enough to receive the array of structures and any strings to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumPrintProcessors** with *cbBuf* set to zero. **EnumPrintProcessors** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrintProcessorInfo*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPrintProcessorInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures returned in the *pPrintProcessorInfo* buffer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessors
 */
export EnumPrintProcessorsA(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrintProcessorsA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The EnumPrintProcessors function enumerates the print processors installed on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the print processors reside. If this parameter is **NULL**, the local print processors are enumerated.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The type of information returned in the *pPrintProcessorInfo* buffer. This parameter must be 1.
 * @param {Integer} pPrintProcessorInfo A pointer to a buffer that receives an array of [**PRINTPROCESSOR\_INFO\_1**](printprocessor-info-1.md) structures. Each structure describes an available print processor. The buffer must be large enough to receive the array of structures and any strings to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumPrintProcessors** with *cbBuf* set to zero. **EnumPrintProcessors** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPrintProcessorInfo*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPrintProcessorInfo* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures returned in the *pPrintProcessorInfo* buffer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessors
 */
export EnumPrintProcessorsW(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrintProcessorsW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The GetPrintProcessorDirectory function retrieves the path to the print processor directory on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server. If this parameter is **NULL**, a local path is returned.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The structure level. This value must be 1.
 * @param {Integer} pPrintProcessorInfo A pointer to a buffer that receives the path. Note that, for operating systems prior to Windows Server 2003 SP 1, the path is in the local format for the server, not the true remote format. For example, the path is given as "%Windir%\\System32\\Spool\\Prtprocs\\%Environment%" instead of "\\\\ServerName\\Print$\\Prtprocs\\%Environment%", even when called for a remote server. For the operating systems Windows Server 2003 SP 1 and later, the true remote path is returned.
 * @param {Integer} cbBuf The size of the buffer pointed to by *pPrintProcessorInfo*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprintprocessordirectory
 */
export GetPrintProcessorDirectoryA(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrintProcessorDirectoryA", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetPrintProcessorDirectory function retrieves the path to the print processor directory on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server. If this parameter is **NULL**, a local path is returned.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The structure level. This value must be 1.
 * @param {Integer} pPrintProcessorInfo A pointer to a buffer that receives the path. Note that, for operating systems prior to Windows Server 2003 SP 1, the path is in the local format for the server, not the true remote format. For example, the path is given as "%Windir%\\System32\\Spool\\Prtprocs\\%Environment%" instead of "\\\\ServerName\\Print$\\Prtprocs\\%Environment%", even when called for a remote server. For the operating systems Windows Server 2003 SP 1 and later, the true remote path is returned.
 * @param {Integer} cbBuf The size of the buffer pointed to by *pPrintProcessorInfo*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds, or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprintprocessordirectory
 */
export GetPrintProcessorDirectoryW(pName, pEnvironment, Level, pPrintProcessorInfo, cbBuf, pcbNeeded) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrintProcessorDirectoryW", "ptr", pName, "ptr", pEnvironment, "uint", Level, "ptr", pPrintProcessorInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The EnumPrintProcessorDatatypes function enumerates the data types that a specified print processor supports.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * v
 * 
 * Starting with Windows Vista, the data type information from remote print servers is retrieved from a local cache.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor resides. If this parameter is **NULL**, the data types for the local print processor are enumerated.
 * @param {PSTR} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor whose data types are enumerated.
 * @param {Integer} Level The type of information returned in the *pDatatypes* buffer. This parameter must be 1.
 * @param {Integer} pDatatypes A pointer to a buffer that receives an array of [**DATATYPES\_INFO\_1**](datatypes-info-1.md) structures. Each structure describes an available data type. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumPrintProcessorDatatypes** with *cbBuf* set to zero. **EnumPrintProcessorDatatypes** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDatatypes*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDatatypes* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDatatypes* buffer. This is the number of supported data types.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessordatatypes
 */
export EnumPrintProcessorDatatypesA(pName, pPrintProcessorName, Level, pDatatypes, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName
    pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrintProcessorDatatypesA", "ptr", pName, "ptr", pPrintProcessorName, "uint", Level, "ptr", pDatatypes, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The EnumPrintProcessorDatatypes function enumerates the data types that a specified print processor supports.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * v
 * 
 * Starting with Windows Vista, the data type information from remote print servers is retrieved from a local cache.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the print processor resides. If this parameter is **NULL**, the data types for the local print processor are enumerated.
 * @param {PWSTR} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the print processor whose data types are enumerated.
 * @param {Integer} Level The type of information returned in the *pDatatypes* buffer. This parameter must be 1.
 * @param {Integer} pDatatypes A pointer to a buffer that receives an array of [**DATATYPES\_INFO\_1**](datatypes-info-1.md) structures. Each structure describes an available data type. The buffer must be large enough to receive the array of structures and any strings or other data to which the structure members point.
 * 
 * To determine the required buffer size, call **EnumPrintProcessorDatatypes** with *cbBuf* set to zero. **EnumPrintProcessorDatatypes** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_INSUFFICIENT\_BUFFER, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pDatatypes*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pDatatypes* buffer if the function succeeds. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures returned in the *pDatatypes* buffer. This is the number of supported data types.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprintprocessordatatypes
 */
export EnumPrintProcessorDatatypesW(pName, pPrintProcessorName, Level, pDatatypes, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName
    pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrintProcessorDatatypesW", "ptr", pName, "ptr", pPrintProcessorName, "uint", Level, "ptr", pDatatypes, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The DeletePrintProcessor function removes a print processor added by the AddPrintProcessor function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the processor is to be removed. If this parameter is **NULL**, the printer processor is removed locally.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the processor is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the processor is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value, as it provides maximum portability.
 * @param {PSTR} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the processor to be removed.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprocessor
 */
export DeletePrintProcessorA(pName, pEnvironment, pPrintProcessorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

    result := DllCall("winspool.drv\DeletePrintProcessorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProcessorName, BOOL)
    return result
}

/**
 * The DeletePrintProcessor function removes a print processor added by the AddPrintProcessor function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the processor is to be removed. If this parameter is **NULL**, the printer processor is removed locally.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the processor is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the processor is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value, as it provides maximum portability.
 * @param {PWSTR} pPrintProcessorName A pointer to a null-terminated string that specifies the name of the processor to be removed.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprocessor
 */
export DeletePrintProcessorW(pName, pEnvironment, pPrintProcessorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pPrintProcessorName := pPrintProcessorName is String ? StrPtr(pPrintProcessorName) : pPrintProcessorName

    result := DllCall("winspool.drv\DeletePrintProcessorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProcessorName, BOOL)
    return result
}

/**
 * The StartDocPrinter function notifies the print spooler that a document is to be spooled for printing.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The typical sequence for a print job is as follows:
 * 
 * 1.  To begin a print job, call **StartDocPrinter**.
 * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
 * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
 * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
 * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
 * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
 * 
 * Note that calling [**StartPagePrinter**](startpageprinter.md) and [**EndPagePrinter**](endpageprinter.md) may not be necessary, such as if the print data type includes the page information.
 * 
 * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The version of the structure to which *pDocInfo* points. This value must be 1.
 * @param {Pointer<DOC_INFO_1A>} pDocInfo A pointer to a [**DOC\_INFO\_1**](doc-info-1.md) structure that describes the document to print.
 * @returns {Integer} If the function succeeds, the return value identifies the print job.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/startdocprinter
 */
export StartDocPrinterA(hPrinter, Level, pDocInfo) {
    result := DllCall("winspool.drv\StartDocPrinterA", PRINTER_HANDLE, hPrinter, "uint", Level, DOC_INFO_1A.Ptr, pDocInfo, UInt32)
    return result
}

/**
 * The StartDocPrinter function notifies the print spooler that a document is to be spooled for printing.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The typical sequence for a print job is as follows:
 * 
 * 1.  To begin a print job, call **StartDocPrinter**.
 * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
 * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
 * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
 * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
 * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
 * 
 * Note that calling [**StartPagePrinter**](startpageprinter.md) and [**EndPagePrinter**](endpageprinter.md) may not be necessary, such as if the print data type includes the page information.
 * 
 * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The version of the structure to which *pDocInfo* points. This value must be 1.
 * @param {Pointer<DOC_INFO_1W>} pDocInfo A pointer to a [**DOC\_INFO\_1**](doc-info-1.md) structure that describes the document to print.
 * @returns {Integer} If the function succeeds, the return value identifies the print job.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/startdocprinter
 */
export StartDocPrinterW(hPrinter, Level, pDocInfo) {
    result := DllCall("winspool.drv\StartDocPrinterW", PRINTER_HANDLE, hPrinter, "uint", Level, DOC_INFO_1W.Ptr, pDocInfo, UInt32)
    return result
}

/**
 * The StartPagePrinter function notifies the spooler that a page is about to be printed on the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The sequence for a print job is as follows:
 * 
 * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
 * 2.  To begin each page, call **StartPagePrinter**.
 * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
 * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
 * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
 * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
 * 
 * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
 * @param {PRINTER_HANDLE} hPrinter Handle to a printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/startpageprinter
 */
export StartPagePrinter(hPrinter) {
    result := DllCall("winspool.drv\StartPagePrinter", PRINTER_HANDLE, hPrinter, BOOL)
    return result
}

/**
 * The WritePrinter function notifies the print spooler that data should be written to the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The sequence for a print job is as follows:
 * 
 * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
 * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
 * 3.  To write data to a page, call **WritePrinter**.
 * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
 * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
 * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
 * 
 * When a high-level document (such as an Adobe PDF or Microsoft Word file) or other printer data (such PCL, PS, or HPGL) is sent directly to a printer, the print settings defined in the document take precedent over Windows print settings. Documents output when the value of the *pDatatype* member of the [**DOC\_INFO\_1**](doc-info-1.md) structure that was passed in the *pDocInfo* parameter of the [**StartDocPrinter**](startdocprinter.md) call is "RAW" must fully describe the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea)-style print job settings in the language understood by the hardware.
 * 
 * In versions of Windows prior to Windows XP, when a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit in versions of Windows prior to Windows XP depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap. In Windows XP and later versions of Windows, EMF files must be 2GB or less in size. If **WritePrinter** is used to write non EMF data, such as printer-ready PDL, the size of the file is limited only by the available disk space.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} pBuf A pointer to an array of bytes that contains the data that should be written to the printer.
 * @param {Integer} cbBuf The size, in bytes, of the array.
 * @param {Pointer<Integer>} pcWritten A pointer to a value that receives the number of bytes of data that were written to the printer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/writeprinter
 */
export WritePrinter(hPrinter, pBuf, cbBuf, pcWritten) {
    pcWrittenMarshal := pcWritten is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\WritePrinter", PRINTER_HANDLE, hPrinter, "ptr", pBuf, "uint", cbBuf, pcWrittenMarshal, pcWritten, BOOL)
    return result
}

/**
 * The FlushPrinter function sends a buffer to the printer in order to clear it from a transient state.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **FlushPrinter** should be called only if [**WritePrinter**](writeprinter.md) failed, leaving the printer in a transient state. For example, the printer could get into a transient state when the job gets aborted and the printer driver has partially sent some raw data to the printer.
 * 
 * **FlushPrinter** also can specify an idle period during which the print spooler does not schedule any jobs to the corresponding printer port.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer object. This should be the same handle that was used, in a prior [**WritePrinter**](writeprinter.md) call, by the printer driver.
 * @param {Integer} pBuf A pointer to an array of bytes that contains the data to be written to the printer.
 * @param {Integer} cbBuf The size, in bytes, of the array pointed to by *pBuf*.
 * @param {Pointer<Integer>} pcWritten A pointer to a value that receives the number of bytes of data that were written to the printer.
 * @param {Integer} cSleep The time, in milliseconds, for which the I/O line to the printer port should be kept idle.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/flushprinter
 */
export FlushPrinter(hPrinter, pBuf, cbBuf, pcWritten, cSleep) {
    pcWrittenMarshal := pcWritten is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\FlushPrinter", PRINTER_HANDLE, hPrinter, "ptr", pBuf, "uint", cbBuf, pcWrittenMarshal, pcWritten, "uint", cSleep, BOOL)
    return result
}

/**
 * The EndPagePrinter function notifies the print spooler that the application is at the end of a page in a print job.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The sequence for a print job is as follows:
 * 
 * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
 * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
 * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
 * 4.  To end each page, call **EndPagePrinter**.
 * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
 * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
 * 
 * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
 * @param {PRINTER_HANDLE} hPrinter Handle to the printer for which the page will be concluded. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/endpageprinter
 */
export EndPagePrinter(hPrinter) {
    result := DllCall("winspool.drv\EndPagePrinter", PRINTER_HANDLE, hPrinter, BOOL)
    return result
}

/**
 * The AbortPrinter function deletes a printers spool file if the printer is configured for spooling.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If the printer is not configured for spooling, the **AbortPrinter** function has no effect.
 * 
 * The sequence for a print job is as follows:
 * 
 * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
 * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
 * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
 * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
 * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
 * 6.  To end the print job, call [**EndDocPrinter**](enddocprinter.md).
 * 
 * When a page in a spooled file exceeds approximately 350 MB, it can fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
 * @param {PRINTER_HANDLE} hPrinter Handle to the printer from which the spool file is deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/abortprinter
 */
export AbortPrinter(hPrinter) {
    result := DllCall("winspool.drv\AbortPrinter", PRINTER_HANDLE, hPrinter, BOOL)
    return result
}

/**
 * The ReadPrinter function retrieves data from the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **ReadPrinter** returns an error if the device or the printer is not bidirectional.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer object for which to retrieve data. Use the [**OpenPrinter**](openprinter.md) function to retrieve a printer object handle. Use the format: Printername, Job xxxx.
 * @param {Integer} pBuf A pointer to a buffer that receives the printer data.
 * @param {Integer} cbBuf The size, in bytes, of the buffer to which *pBuf* points.
 * @param {Pointer<Integer>} pNoBytesRead A pointer to a variable that receives the number of bytes of data copied into the array to which *pBuf* points.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/readprinter
 */
export ReadPrinter(hPrinter, pBuf, cbBuf, pNoBytesRead) {
    pNoBytesReadMarshal := pNoBytesRead is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\ReadPrinter", PRINTER_HANDLE, hPrinter, "ptr", pBuf, "uint", cbBuf, pNoBytesReadMarshal, pNoBytesRead, BOOL)
    return result
}

/**
 * The EndDocPrinter function ends a print job for the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **EndDocPrinter** function returns an error if the print job was not started by calling the [**StartDocPrinter**](startdocprinter.md) function.
 * 
 * The sequence for a print job is as follows:
 * 
 * 1.  To begin a print job, call [**StartDocPrinter**](startdocprinter.md).
 * 2.  To begin each page, call [**StartPagePrinter**](startpageprinter.md).
 * 3.  To write data to a page, call [**WritePrinter**](writeprinter.md).
 * 4.  To end each page, call [**EndPagePrinter**](endpageprinter.md).
 * 5.  Repeat 2, 3, and 4 for as many pages as necessary.
 * 6.  To end the print job, call **EndDocPrinter**.
 * 
 * When a page in a spooled file exceeds approximately 350 MB, it may fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
 * @param {PRINTER_HANDLE} hPrinter Handle to a printer for which the print job should be ended. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enddocprinter
 */
export EndDocPrinter(hPrinter) {
    result := DllCall("winspool.drv\EndDocPrinter", PRINTER_HANDLE, hPrinter, BOOL)
    return result
}

/**
 * The AddJob function adds a print job to the list of print jobs that can be scheduled by the print spooler. The function retrieves the name of the file you can use to store the job.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * You can call the [**CreateFile**](/windows/desktop/api/fileapi/nf-fileapi-createfilea) function to open the spool file specified by the **Path** member of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure, and then call the [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile) function to write print job data to it. After that is done, call the [**ScheduleJob**](schedulejob.md) function to notify the print spooler that the print job can now be scheduled by the spooler for printing.
 * @param {PRINTER_HANDLE} hPrinter A handle that specifies the printer for the print job. This must be a local printer that is configured as a spooled printer. If *hPrinter* is a handle to a remote printer connection, or if the printer is configured for direct printing, the **AddJob** function fails. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The version of the print job information data structure that the function stores into the buffer pointed to by *pData*. Set this parameter to one.
 * @param {Integer} pData A pointer to a buffer that receives an [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure and a path string.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pData*. The buffer needs to be large enough to contain an [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure and a path string.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the total size, in bytes, of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure plus the path string. If this value is less than or equal to *cbBuf* and the function succeeds, this is the actual number of bytes written to the buffer pointed to by *pData*. If this number is greater than *cbBuf*, the buffer is too small, and you must call the function again with a buffer size at least as large as \**pcbNeeded*.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addjob
 */
export AddJobA(hPrinter, Level, pData, cbBuf, pcbNeeded) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\AddJobA", PRINTER_HANDLE, hPrinter, "uint", Level, "ptr", pData, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The AddJob function adds a print job to the list of print jobs that can be scheduled by the print spooler. The function retrieves the name of the file you can use to store the job.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * You can call the [**CreateFile**](/windows/desktop/api/fileapi/nf-fileapi-createfilea) function to open the spool file specified by the **Path** member of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure, and then call the [**WriteFile**](/windows/desktop/api/fileapi/nf-fileapi-writefile) function to write print job data to it. After that is done, call the [**ScheduleJob**](schedulejob.md) function to notify the print spooler that the print job can now be scheduled by the spooler for printing.
 * @param {PRINTER_HANDLE} hPrinter A handle that specifies the printer for the print job. This must be a local printer that is configured as a spooled printer. If *hPrinter* is a handle to a remote printer connection, or if the printer is configured for direct printing, the **AddJob** function fails. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level The version of the print job information data structure that the function stores into the buffer pointed to by *pData*. Set this parameter to one.
 * @param {Integer} pData A pointer to a buffer that receives an [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure and a path string.
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pData*. The buffer needs to be large enough to contain an [**ADDJOB\_INFO\_1**](addjob-info-1.md) structure and a path string.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the total size, in bytes, of the [**ADDJOB\_INFO\_1**](addjob-info-1.md) data structure plus the path string. If this value is less than or equal to *cbBuf* and the function succeeds, this is the actual number of bytes written to the buffer pointed to by *pData*. If this number is greater than *cbBuf*, the buffer is too small, and you must call the function again with a buffer size at least as large as \**pcbNeeded*.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addjob
 */
export AddJobW(hPrinter, Level, pData, cbBuf, pcbNeeded) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\AddJobW", PRINTER_HANDLE, hPrinter, "uint", Level, "ptr", pData, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The ScheduleJob function requests that the print spooler schedule a specified print job for printing.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * You must successfully call the [**AddJob**](addjob.md) function before calling the **ScheduleJob** function. **AddJob** obtains the print job identifier that you pass to **ScheduleJob** as *dwJobID*. Both calls must use the same value for *hPrinter*.
 * 
 * The **ScheduleJob** function checks for a valid spool file. If there is an invalid spool file, or if it is empty, **ScheduleJob** deletes both the spool file and the corresponding print job entry in the print spooler.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for the print job. This must be a local printer that is configured as a spooled printer. If *hPrinter* is a handle to a remote printer connection, or if the printer is configured for direct printing, the **ScheduleJob** function fails. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} JobId 
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/schedulejob
 */
export ScheduleJob(hPrinter, JobId) {
    result := DllCall("winspool.drv\ScheduleJob", PRINTER_HANDLE, hPrinter, "uint", JobId, BOOL)
    return result
}

/**
 * The PrinterProperties function displays a printer-properties property sheet for the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {HWND} _hWnd A handle to the parent window of the property sheet.
 * @param {PRINTER_HANDLE} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printerproperties
 */
export PrinterProperties(_hWnd, hPrinter) {
    result := DllCall("winspool.drv\PrinterProperties", HWND, _hWnd, PRINTER_HANDLE, hPrinter, BOOL)
    return result
}

/**
 * The DocumentProperties function retrieves or modifies printer initialization information or displays a printer-configuration property sheet for the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The string pointed to by the *pDeviceName* parameter can be obtained by calling the [**GetPrinter**](getprinter.md) function.
 * 
 * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure actually used by a printer driver contains the device-independent part (as defined above) followed by a driver-specific part that varies in size and content with each driver and driver version. Because of this driver dependence, it is very important for applications to query the driver for the correct size of the **DEVMODE** structure before allocating a buffer for it.
 * 
 * **To make changes to print settings that are local to an application, an application should follow these steps:**
 * 
 * 1.  Get the number of bytes required for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure by calling **DocumentProperties** and specifying zero in the *fMode* parameter.
 * 2.  Allocate memory for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure.
 * 3.  Get the current printer settings by calling **DocumentProperties**. Pass a pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure allocated in Step 2 as the *pDevModeOutput* parameter and specify the **DM\_OUT\_BUFFER** value.
 * 4.  Modify the appropriate members of the returned [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure and indicate which members were changed by setting the corresponding bits in the **dmFields** member of the **DEVMODE**.
 * 5.  Call **DocumentProperties** and pass the modified [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure back as both the *pDevModeInput* and *pDevModeOutput* parameters and specify both the **DM\_IN\_BUFFER** and **DM\_OUT\_BUFFER** values (which are combined using the OR operator).The **DEVMODE** structure returned by the third call to **DocumentProperties** can be used as an argument in a call to the [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) function.
 * 
 * To create a handle to a printer-device context using the current printer settings, you only need to call **DocumentProperties** twice, as described above. The first call gets the size of the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) and the second call initializes the **DEVMODE** with the current printer settings. Pass the initialized **DEVMODE** to [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) to obtain the handle to the printer device context.
 * @param {HWND} _hWnd A handle to the parent window of the printer-configuration property sheet.
 * @param {PRINTER_HANDLE} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pDeviceName A pointer to a null-terminated string that specifies the name of the device for which the printer-configuration property sheet is displayed.
 * @param {Pointer<DEVMODEA>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that receives the printer configuration data specified by the user.
 * @param {Pointer<DEVMODEA>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that the operating system uses to initialize the property sheet controls.
 * 
 * This parameter is only used if the **DM\_IN\_BUFFER** flag is set in the *fMode* parameter. If **DM\_IN\_BUFFER** is not set, the operating system uses the printer's default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea).
 * @param {Integer} fMode The operations the function performs. If this parameter is zero, the **DocumentProperties** function returns the number of bytes required by the printer driver's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure. Otherwise, use one or more of the following constants to construct a value for this parameter; note, however, that in order to change the print settings, an application must specify at least one input value and one output value.
 * 
 * 
 * 
 * | Value                                                                                                                                                          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
 * |----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="DM_IN_BUFFER"></span><span id="dm_in_buffer"></span><dl> <dt>**DM\_IN\_BUFFER**</dt> </dl>    | Input value. Before prompting, copying, or updating, the function merges the printer driver's current print settings with the settings in the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure specified by the *pDevModeInput* parameter. The function updates the structure only for those members specified by the **DEVMODE** structure's **dmFields** member. This value is also defined as **DM\_MODIFY**. In cases of conflict during the merge, the settings in the **DEVMODE** structure specified by *pDevModeInput* override the printer driver's current print settings.<br/> |
 * | <span id="DM_IN_PROMPT"></span><span id="dm_in_prompt"></span><dl> <dt>**DM\_IN\_PROMPT**</dt> </dl>    | Input value. The function presents the printer driver's Print Setup property sheet and then changes the settings in the printer's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure to those values specified by the user. This value is also defined as **DM\_PROMPT**.<br/>                                                                                                                                                                                                                                                                                                         |
 * | <span id="DM_OUT_BUFFER"></span><span id="dm_out_buffer"></span><dl> <dt>**DM\_OUT\_BUFFER**</dt> </dl> | Output value. The function writes the printer driver's current print settings, including private data, to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure specified by the *pDevModeOutput* parameter. The caller must allocate a buffer sufficiently large to contain the information. If the bit **DM\_OUT\_BUFFER** sets is clear, the *pDevModeOutput* parameter can be **NULL**. This value is also defined as **DM\_COPY**.<br/>                                                                                                                                          |
 * @returns {Integer} If the *fMode* parameter is zero, the return value is the size of the buffer required to contain the printer driver initialization data. Note that this buffer can be larger than a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure if the printer driver appends private data to the structure.
 * 
 * If the function displays the property sheet, the return value is either **IDOK** or **IDCANCEL**, depending on which button the user selects.
 * 
 * If the function does not display the property sheet and is successful, the return value is **IDOK**.
 * 
 * If the function fails, the return value is less than zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/documentproperties
 */
export DocumentPropertiesA(_hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode) {
    pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

    result := DllCall("winspool.drv\DocumentPropertiesA", HWND, _hWnd, PRINTER_HANDLE, hPrinter, "ptr", pDeviceName, DEVMODEA.Ptr, pDevModeOutput, DEVMODEA.Ptr, pDevModeInput, "uint", fMode, Int32)
    return result
}

/**
 * The DocumentProperties function retrieves or modifies printer initialization information or displays a printer-configuration property sheet for the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The string pointed to by the *pDeviceName* parameter can be obtained by calling the [**GetPrinter**](getprinter.md) function.
 * 
 * The [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure actually used by a printer driver contains the device-independent part (as defined above) followed by a driver-specific part that varies in size and content with each driver and driver version. Because of this driver dependence, it is very important for applications to query the driver for the correct size of the **DEVMODE** structure before allocating a buffer for it.
 * 
 * **To make changes to print settings that are local to an application, an application should follow these steps:**
 * 
 * 1.  Get the number of bytes required for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure by calling **DocumentProperties** and specifying zero in the *fMode* parameter.
 * 2.  Allocate memory for the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure.
 * 3.  Get the current printer settings by calling **DocumentProperties**. Pass a pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure allocated in Step 2 as the *pDevModeOutput* parameter and specify the **DM\_OUT\_BUFFER** value.
 * 4.  Modify the appropriate members of the returned [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure and indicate which members were changed by setting the corresponding bits in the **dmFields** member of the **DEVMODE**.
 * 5.  Call **DocumentProperties** and pass the modified [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure back as both the *pDevModeInput* and *pDevModeOutput* parameters and specify both the **DM\_IN\_BUFFER** and **DM\_OUT\_BUFFER** values (which are combined using the OR operator).The **DEVMODE** structure returned by the third call to **DocumentProperties** can be used as an argument in a call to the [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) function.
 * 
 * To create a handle to a printer-device context using the current printer settings, you only need to call **DocumentProperties** twice, as described above. The first call gets the size of the full [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) and the second call initializes the **DEVMODE** with the current printer settings. Pass the initialized **DEVMODE** to [**CreateDC**](/windows/desktop/api/wingdi/nf-wingdi-createdca) to obtain the handle to the printer device context.
 * @param {HWND} _hWnd A handle to the parent window of the printer-configuration property sheet.
 * @param {PRINTER_HANDLE} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pDeviceName A pointer to a null-terminated string that specifies the name of the device for which the printer-configuration property sheet is displayed.
 * @param {Pointer<DEVMODEW>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that receives the printer configuration data specified by the user.
 * @param {Pointer<DEVMODEW>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that the operating system uses to initialize the property sheet controls.
 * 
 * This parameter is only used if the **DM\_IN\_BUFFER** flag is set in the *fMode* parameter. If **DM\_IN\_BUFFER** is not set, the operating system uses the printer's default [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea).
 * @param {Integer} fMode The operations the function performs. If this parameter is zero, the **DocumentProperties** function returns the number of bytes required by the printer driver's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure. Otherwise, use one or more of the following constants to construct a value for this parameter; note, however, that in order to change the print settings, an application must specify at least one input value and one output value.
 * 
 * 
 * 
 * | Value                                                                                                                                                          | Meaning                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
 * |----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="DM_IN_BUFFER"></span><span id="dm_in_buffer"></span><dl> <dt>**DM\_IN\_BUFFER**</dt> </dl>    | Input value. Before prompting, copying, or updating, the function merges the printer driver's current print settings with the settings in the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure specified by the *pDevModeInput* parameter. The function updates the structure only for those members specified by the **DEVMODE** structure's **dmFields** member. This value is also defined as **DM\_MODIFY**. In cases of conflict during the merge, the settings in the **DEVMODE** structure specified by *pDevModeInput* override the printer driver's current print settings.<br/> |
 * | <span id="DM_IN_PROMPT"></span><span id="dm_in_prompt"></span><dl> <dt>**DM\_IN\_PROMPT**</dt> </dl>    | Input value. The function presents the printer driver's Print Setup property sheet and then changes the settings in the printer's [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure to those values specified by the user. This value is also defined as **DM\_PROMPT**.<br/>                                                                                                                                                                                                                                                                                                         |
 * | <span id="DM_OUT_BUFFER"></span><span id="dm_out_buffer"></span><dl> <dt>**DM\_OUT\_BUFFER**</dt> </dl> | Output value. The function writes the printer driver's current print settings, including private data, to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) data structure specified by the *pDevModeOutput* parameter. The caller must allocate a buffer sufficiently large to contain the information. If the bit **DM\_OUT\_BUFFER** sets is clear, the *pDevModeOutput* parameter can be **NULL**. This value is also defined as **DM\_COPY**.<br/>                                                                                                                                          |
 * @returns {Integer} If the *fMode* parameter is zero, the return value is the size of the buffer required to contain the printer driver initialization data. Note that this buffer can be larger than a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure if the printer driver appends private data to the structure.
 * 
 * If the function displays the property sheet, the return value is either **IDOK** or **IDCANCEL**, depending on which button the user selects.
 * 
 * If the function does not display the property sheet and is successful, the return value is **IDOK**.
 * 
 * If the function fails, the return value is less than zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/documentproperties
 */
export DocumentPropertiesW(_hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput, fMode) {
    pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

    result := DllCall("winspool.drv\DocumentPropertiesW", HWND, _hWnd, PRINTER_HANDLE, hPrinter, "ptr", pDeviceName, DEVMODEW.Ptr, pDevModeOutput, DEVMODEW.Ptr, pDevModeInput, "uint", fMode, Int32)
    return result
}

/**
 * The AdvancedDocumentProperties function displays a printer-configuration dialog box for the specified printer, allowing the user to configure that printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * This function can only display the printer-configuration dialog box so a user can configure it. For more control, use [**DocumentProperties**](documentproperties.md). The input parameters for this function are passed directly to **DocumentProperties** and the *fMode* value is set to DM\_IN\_BUFFER \| DM\_IN\_PROMPT \| DM\_OUT\_BUFFER. Unlike **DocumentProperties**, this function only returns 1 or 0. Thus, you cannot determine the required size of [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) by setting *pDevMode* to zero.
 * 
 * An application can obtain the name pointed to by the *pDeviceName* parameter by calling the [**GetPrinter**](getprinter.md) function and then examining the **pPrinterName** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
 * @param {HWND} _hWnd A handle to the parent window of the printer-configuration dialog box.
 * @param {PRINTER_HANDLE} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pDeviceName A pointer to a null-terminated string specifying the name of the device for which a printer-configuration dialog box should be displayed.
 * @param {Pointer<DEVMODEA>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that will contain the configuration data specified by the user.
 * @param {Pointer<DEVMODEA>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that contains the configuration data used to initialize the controls of the printer-configuration dialog box.
 * @returns {Integer} If the [**DocumentProperties**](documentproperties.md) function with these parameters is successful, the return value of **AdvancedDocumentProperties** is 1. Otherwise, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/advanceddocumentproperties
 */
export AdvancedDocumentPropertiesA(_hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput) {
    pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

    result := DllCall("winspool.drv\AdvancedDocumentPropertiesA", HWND, _hWnd, PRINTER_HANDLE, hPrinter, "ptr", pDeviceName, DEVMODEA.Ptr, pDevModeOutput, DEVMODEA.Ptr, pDevModeInput, Int32)
    return result
}

/**
 * The AdvancedDocumentProperties function displays a printer-configuration dialog box for the specified printer, allowing the user to configure that printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * This function can only display the printer-configuration dialog box so a user can configure it. For more control, use [**DocumentProperties**](documentproperties.md). The input parameters for this function are passed directly to **DocumentProperties** and the *fMode* value is set to DM\_IN\_BUFFER \| DM\_IN\_PROMPT \| DM\_OUT\_BUFFER. Unlike **DocumentProperties**, this function only returns 1 or 0. Thus, you cannot determine the required size of [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) by setting *pDevMode* to zero.
 * 
 * An application can obtain the name pointed to by the *pDeviceName* parameter by calling the [**GetPrinter**](getprinter.md) function and then examining the **pPrinterName** member of the [**PRINTER\_INFO\_2**](printer-info-2.md) structure.
 * @param {HWND} _hWnd A handle to the parent window of the printer-configuration dialog box.
 * @param {PRINTER_HANDLE} hPrinter A handle to a printer object. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pDeviceName A pointer to a null-terminated string specifying the name of the device for which a printer-configuration dialog box should be displayed.
 * @param {Pointer<DEVMODEW>} pDevModeOutput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that will contain the configuration data specified by the user.
 * @param {Pointer<DEVMODEW>} pDevModeInput A pointer to a [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) structure that contains the configuration data used to initialize the controls of the printer-configuration dialog box.
 * @returns {Integer} If the [**DocumentProperties**](documentproperties.md) function with these parameters is successful, the return value of **AdvancedDocumentProperties** is 1. Otherwise, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/advanceddocumentproperties
 */
export AdvancedDocumentPropertiesW(_hWnd, hPrinter, pDeviceName, pDevModeOutput, pDevModeInput) {
    pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName

    result := DllCall("winspool.drv\AdvancedDocumentPropertiesW", HWND, _hWnd, PRINTER_HANDLE, hPrinter, "ptr", pDeviceName, DEVMODEW.Ptr, pDevModeOutput, DEVMODEW.Ptr, pDevModeInput, Int32)
    return result
}

/**
 * 
 * @param {HWND} _hWnd 
 * @param {HANDLE} hInst 
 * @param {Pointer<DEVMODEA>} pDevModeOutput 
 * @param {PSTR} pDeviceName 
 * @param {PSTR} pPort 
 * @param {Pointer<DEVMODEA>} pDevModeInput 
 * @param {PSTR} pProfile 
 * @param {Integer} fMode 
 * @returns {Integer} 
 */
export ExtDeviceMode(_hWnd, hInst, pDevModeOutput, pDeviceName, pPort, pDevModeInput, pProfile, fMode) {
    pDeviceName := pDeviceName is String ? StrPtr(pDeviceName) : pDeviceName
    pPort := pPort is String ? StrPtr(pPort) : pPort
    pProfile := pProfile is String ? StrPtr(pProfile) : pProfile

    result := DllCall("winspool.drv\ExtDeviceMode", HWND, _hWnd, HANDLE, hInst, DEVMODEA.Ptr, pDevModeOutput, "ptr", pDeviceName, "ptr", pPort, DEVMODEA.Ptr, pDevModeInput, "ptr", pProfile, "uint", fMode, Int32)
    return result
}

/**
 * The GetPrinterData function retrieves configuration data for the specified printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **GetPrinterData** retrieves printer configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) or [**SetPrinterData**](setprinterdata.md) function.
 * 
 * **GetPrinterData** might trigger a Windows call to [**GetPrinterDataFromPort**](/previous-versions//ff550506(v=vs.85)), which might write to the registry. If it does, side effects can occur, such as triggering an update or upgrade printer event ID 20 in the client, if the printer is shared in a network.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
 * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
 * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
 * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
 * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
 * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The following values configure client-side rendering of a print jobs and can be read if you set the following values in *pValueName*.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
 * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
 * 
 * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Pointer<Integer>} pType A pointer to a variable that receives a value that indicates the type of data retrieved in *pData*. The function returns the type specified in the [**SetPrinterData**](setprinterdata.md) or [**SetPrinterDataEx**](setprinterdataex.md) call that stored the data. Set this parameter to **NULL** if you don't need the data type.
 * @param {Integer} pData A pointer to a buffer that receives the configuration data.
 * @param {Integer} nSize The size, in bytes, of the buffer that *pData* points to.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
 * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**. If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdata
 */
export GetPrinterDataA(hPrinter, pValueName, pType, pData, nSize, pcbNeeded) {
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDataA", PRINTER_HANDLE, hPrinter, "ptr", pValueName, pTypeMarshal, pType, "ptr", pData, "uint", nSize, pcbNeededMarshal, pcbNeeded, UInt32)
    return result
}

/**
 * The GetPrinterData function retrieves configuration data for the specified printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **GetPrinterData** retrieves printer configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) or [**SetPrinterData**](setprinterdata.md) function.
 * 
 * **GetPrinterData** might trigger a Windows call to [**GetPrinterDataFromPort**](/previous-versions//ff550506(v=vs.85)), which might write to the registry. If it does, side effects can occur, such as triggering an update or upgrade printer event ID 20 in the client, if the printer is shared in a network.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
 * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
 * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
 * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
 * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
 * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The following values configure client-side rendering of a print jobs and can be read if you set the following values in *pValueName*.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
 * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
 * 
 * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Pointer<Integer>} pType A pointer to a variable that receives a value that indicates the type of data retrieved in *pData*. The function returns the type specified in the [**SetPrinterData**](setprinterdata.md) or [**SetPrinterDataEx**](setprinterdataex.md) call that stored the data. Set this parameter to **NULL** if you don't need the data type.
 * @param {Integer} pData A pointer to a buffer that receives the configuration data.
 * @param {Integer} nSize The size, in bytes, of the buffer that *pData* points to.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
 * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**. If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdata
 */
export GetPrinterDataW(hPrinter, pValueName, pType, pData, nSize, pcbNeeded) {
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDataW", PRINTER_HANDLE, hPrinter, "ptr", pValueName, pTypeMarshal, pType, "ptr", pData, "uint", nSize, pcbNeededMarshal, pcbNeeded, UInt32)
    return result
}

/**
 * The GetPrinterDataEx function retrieves configuration data for the specified printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **GetPrinterDataEx** retrieves printer-configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
 * 
 * Calling **GetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**GetPrinterData**](getprinterdata.md) function.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
 * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
 * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
 * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
 * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
 * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * If *pKeyName* is one of the predefined Directory Service (DS) keys (see [**SetPrinter**](setprinter.md)) and *pValueName* contains a comma (','), then the portion of *pValueName* before the comma is the value name and the portion of *pValueName* to the right of the comma is the DS Property OID. A subkey called OID is created and a new value that consists of the value name and OID is entered under the OID key. [**SetPrinterDataEx**](setprinterdataex.md) also adds the value name and data under the DS key.
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The configuration of client-side rendering for a printer can be read by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
 * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the value to be retrieved. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
 * 
 * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **GetPrinterDataEx** returns **ERROR\_INVALID\_PARAMETER**.
 * 
 * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
 * @param {PSTR} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
 * 
 * For printers, this string specifies the name of a value under the *pKeyName* key.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Pointer<Integer>} pType A pointer to a variable that receives the type of data stored in the value. The function returns the type specified in the [**SetPrinterDataEx**](setprinterdataex.md) call when the data was stored. This parameter can be **NULL** if you don't need the information. **GetPrinterDataEx** passes *pType* on as the *lpdwType* parameter of a [**RegQueryValueEx**](/windows/desktop/api/winreg/nf-winreg-regqueryvalueexa) function call.
 * @param {Integer} pData A pointer to a buffer that receives the configuration data.
 * @param {Integer} nSize The size, in bytes, of the buffer pointed to by *pData*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
 * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
 * 
 * If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdataex
 */
export GetPrinterDataExA(hPrinter, pKeyName, pValueName, pType, pData, nSize, pcbNeeded) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDataExA", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pValueName, pTypeMarshal, pType, "ptr", pData, "uint", nSize, pcbNeededMarshal, pcbNeeded, UInt32)
    return result
}

/**
 * The GetPrinterDataEx function retrieves configuration data for the specified printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **GetPrinterDataEx** retrieves printer-configuration data that was set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
 * 
 * Calling **GetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**GetPrinterData**](getprinterdata.md) function.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG\_ARCHITECTURE**                                            |                                                                                                                                                                                                                                 |
 * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DNS\_MACHINE\_NAME**                                      |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DS\_PRESENT**                                             | On successful return, *pData* contains 0x0001 if the machine is on a DS domain, 0 otherwise.<br/>                                                                                                                         |
 * | **SPLREG\_DS\_PRESENT\_FOR\_USER**                                  | On successful return, *pData* contains 0x0001 if the user is logged onto a DS domain, 0 otherwise.<br/>                                                                                                                   |
 * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MAJOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_MINOR\_VERSION**                                          |                                                                                                                                                                                                                                 |
 * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG\_NET\_POPUP\_TO\_COMPUTER**                                | On successful return, *pData* contains 1 if job notifications should be sent to the client computer, or 0 if job notifications are to be sent to the user.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_OS\_VERSION**                                             | Windows XP and later<br/>                                                                                                                                                                                                 |
 * | **SPLREG\_OS\_VERSIONEX**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_REMOTE\_FAX**                                             | On successful return, *pData* contains 0x0001 if the FAX service supports remote clients, 0 otherwise.<br/>                                                                                                               |
 * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * The following values of *pValueName* indicate the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegQueryValueEx**](/windows/win32/api/winreg/nf-winreg-regqueryvalueexa) function to query these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * If *pKeyName* is one of the predefined Directory Service (DS) keys (see [**SetPrinter**](setprinter.md)) and *pValueName* contains a comma (','), then the portion of *pValueName* before the comma is the value name and the portion of *pValueName* to the right of the comma is the DS Property OID. A subkey called OID is created and a new value that consists of the value name and OID is entered under the OID key. [**SetPrinterDataEx**](setprinterdataex.md) also adds the value name and data under the DS key.
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. The configuration of client-side rendering for a printer can be read by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
 * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the value to be retrieved. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
 * 
 * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **GetPrinterDataEx** returns **ERROR\_INVALID\_PARAMETER**.
 * 
 * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
 * @param {PWSTR} pValueName A pointer to a null-terminated string that identifies the data to retrieve.
 * 
 * For printers, this string specifies the name of a value under the *pKeyName* key.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Pointer<Integer>} pType A pointer to a variable that receives the type of data stored in the value. The function returns the type specified in the [**SetPrinterDataEx**](setprinterdataex.md) call when the data was stored. This parameter can be **NULL** if you don't need the information. **GetPrinterDataEx** passes *pType* on as the *lpdwType* parameter of a [**RegQueryValueEx**](/windows/desktop/api/winreg/nf-winreg-regqueryvalueexa) function call.
 * @param {Integer} pData A pointer to a buffer that receives the configuration data.
 * @param {Integer} nSize The size, in bytes, of the buffer pointed to by *pData*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the size, in bytes, of the configuration data. If the buffer size specified by *nSize* is too small, the function returns **ERROR\_MORE\_DATA**, and *pcbNeeded* indicates the required buffer size.
 * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
 * 
 * If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdataex
 */
export GetPrinterDataExW(hPrinter, pKeyName, pValueName, pType, pData, nSize, pcbNeeded) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDataExW", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pValueName, pTypeMarshal, pType, "ptr", pData, "uint", nSize, pcbNeededMarshal, pcbNeeded, UInt32)
    return result
}

/**
 * The EnumPrinterData function enumerates configuration data for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **EnumPrinterData** retrieves printer configuration data set by the [**SetPrinterData**](setprinterdata.md) function. A printer's configuration data consists of a set of named and typed values. The **EnumPrinterData** function obtains one of these values, and its name and a type code, each time you call it. Call the **EnumPrinterData** function several times in succession to obtain all of a printer's configuration data values.
 * 
 * Printer configuration data is stored in the registry. While enumerating printer configuration data, you should avoid calling registry functions that might change that data.
 * 
 * If you want to have the operating system supply an adequate buffer size, first call **EnumPrinterData** with both the *cbValueName* and *cbData* parameters set to zero, as noted earlier in the Parameters section. The value of *dwIndex* does not matter for this call. When the function returns, \**pcbValueName* and \**pcbData* will contain buffer sizes that are large enough to enumerate all of the printer's configuration data value names and values. On the next call, allocate value name and data buffers, set *cbValueName* and *cbData* to the sizes in bytes of the allocated buffers, and set *dwIndex* to zero. Thereafter, continue to call the **EnumPrinterData** function, incrementing *dwIndex* by one each time, until the function returns ERROR\_NO\_MORE\_ITEMS.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer whose configuration data is to be obtained. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} dwIndex An index value that specifies the configuration data value to retrieve.
 * 
 * Set this parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. Then increment the parameter by one for subsequent calls involving the same printer, until the function returns ERROR\_NO\_MORE\_ITEMS. See the following Remarks section for further information.
 * 
 * If you use the technique mentioned in the descriptions of the *cbValueName* and *cbData* parameters to obtain adequate buffer size values, setting both those parameters to zero in a first call to **EnumPrinterData** for a specified printer handle, the value of *dwIndex* does not matter for that call. Set *dwIndex* to zero in the next call to **EnumPrinterData** to start the actual enumeration process.
 * 
 * Configuration data values are not ordered. New values will have an arbitrary index. This means that the **EnumPrinterData** function may return values in any order.
 * @param {Integer} pValueName A pointer to a buffer that receives the name of the configuration data value, including a terminating null character.
 * @param {Integer} cbValueName The size, in bytes, of the buffer pointed to by *pValueName*.
 * 
 * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbData* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbValueName* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
 * @param {Pointer<Integer>} pcbValueName A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pValueName*.
 * @param {Pointer<Integer>} pType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types). The *pType* parameter can be **NULL** if the type code is not required.
 * @param {Pointer<Integer>} pData A pointer to a buffer that receives the configuration data value.
 * 
 * This parameter can be **NULL** if the configuration data value is not required.
 * @param {Integer} cbData The size, in bytes, of the buffer pointed to by *pData*.
 * 
 * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbValueName* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbData* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
 * @param {Pointer<Integer>} pcbData A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pData*.
 * 
 * This parameter can be **NULL** if *pData* is **NULL**.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * 
 * The function returns ERROR\_NO\_MORE\_ITEMS when there are no more configuration data values to retrieve for a specified printer handle.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdata
 */
export EnumPrinterDataA(hPrinter, dwIndex, pValueName, cbValueName, pcbValueName, pType, pData, cbData, pcbData) {
    pcbValueNameMarshal := pcbValueName is VarRef ? "uint*" : "ptr"
    pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
    pDataMarshal := pData is VarRef ? "char*" : "ptr"
    pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrinterDataA", PRINTER_HANDLE, hPrinter, "uint", dwIndex, "ptr", pValueName, "uint", cbValueName, pcbValueNameMarshal, pcbValueName, pTypeMarshal, pType, pDataMarshal, pData, "uint", cbData, pcbDataMarshal, pcbData, UInt32)
    return result
}

/**
 * The EnumPrinterData function enumerates configuration data for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **EnumPrinterData** retrieves printer configuration data set by the [**SetPrinterData**](setprinterdata.md) function. A printer's configuration data consists of a set of named and typed values. The **EnumPrinterData** function obtains one of these values, and its name and a type code, each time you call it. Call the **EnumPrinterData** function several times in succession to obtain all of a printer's configuration data values.
 * 
 * Printer configuration data is stored in the registry. While enumerating printer configuration data, you should avoid calling registry functions that might change that data.
 * 
 * If you want to have the operating system supply an adequate buffer size, first call **EnumPrinterData** with both the *cbValueName* and *cbData* parameters set to zero, as noted earlier in the Parameters section. The value of *dwIndex* does not matter for this call. When the function returns, \**pcbValueName* and \**pcbData* will contain buffer sizes that are large enough to enumerate all of the printer's configuration data value names and values. On the next call, allocate value name and data buffers, set *cbValueName* and *cbData* to the sizes in bytes of the allocated buffers, and set *dwIndex* to zero. Thereafter, continue to call the **EnumPrinterData** function, incrementing *dwIndex* by one each time, until the function returns ERROR\_NO\_MORE\_ITEMS.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer whose configuration data is to be obtained. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} dwIndex An index value that specifies the configuration data value to retrieve.
 * 
 * Set this parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. Then increment the parameter by one for subsequent calls involving the same printer, until the function returns ERROR\_NO\_MORE\_ITEMS. See the following Remarks section for further information.
 * 
 * If you use the technique mentioned in the descriptions of the *cbValueName* and *cbData* parameters to obtain adequate buffer size values, setting both those parameters to zero in a first call to **EnumPrinterData** for a specified printer handle, the value of *dwIndex* does not matter for that call. Set *dwIndex* to zero in the next call to **EnumPrinterData** to start the actual enumeration process.
 * 
 * Configuration data values are not ordered. New values will have an arbitrary index. This means that the **EnumPrinterData** function may return values in any order.
 * @param {Integer} pValueName A pointer to a buffer that receives the name of the configuration data value, including a terminating null character.
 * @param {Integer} cbValueName The size, in bytes, of the buffer pointed to by *pValueName*.
 * 
 * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbData* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbValueName* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
 * @param {Pointer<Integer>} pcbValueName A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pValueName*.
 * @param {Pointer<Integer>} pType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types). The *pType* parameter can be **NULL** if the type code is not required.
 * @param {Pointer<Integer>} pData A pointer to a buffer that receives the configuration data value.
 * 
 * This parameter can be **NULL** if the configuration data value is not required.
 * @param {Integer} cbData The size, in bytes, of the buffer pointed to by *pData*.
 * 
 * If you want to have the operating system supply an adequate buffer size, set both this parameter and the *cbValueName* parameter to zero for the first call to **EnumPrinterData** for a specified printer handle. When the function returns, the variable pointed to by *pcbData* will contain a buffer size that is large enough to successfully enumerate all of the printer's configuration data value names.
 * @param {Pointer<Integer>} pcbData A pointer to a variable that receives the number of bytes stored into the buffer pointed to by *pData*.
 * 
 * This parameter can be **NULL** if *pData* is **NULL**.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * 
 * The function returns ERROR\_NO\_MORE\_ITEMS when there are no more configuration data values to retrieve for a specified printer handle.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdata
 */
export EnumPrinterDataW(hPrinter, dwIndex, pValueName, cbValueName, pcbValueName, pType, pData, cbData, pcbData) {
    pcbValueNameMarshal := pcbValueName is VarRef ? "uint*" : "ptr"
    pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
    pDataMarshal := pData is VarRef ? "char*" : "ptr"
    pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrinterDataW", PRINTER_HANDLE, hPrinter, "uint", dwIndex, "ptr", pValueName, "uint", cbValueName, pcbValueNameMarshal, pcbValueName, pTypeMarshal, pType, pDataMarshal, pData, "uint", cbData, pcbDataMarshal, pcbData, UInt32)
    return result
}

/**
 * The EnumPrinterDataEx function enumerates all value names and data for a specified printer and key.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **EnumPrinterDataEx** retrieves printer configuration data set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the values to enumerate. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys. **EnumPrinterDataEx** enumerates all values of the key, but does not enumerate values of subkeys of the specified key. Use the [**EnumPrinterKey**](enumprinterkey.md) function to enumerate subkeys.
 * 
 * If *pKeyName* is **NULL** or an empty string, **EnumPrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
 * @param {Integer} pEnumValues A pointer to a buffer that receives an array of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures. Each structure contains the value name, type, data, and sizes of a value under the key.
 * @param {Integer} cbEnumValues The size, in bytes, of the buffer pointed to by *pcbEnumValues*. If you set *cbEnumValues* to zero, the *pcbEnumValues* parameter returns the required buffer size.
 * @param {Pointer<Integer>} pcbEnumValues A pointer to a variable that receives the size, in bytes, of the retrieved configuration data. If the buffer size specified by *cbEnumValues* is too small, the function returns ERROR\_MORE\_DATA and *pcbEnumValues* indicates the required buffer size.
 * @param {Pointer<Integer>} pnEnumValues A pointer to a variable that receives the number of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures returned in *pEnumValues*.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdataex
 */
export EnumPrinterDataExA(hPrinter, pKeyName, pEnumValues, cbEnumValues, pcbEnumValues, pnEnumValues) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName

    pcbEnumValuesMarshal := pcbEnumValues is VarRef ? "uint*" : "ptr"
    pnEnumValuesMarshal := pnEnumValues is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrinterDataExA", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pEnumValues, "uint", cbEnumValues, pcbEnumValuesMarshal, pcbEnumValues, pnEnumValuesMarshal, pnEnumValues, UInt32)
    return result
}

/**
 * The EnumPrinterDataEx function enumerates all value names and data for a specified printer and key.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **EnumPrinterDataEx** retrieves printer configuration data set by the [**SetPrinterDataEx**](setprinterdataex.md) and [**SetPrinterData**](setprinterdata.md) functions.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function retrieves configuration data. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the values to enumerate. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys. **EnumPrinterDataEx** enumerates all values of the key, but does not enumerate values of subkeys of the specified key. Use the [**EnumPrinterKey**](enumprinterkey.md) function to enumerate subkeys.
 * 
 * If *pKeyName* is **NULL** or an empty string, **EnumPrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
 * @param {Integer} pEnumValues A pointer to a buffer that receives an array of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures. Each structure contains the value name, type, data, and sizes of a value under the key.
 * @param {Integer} cbEnumValues The size, in bytes, of the buffer pointed to by *pcbEnumValues*. If you set *cbEnumValues* to zero, the *pcbEnumValues* parameter returns the required buffer size.
 * @param {Pointer<Integer>} pcbEnumValues A pointer to a variable that receives the size, in bytes, of the retrieved configuration data. If the buffer size specified by *cbEnumValues* is too small, the function returns ERROR\_MORE\_DATA and *pcbEnumValues* indicates the required buffer size.
 * @param {Pointer<Integer>} pnEnumValues A pointer to a variable that receives the number of [**PRINTER\_ENUM\_VALUES**](printer-enum-values.md) structures returned in *pEnumValues*.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterdataex
 */
export EnumPrinterDataExW(hPrinter, pKeyName, pEnumValues, cbEnumValues, pcbEnumValues, pnEnumValues) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName

    pcbEnumValuesMarshal := pcbEnumValues is VarRef ? "uint*" : "ptr"
    pnEnumValuesMarshal := pnEnumValues is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrinterDataExW", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pEnumValues, "uint", cbEnumValues, pcbEnumValuesMarshal, pcbEnumValues, pnEnumValuesMarshal, pnEnumValues, UInt32)
    return result
}

/**
 * The EnumPrinterKey function enumerates the subkeys of a specified key for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function enumerates subkeys. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the subkeys to enumerate. Use the backslash '\\' character as a delimiter to specify a path with one or more subkeys. **EnumPrinterKey** enumerates all subkeys of the key, but does not enumerate the subkeys of those subkeys.
 * 
 * If *pKeyName* is an empty string (""), **EnumPrinterKey** enumerates the top-level key for the printer. If *pKeyName* is **NULL**, **EnumPrinterKey** returns ERROR\_INVALID\_PARAMETER.
 * @param {Integer} pSubkey A pointer to a buffer that receives an array of null-terminated subkey names. The array is terminated by two null characters.
 * @param {Integer} cbSubkey The size, in bytes, of the buffer pointed to by *pSubkey*. If you set *cbSubkey* to zero, the *pcbSubkey* parameter returns the required buffer size.
 * @param {Pointer<Integer>} pcbSubkey A pointer to a variable that receives the number of bytes retrieved in the *pSubkey* buffer. If the buffer size specified by *cbSubkey* is too small, the function returns ERROR\_MORE\_DATA and *pcbSubkey* indicates the required buffer size.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code. If *pKeyName* does not exist, the return value is ERROR\_FILE\_NOT\_FOUND.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterkey
 */
export EnumPrinterKeyA(hPrinter, pKeyName, pSubkey, cbSubkey, pcbSubkey) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName

    pcbSubkeyMarshal := pcbSubkey is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrinterKeyA", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pSubkey, "uint", cbSubkey, pcbSubkeyMarshal, pcbSubkey, UInt32)
    return result
}

/**
 * The EnumPrinterKey function enumerates the subkeys of a specified key for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function enumerates subkeys. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the subkeys to enumerate. Use the backslash '\\' character as a delimiter to specify a path with one or more subkeys. **EnumPrinterKey** enumerates all subkeys of the key, but does not enumerate the subkeys of those subkeys.
 * 
 * If *pKeyName* is an empty string (""), **EnumPrinterKey** enumerates the top-level key for the printer. If *pKeyName* is **NULL**, **EnumPrinterKey** returns ERROR\_INVALID\_PARAMETER.
 * @param {Integer} pSubkey A pointer to a buffer that receives an array of null-terminated subkey names. The array is terminated by two null characters.
 * @param {Integer} cbSubkey The size, in bytes, of the buffer pointed to by *pSubkey*. If you set *cbSubkey* to zero, the *pcbSubkey* parameter returns the required buffer size.
 * @param {Pointer<Integer>} pcbSubkey A pointer to a variable that receives the number of bytes retrieved in the *pSubkey* buffer. If the buffer size specified by *cbSubkey* is too small, the function returns ERROR\_MORE\_DATA and *pcbSubkey* indicates the required buffer size.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code. If *pKeyName* does not exist, the return value is ERROR\_FILE\_NOT\_FOUND.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumprinterkey
 */
export EnumPrinterKeyW(hPrinter, pKeyName, pSubkey, cbSubkey, pcbSubkey) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName

    pcbSubkeyMarshal := pcbSubkey is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPrinterKeyW", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pSubkey, "uint", cbSubkey, pcbSubkeyMarshal, pcbSubkey, UInt32)
    return result
}

/**
 * The SetPrinterData function sets the configuration data for a printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * To retrieve existing configuration data for a printer, call the [**GetPrinterDataEx**](getprinterdataex.md) or [**GetPrinterData**](getprinterdata.md) function.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * The following values of *pValueName* determine the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of a print jobs can be configured for each printer by setting the following values in *pValueName*.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                   |
 * |------------------------------|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                      |
 * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, causes the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pValueName A pointer to a null-terminated string that identifies the data to set.
 * 
 * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Integer} Type A code that indicates the type of data that the *pData* parameter points to. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
 * @param {Integer} pData A pointer to an array of bytes that contains the printer configuration data.
 * @param {Integer} cbData The size, in bytes, of the array.
 * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
 * 
 * If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdata
 */
export SetPrinterDataA(hPrinter, pValueName, Type, pData, cbData) {
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\SetPrinterDataA", PRINTER_HANDLE, hPrinter, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, UInt32)
    return result
}

/**
 * The SetPrinterData function sets the configuration data for a printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * To retrieve existing configuration data for a printer, call the [**GetPrinterDataEx**](getprinterdataex.md) or [**GetPrinterData**](getprinterdata.md) function.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_ALLOW\_USER\_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG\_BEEP\_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG\_DEFAULT\_SPOOL\_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG\_EVENT\_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG\_NET\_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY\_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PORT\_THREAD\_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_TIME\_BEFORE\_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_MAX\_OBJECTS\_BEFORE\_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_IDLE\_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_EXECUTION\_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_PRINT\_DRIVER\_ISOLATION\_OVERRIDE\_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG\_RETRY\_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG\_SCHEDULER\_THREAD\_PRIORITY\_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG\_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * The following values of *pValueName* determine the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED**.<br/> |
 * | **SPLREG\_RESTART\_JOB\_ON\_POOL\_ENABLED** | A nonzero value in *pData* indicates that **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG\_RESTART\_JOB\_ON\_POOL\_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG\_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG\_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of a print jobs can be configured for each printer by setting the following values in *pValueName*.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                   |
 * |------------------------------|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                      |
 * | **ForceClientSideRendering** | **REG\_DWORD** | A value of 0, or if this value is not present in the registry, causes the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pValueName A pointer to a null-terminated string that identifies the data to set.
 * 
 * For printers, this string is the name of a registry value under the printer's "PrinterDriverData" key in the registry.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Integer} Type A code that indicates the type of data that the *pData* parameter points to. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
 * @param {Integer} pData A pointer to an array of bytes that contains the printer configuration data.
 * @param {Integer} cbData The size, in bytes, of the array.
 * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
 * 
 * If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdata
 */
export SetPrinterDataW(hPrinter, pValueName, Type, pData, cbData) {
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\SetPrinterDataW", PRINTER_HANDLE, hPrinter, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, UInt32)
    return result
}

/**
 * The SetPrinterDataEx function sets the configuration data for a printer or print server. The function stores the configuration data under the printers registry key.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * To retrieve existing configuration data for a printer or print spooler, call the [**GetPrinterDataEx**](getprinterdataex.md) function.
 * 
 * Calling **SetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**SetPrinterData**](setprinterdata.md) function.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG_ALLOW_USER_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG_BEEP_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG_DEFAULT_SPOOL_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG_EVENT_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG_NET_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG_PORT_THREAD_PRIORITY_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG_PORT_THREAD_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_TIME_BEFORE_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_MAX_OBJECTS_BEFORE_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_IDLE_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_EXECUTION_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_OVERRIDE_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_RETRY_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG_SCHEDULER_THREAD_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * Passing one of the following predefined values as *pValueName* sets the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG_RESTART_JOB_ON_POOL_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG_RESTART_JOB_ON_POOL_ENABLED**.<br/> |
 * | **SPLREG_RESTART_JOB_ON_POOL_ENABLED** | A nonzero value in *pData* indicates that **SPLREG_RESTART_JOB_ON_POOL_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG_RESTART_JOB_ON_POOL_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * To ensure that the spooler redirects jobs to the next available printer in the pool (when the print job is not printed within the set time), the port monitor must support SNMP and the network ports in the pool must be configured as "SNMP status enabled." The port monitor that supports SNMP is Standard TCP/IP port monitor.
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of print jobs can be configured by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
 * | **ForceClientSideRendering** | **REG_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the value to set. If the specified key or subkeys do not exist, the function creates them.
 * 
 * To store configuration data that can be published in the directory service (DS), specify one of the following predefined registry keys.
 * 
 * 
 * 
 * | Value                                                                                                                                                                      | Meaning                                                                                         |
 * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
 * | <span id="SPLDS_DRIVER_KEY"></span><span id="splds_driver_key"></span><dl> <dt>**SPLDS_DRIVER_KEY**</dt> </dl>    | Printer drivers use this key to store driver properties.<br/>                             |
 * | <span id="SPLDS_SPOOLER_KEY"></span><span id="splds_spooler_key"></span><dl> <dt>**SPLDS_SPOOLER_KEY**</dt> </dl> | Reserved. Used only by the print spooler to store internal spooler properties.<br/>       |
 * | <span id="SPLDS_USER_KEY"></span><span id="splds_user_key"></span><dl> <dt>**SPLDS_USER_KEY**</dt> </dl>          | Applications use this key to store printer properties such as printer asset numbers.<br/> |
 * 
 * 
 * 
 *  
 * 
 * Values that are stored under the SPLDS_USER_KEY key are published in the directory service only if there is a corresponding property in the schema. A domain administrator must create the property if it doesn't already exist. To publish a user-defined property after you use **SetPrinterDataEx** to add or change a value, call [**SetPrinter**](setprinter.md) with *Level* = 7 and with the **dwAction** member of [**PRINTER_INFO_7**](printer-info-7.md) set to **DSPRINT_UPDATE**.
 * 
 * You can specify other keys to store non-DS configuration data. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
 * 
 * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **SetPrinterDataEx** returns **ERROR_INVALID_PARAMETER**.
 * 
 * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
 * 
 * Do not use **SPLDS_SPOOLER_KEY**. To change the spooler printer properties, use [**SetPrinter**](setprinter.md) with *Level* = 2.
 * @param {PSTR} pValueName A pointer to a null-terminated string that identifies the data to set.
 * 
 * For printers, this string specifies the name of a value under the *pKeyName* key.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Integer} Type A code indicating the type of data pointed to by the *pData* parameter. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
 * 
 * If *pKeyName* specifies one of the predefined directory service keys, *Type* must be **REG_SZ**, **REG_MULTI_SZ**, **REG_DWORD**, or **REG_BINARY**. If **REG_BINARY** is used, *cbData* must be equal to 1, and the directory service treats the data as a Boolean value.
 * @param {Integer} pData A pointer to a buffer that contains the printer configuration data.
 * @param {Integer} cbData The size, in bytes, of the array.
 * @returns {Integer} If the function succeeds, the return value is **ERROR_SUCCESS**.
 * 
 * If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdataex
 */
export SetPrinterDataExA(hPrinter, pKeyName, pValueName, Type, pData, cbData) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\SetPrinterDataExA", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, UInt32)
    return result
}

/**
 * The SetPrinterDataEx function sets the configuration data for a printer or print server. The function stores the configuration data under the printers registry key.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * To retrieve existing configuration data for a printer or print spooler, call the [**GetPrinterDataEx**](getprinterdataex.md) function.
 * 
 * Calling **SetPrinterDataEx** with the *pKeyName* parameter set to "PrinterDriverData" is equivalent to calling the [**SetPrinterData**](setprinterdata.md) function.
 * 
 * If *hPrinter* is a handle to a print server, *pValueName* can specify one of the following predefined values.
 * 
 * 
 * 
 * | Value                                                               | Comments                                                                                                                                                                                                                        |
 * |---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG_ALLOW_USER_MANAGEFORMS**                                | Windows XP with Service Pack 2 (SP2) and later<br/> Windows Server 2003 with Service Pack 1 (SP1) and later<br/>                                                                                                    |
 * | **SPLREG_BEEP_ENABLED**                                           |                                                                                                                                                                                                                                 |
 * | **SPLREG_DEFAULT_SPOOL_DIRECTORY**                               |                                                                                                                                                                                                                                 |
 * | **SPLREG_EVENT_LOG**                                              |                                                                                                                                                                                                                                 |
 * | **SPLREG_NET_POPUP**                                              | Not supported in Windows Server 2003 and later<br/>                                                                                                                                                                       |
 * | **SPLREG_PORT_THREAD_PRIORITY_DEFAULT**                         |                                                                                                                                                                                                                                 |
 * | **SPLREG_PORT_THREAD_PRIORITY**                                  |                                                                                                                                                                                                                                 |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_GROUPS**                        | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_TIME_BEFORE_RECYCLE**         | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_MAX_OBJECTS_BEFORE_RECYCLE** | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_IDLE_TIMEOUT**                 | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_EXECUTION_POLICY**             | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_PRINT_DRIVER_ISOLATION_OVERRIDE_POLICY**              | Windows 7 and later<br/>                                                                                                                                                                                                  |
 * | **SPLREG_RETRY_POPUP**                                            | On successful return, *pData* contains 1 if server is set to retry pop-up windows for all jobs, or 0 if server does not retry pop-up windows for all jobs.<br/> Not supported in Windows Server 2003 and later<br/> |
 * | **SPLREG_SCHEDULER_THREAD_PRIORITY**                             |                                                                                                                                                                                                                                 |
 * | **SPLREG_SCHEDULER_THREAD_PRIORITY_DEFAULT**                    |                                                                                                                                                                                                                                 |
 * | **SPLREG_WEBSHAREMGMT**                                            | Windows Server 2003 and later<br/>                                                                                                                                                                                        |
 * 
 * 
 * 
 *  
 * 
 * Passing one of the following predefined values as *pValueName* sets the pool printing behavior when an error occurs.
 * 
 * 
 * 
 * | Value                                       | Comments                                                                                                                                                                                              |
 * |---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **SPLREG_RESTART_JOB_ON_POOL_ERROR**   | The value of *pData* indicates the time, in seconds, when a job is restarted on another port after an error occurs. This setting is used with **SPLREG_RESTART_JOB_ON_POOL_ENABLED**.<br/> |
 * | **SPLREG_RESTART_JOB_ON_POOL_ENABLED** | A nonzero value in *pData* indicates that **SPLREG_RESTART_JOB_ON_POOL_ERROR** is enabled.<br/>                                                                                            |
 * 
 * 
 * 
 *  
 * 
 * The time specified in **SPLREG_RESTART_JOB_ON_POOL_ERROR** is a minimum time. The actual time can be longer, depending on the following port monitor settings, which are registry values under this registry key:
 * 
 * **HKLM\\SYSTEM\\CurrentControlSet\\Control\\Print\\Monitors\\<*MonitorName*>\\Ports**
 * 
 * Call the [**RegSetValueEx**](/windows/win32/api/winreg/nf-winreg-regsetvaluea) function to set these values.
 * 
 * 
 * 
 * | Port monitor setting     | Data type      | Meaning                                                                                                        |
 * |--------------------------|----------------|----------------------------------------------------------------------------------------------------------------|
 * | **StatusUpdateEnabled**  | **REG_DWORD** | If a nonzero value, enables the port monitor to update the spooler with the port status.<br/>            |
 * | **StatusUpdateInterval** | **REG_DWORD** | Specifies the interval, in minutes, when the port monitor updates the spooler with the port status.<br/> |
 * 
 * 
 * 
 *  
 * 
 * To ensure that the spooler redirects jobs to the next available printer in the pool (when the print job is not printed within the set time), the port monitor must support SNMP and the network ports in the pool must be configured as "SNMP status enabled." The port monitor that supports SNMP is Standard TCP/IP port monitor.
 * 
 * In Windows 7 and later versions of Windows, print jobs that are sent to a print server are rendered on the client by default. Client-side rendering of print jobs can be configured by setting *pKeyName* to "PrinterDriverData" and *pValueName* to the setting value in the following table.
 * 
 * 
 * 
 * | Setting                      | Data type      | Description                                                                                                                                                                                                                                                                                                                                                                                                       |
 * |------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EMFDespoolingSetting**     | **REG_DWORD** | A value of 0, or if this value is not present in the registry, enables the default client-side rendering of print jobs.<br/> A value of 1 disables client-side rendering of print jobs.<br/>                                                                                                                                                                                                          |
 * | **ForceClientSideRendering** | **REG_DWORD** | A value of 0, or if this value is not present in the registry, will cause the print jobs to be rendered on the client. If a print job cannot be rendered on the client, it will be rendered on the server. If a print job cannot be rendered on the server, it will fail.<br/> A value of 1 will render print jobs on the client. If a print job cannot be rendered on the client, it will fail.<br/> |
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server for which the function sets configuration data. Use the [**OpenPrinter**](openprinter.md), [**OpenPrinter2**](openprinter2.md), or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the value to set. If the specified key or subkeys do not exist, the function creates them.
 * 
 * To store configuration data that can be published in the directory service (DS), specify one of the following predefined registry keys.
 * 
 * 
 * 
 * | Value                                                                                                                                                                      | Meaning                                                                                         |
 * |----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
 * | <span id="SPLDS_DRIVER_KEY"></span><span id="splds_driver_key"></span><dl> <dt>**SPLDS_DRIVER_KEY**</dt> </dl>    | Printer drivers use this key to store driver properties.<br/>                             |
 * | <span id="SPLDS_SPOOLER_KEY"></span><span id="splds_spooler_key"></span><dl> <dt>**SPLDS_SPOOLER_KEY**</dt> </dl> | Reserved. Used only by the print spooler to store internal spooler properties.<br/>       |
 * | <span id="SPLDS_USER_KEY"></span><span id="splds_user_key"></span><dl> <dt>**SPLDS_USER_KEY**</dt> </dl>          | Applications use this key to store printer properties such as printer asset numbers.<br/> |
 * 
 * 
 * 
 *  
 * 
 * Values that are stored under the SPLDS_USER_KEY key are published in the directory service only if there is a corresponding property in the schema. A domain administrator must create the property if it doesn't already exist. To publish a user-defined property after you use **SetPrinterDataEx** to add or change a value, call [**SetPrinter**](setprinter.md) with *Level* = 7 and with the **dwAction** member of [**PRINTER_INFO_7**](printer-info-7.md) set to **DSPRINT_UPDATE**.
 * 
 * You can specify other keys to store non-DS configuration data. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
 * 
 * If *hPrinter* is a handle to a printer and *pKeyName* is **NULL** or an empty string, **SetPrinterDataEx** returns **ERROR_INVALID_PARAMETER**.
 * 
 * If *hPrinter* is a handle to a print server, *pKeyName* is ignored.
 * 
 * Do not use **SPLDS_SPOOLER_KEY**. To change the spooler printer properties, use [**SetPrinter**](setprinter.md) with *Level* = 2.
 * @param {PWSTR} pValueName A pointer to a null-terminated string that identifies the data to set.
 * 
 * For printers, this string specifies the name of a value under the *pKeyName* key.
 * 
 * For print servers, this string is one of the predefined strings listed in the following Remarks section.
 * @param {Integer} Type A code indicating the type of data pointed to by the *pData* parameter. For a list of the possible type codes, see [Registry Value Types](/windows/desktop/SysInfo/registry-value-types).
 * 
 * If *pKeyName* specifies one of the predefined directory service keys, *Type* must be **REG_SZ**, **REG_MULTI_SZ**, **REG_DWORD**, or **REG_BINARY**. If **REG_BINARY** is used, *cbData* must be equal to 1, and the directory service treats the data as a Boolean value.
 * @param {Integer} pData A pointer to a buffer that contains the printer configuration data.
 * @param {Integer} cbData The size, in bytes, of the array.
 * @returns {Integer} If the function succeeds, the return value is **ERROR_SUCCESS**.
 * 
 * If the function fails, the return value is an error value.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setprinterdataex
 */
export SetPrinterDataExW(hPrinter, pKeyName, pValueName, Type, pData, cbData) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\SetPrinterDataExW", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pValueName, "uint", Type, "ptr", pData, "uint", cbData, UInt32)
    return result
}

/**
 * The DeletePrinterData function deletes specified configuration data for a printer. A printers configuration data consists of a set of named and typed values. The DeletePrinterData function deletes one of these values, specified by its value name.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer whose configuration data is to be deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pValueName A pointer to the null-terminated name of the configuration data value to be deleted.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdata
 */
export DeletePrinterDataA(hPrinter, pValueName) {
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\DeletePrinterDataA", PRINTER_HANDLE, hPrinter, "ptr", pValueName, UInt32)
    return result
}

/**
 * The DeletePrinterData function deletes specified configuration data for a printer. A printers configuration data consists of a set of named and typed values. The DeletePrinterData function deletes one of these values, specified by its value name.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer whose configuration data is to be deleted. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pValueName A pointer to the null-terminated name of the configuration data value to be deleted.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdata
 */
export DeletePrinterDataW(hPrinter, pValueName) {
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\DeletePrinterDataW", PRINTER_HANDLE, hPrinter, "ptr", pValueName, UInt32)
    return result
}

/**
 * The DeletePrinterDataEx function deletes a specified value from the configuration data for a printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function deletes a value. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the value to delete. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
 * 
 * If *pKeyName* is **NULL** or an empty string, **DeletePrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
 * @param {PSTR} pValueName A pointer to a null-terminated string that specifies the name of the value to delete.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdataex
 */
export DeletePrinterDataExA(hPrinter, pKeyName, pValueName) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\DeletePrinterDataExA", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pValueName, UInt32)
    return result
}

/**
 * The DeletePrinterDataEx function deletes a specified value from the configuration data for a printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function deletes a value. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pKeyName A pointer to a null-terminated string that specifies the key containing the value to delete. Use the backslash ( \\ ) character as a delimiter to specify a path that has one or more subkeys.
 * 
 * If *pKeyName* is **NULL** or an empty string, **DeletePrinterDataEx** returns ERROR\_INVALID\_PARAMETER.
 * @param {PWSTR} pValueName A pointer to a null-terminated string that specifies the name of the value to delete.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdataex
 */
export DeletePrinterDataExW(hPrinter, pKeyName, pValueName) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName
    pValueName := pValueName is String ? StrPtr(pValueName) : pValueName

    result := DllCall("winspool.drv\DeletePrinterDataExW", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, "ptr", pValueName, UInt32)
    return result
}

/**
 * The DeletePrinterKey function deletes a specified key and all its subkeys for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function deletes a key. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pKeyName A pointer to a null-terminated string that specifies the key to delete. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys.
 * 
 * If *pKeyName* is an empty string (""), **DeletePrinterKey** deletes all keys below the top-level key for the printer. If *pKeyName* is **NULL**, **DeletePrinterKey** returns ERROR\_INVALID\_PARAMETER.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterkey
 */
export DeletePrinterKeyA(hPrinter, pKeyName) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName

    result := DllCall("winspool.drv\DeletePrinterKeyA", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, UInt32)
    return result
}

/**
 * The DeletePrinterKey function deletes a specified key and all its subkeys for a specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the function deletes a key. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pKeyName A pointer to a null-terminated string that specifies the key to delete. Use the backslash ( \\ ) character as a delimiter to specify a path with one or more subkeys.
 * 
 * If *pKeyName* is an empty string (""), **DeletePrinterKey** deletes all keys below the top-level key for the printer. If *pKeyName* is **NULL**, **DeletePrinterKey** returns ERROR\_INVALID\_PARAMETER.
 * @returns {Integer} If the function succeeds, the return value is ERROR\_SUCCESS.
 * 
 * If the function fails, the return value is a system error code.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterkey
 */
export DeletePrinterKeyW(hPrinter, pKeyName) {
    pKeyName := pKeyName is String ? StrPtr(pKeyName) : pKeyName

    result := DllCall("winspool.drv\DeletePrinterKeyW", PRINTER_HANDLE, hPrinter, "ptr", pKeyName, UInt32)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} Flags 
 * @returns {Integer} 
 */
export WaitForPrinterChange(hPrinter, Flags) {
    result := DllCall("winspool.drv\WaitForPrinterChange", PRINTER_HANDLE, hPrinter, "uint", Flags, UInt32)
    return result
}

/**
 * The FindFirstPrinterChangeNotification function creates a change notification object and returns a handle to the object. You can then use this handle in a call to one of the wait functions to monitor changes to the printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * To monitor a printer or print server, call the **FindFirstPrinterChangeNotification** function, then use the returned change notification object handle in a call to one of the [wait functions](/windows/desktop/Sync/wait-functions). A wait operation on a change notification object is satisfied when the change notification object enters the signaled state. The system signals the object when one or more of the changes specified by *fdwFilter* or *pPrinterNotifyOptions* occurs in the monitored printer or print server.
 * 
 * When you call **FindFirstPrinterChangeNotification**, either *fdwFilter* must be nonzero or *pPrinterNotifyOptions* must be non-**NULL**. If both are specified, notifications will occur for both.
 * 
 * When a wait operation on a printer change notification object is satisfied, call the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function to determine the cause of the notification. For a condition specified by *fdwFilter*, **FindNextPrinterChangeNotification** reports the condition or conditions that changed. For a printer information field specified by *pPrinterNotifyOptions*, **FindNextPrinterChangeNotification** reports the field or fields that changed as well as the new information for these fields. **FindNextPrinterChangeNotification** also resets the change notification object to the nonsignaled state so you can use it in another wait operation to continue monitoring the printer or print server.
 * 
 * With one exception, do not call the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function if the change notification object is not in the signaled state. If the wait function returns the value WAIT\_TIMEOUT, the change object is not in the signaled state. Call the **FindNextPrinterChangeNotification** function only if the wait function succeeds without timing out. The exception is when **FindNextPrinterChangeNotification** is called with the PRINTER\_NOTIFY\_OPTIONS\_REFRESH bit set in the *pPrinterNotifyOptions* parameter.
 * 
 * When you no longer need the change notification object, close it by calling the [**FindClosePrinterChangeNotification**](findcloseprinterchangenotification.md) function.
 * 
 * Callers of **FindFirstPrinterChangeNotification** must ensure that the printer handle passed into **FindFirstPrinterChangeNotification** remains valid until [**FindClosePrinterChangeNotification**](findcloseprinterchangenotification.md) is called. If the printer handle is closed before the printer change notification handle, further notifications will fail to be delivered.
 * 
 * **FindFirstPrinterChangeNotification** will not send change notifications for 3D printers to server handles.
 * 
 * > [!Note]  
 * > In Windows XP with Service Pack 2 (SP2) and later, the Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If a user makes a printer connection to another machine, and the exception is not enabled, then the user will not receive printer change notifications from the server. A machine admin will have to enable exception.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer or print server that you want to monitor. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} fdwFilter The conditions that will cause the change notification object to enter a signaled state. A change notification occurs when one or more of the specified conditions are met. The *fdwFilter* parameter can be zero if *pPrinterNotifyOptions* is non-**NULL**.
 * 
 * This parameter can be one or more of the following values.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                              | Meaning                                                                                                                                                                                                                                                                                                                                                                      |
 * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="PRINTER_CHANGE_FORM"></span><span id="printer_change_form"></span><dl> <dt>**PRINTER\_CHANGE\_FORM**</dt> </dl>                                   | Notify of any changes to a form. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_FORM</dd> <dd>PRINTER\_CHANGE\_SET\_FORM</dd> <dd>PRINTER\_CHANGE\_DELETE\_FORM</dd> </dl>                                                                              |
 * | <span id="PRINTER_CHANGE_JOB"></span><span id="printer_change_job"></span><dl> <dt>**PRINTER\_CHANGE\_JOB**</dt> </dl>                                      | Notify of any changes to a job. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_JOB</dd> <dd>PRINTER\_CHANGE\_SET\_JOB</dd> <dd>PRINTER\_CHANGE\_DELETE\_JOB</dd> <dd>PRINTER\_CHANGE\_WRITE\_JOB</dd> </dl>                                  |
 * | <span id="PRINTER_CHANGE_PORT"></span><span id="printer_change_port"></span><dl> <dt>**PRINTER\_CHANGE\_PORT**</dt> </dl>                                   | Notify of any changes to a port. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PORT</dd> <dd>PRINTER\_CHANGE\_CONFIGURE\_PORT </dd> <dd>PRINTER\_CHANGE\_DELETE\_PORT</dd> </dl>                                                                       |
 * | <span id="PRINTER_CHANGE_PRINT_PROCESSOR"></span><span id="printer_change_print_processor"></span><dl> <dt>**PRINTER\_CHANGE\_PRINT\_PROCESSOR**</dt> </dl> | Notify of any changes to a print processor. You can set this general flag or one or more of the following specific flags: <br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PRINT\_PROCESSOR </dd> <dd>PRINTER\_CHANGE\_DELETE\_PRINT\_PROCESSOR</dd> </dl>                                                                                        |
 * | <span id="PRINTER_CHANGE_PRINTER"></span><span id="printer_change_printer"></span><dl> <dt>**PRINTER\_CHANGE\_PRINTER**</dt> </dl>                          | Notify of any changes to a printer. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PRINTER</dd> <dd>PRINTER\_CHANGE\_SET\_PRINTER</dd> <dd>PRINTER\_CHANGE\_DELETE\_PRINTER</dd> <dd>PRINTER\_CHANGE\_FAILED\_CONNECTION\_PRINTER</dd> </dl> |
 * | <span id="PRINTER_CHANGE_PRINTER_DRIVER"></span><span id="printer_change_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_PRINTER\_DRIVER**</dt> </dl>    | Notify of any changes to a printer driver. You can set this general flag or one or more of the following specific flags:<br/> <dl> <dd>PRINTER\_CHANGE\_ADD\_PRINTER\_DRIVER</dd> <dd>PRINTER\_CHANGE\_SET\_PRINTER\_DRIVER</dd> <dd>PRINTER\_CHANGE\_DELETE\_PRINTER\_DRIVER</dd> </dl>                                   |
 * | <span id="PRINTER_CHANGE_ALL"></span><span id="printer_change_all"></span><dl> <dt>**PRINTER\_CHANGE\_ALL**</dt> </dl>                                      | Notify if any of the preceding changes occur.<br/>                                                                                                                                                                                                                                                                                                                     |
 * | <span id="PRINTER_CHANGE_SERVER"></span><span id="printer_change_server"></span><dl> <dt>**PRINTER\_CHANGE\_SERVER**</dt> </dl>                             | Windows 7: Notify of any changes to the server.<br/> This flag is not included in the changes monitored by setting the **PRINTER\_CHANGE\_ALL** value.<br/>                                                                                                                                                                                                      |
 * 
 * 
 * 
 *  
 * 
 * For descriptions of the more specific flags in the preceding table, see the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function.
 * @param {Integer} fdwOptions The flag that determines the category of printers for which notifications will work.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                                                                               | Meaning                                                                                                                                      |
 * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="PRINTER_NOTIFY_CATEGORY_ALL"></span><span id="printer_notify_category_all"></span><dl> <dt>**PRINTER\_NOTIFY\_CATEGORY\_ALL**</dt> <dt>0x001000</dt> </dl> | [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) returns notifications for both 2D and 3D printers.<br/> |
 * | <span id="PRINTER_NOTIFY_CATEGORY_3D"></span><span id="printer_notify_category_3d"></span><dl> <dt>**PRINTER\_NOTIFY\_CATEGORY\_3D**</dt> <dt>0x002000</dt> </dl>    | [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) returns notifications only for 3D printers.<br/>        |
 * 
 * 
 * 
 *  
 * 
 * When this flag is set to zero (0), **FindFirstPrinterChangeNotification** will only work for 2D printers. This is the default value.
 * @param {Pointer<Void>} pPrinterNotifyOptions A pointer to a [**PRINTER\_NOTIFY\_OPTIONS**](printer-notify-options.md) structure. The **pTypes** member of this structure is an array of one or more [**PRINTER\_NOTIFY\_OPTIONS\_TYPE**](printer-notify-options-type.md) structures, each of which specifies a printer information field to monitor. A change notification occurs when one or more of the specified fields changes. When a change occurs, the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function can retrieve the new printer information. This parameter can be **NULL** if *fdwFilter* is nonzero.
 * 
 * For a list of fields that can be monitored, see [**PRINTER\_NOTIFY\_OPTIONS\_TYPE**](printer-notify-options-type.md).
 * @returns {FINDPRINTERCHANGENOTIFICATION_HANDLE} If the function succeeds, the return value is a handle to a change notification object associated with the specified printer or print server.
 * 
 * If the function fails, the return value is INVALID\_HANDLE\_VALUE.
 * @see https://learn.microsoft.com/windows/win32/printdocs/findfirstprinterchangenotification
 */
export FindFirstPrinterChangeNotification(hPrinter, fdwFilter, fdwOptions, pPrinterNotifyOptions) {
    pPrinterNotifyOptionsMarshal := pPrinterNotifyOptions is VarRef ? "ptr" : "ptr"

    result := DllCall("winspool.drv\FindFirstPrinterChangeNotification", PRINTER_HANDLE, hPrinter, "uint", fdwFilter, "uint", fdwOptions, pPrinterNotifyOptionsMarshal, pPrinterNotifyOptions, FINDPRINTERCHANGENOTIFICATION_HANDLE.Owned)
    return result
}

/**
 * The FindNextPrinterChangeNotification function retrieves information about the most recent change notification for a change notification object associated with a printer or print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * Call the **FindNextPrinterChangeNotification** function after a wait operation on a notification object created by [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) has been satisfied. Calling **FindNextPrinterChangeNotification** lets you obtain information about the change that satisfied the wait operation, and resets the notification object so it can be signaled when the next change occurs.
 * 
 * With one exception, do not call the **FindNextPrinterChangeNotification** function if the change notification object is not in the signaled state. If a wait function returns the value **WAIT\_TIMEOUT**, the change object is not in the signaled state. Call the **FindNextPrinterChangeNotification** function only if the wait function succeeds without timing out. The exception is when **FindNextPrinterChangeNotification** is called with the **PRINTER\_NOTIFY\_OPTIONS\_REFRESH** bit set in the *pPrinterNotifyOptions* parameter. Note that even when this flag is set, it is still possible for the **PRINTER\_NOTIFY\_INFO\_DISCARDED** flag to be set in the *ppPrinterNotifyInfo* parameter.
 * 
 * To continue monitoring the printer or print server for changes, repeat the cycle of calling one of the [wait functions](/windows/desktop/Sync/wait-functions) , and then calling the **FindNextPrinterChangeNotification** function to examine the change and reset the notification object.
 * 
 * **FindNextPrinterChangeNotification** may combine multiple changes to the same printer information field into a single notification. When this occurs, the function typically collapses all changes for the field into a single entry in the array of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structures in *ppPrinterNotifyInfo*; the single entry reports only the most current information. However, for some job and printer information fields, the function can return multiple array entries for the same field. In this case, the last array entry for the field reports the current data, and the earlier entries contain the data for the intermediate stages.
 * 
 * When you no longer need the change notification object, close it by calling the [**FindClosePrinterChangeNotification**](findcloseprinterchangenotification.md) function.
 * 
 * > [!Note]  
 * > In Windows XP with Service Pack 2 (SP2) and later, the Internet Connection Firewall (ICF) blocks printer ports by default, but an exception for File and Print Sharing can be enabled. If a user makes a printer connection to another machine, and the exception is not enabled, then the user will not receive printer change notifications from the server. A machine admin will have to enable exception.
 * @param {FINDPRINTERCHANGENOTIFICATION_HANDLE} _hChange A handle to a change notification object associated with a printer or print server. You obtain such a handle by calling the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function. The operating system sets this change notification object to the signaled state when it detects one of the changes specified in the object's change notification filter.
 * @param {Pointer<Integer>} pdwChange A pointer to a variable whose bits are set to indicate the changes that occurred to cause the most recent notification. The bit flags that might be set correspond to those specified in the *fdwFilter* parameter of the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) call. The system sets one or more of the following bit flags.
 * 
 * 
 * 
 * | Value                                                                                                                                                                                                                                             | Meaning                                                   |
 * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|
 * | <span id="PRINTER_CHANGE_ADD_FORM"></span><span id="printer_change_add_form"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_FORM**</dt> </dl>                                                     | A form was added to the server.<br/>                |
 * | <span id="PRINTER_CHANGE_ADD_JOB"></span><span id="printer_change_add_job"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_JOB**</dt> </dl>                                                        | A print job was sent to the printer.<br/>           |
 * | <span id="PRINTER_CHANGE_ADD_PORT"></span><span id="printer_change_add_port"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PORT**</dt> </dl>                                                     | A port or monitor was added to the server.<br/>     |
 * | <span id="PRINTER_CHANGE_ADD_PRINT_PROCESSOR"></span><span id="printer_change_add_print_processor"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PRINT\_PROCESSOR**</dt> </dl>                   | A print processor was added to the server.<br/>     |
 * | <span id="PRINTER_CHANGE_ADD_PRINTER"></span><span id="printer_change_add_printer"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PRINTER**</dt> </dl>                                            | A printer was added to the server.<br/>             |
 * | <span id="PRINTER_CHANGE_ADD_PRINTER_DRIVER"></span><span id="printer_change_add_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_ADD\_PRINTER\_DRIVER**</dt> </dl>                      | A printer driver was added to the server.<br/>      |
 * | <span id="PRINTER_CHANGE_CONFIGURE_PORT"></span><span id="printer_change_configure_port"></span><dl> <dt>**PRINTER\_CHANGE\_CONFIGURE\_PORT**</dt> </dl>                                   | A port was configured on the server.<br/>           |
 * | <span id="PRINTER_CHANGE_DELETE_FORM"></span><span id="printer_change_delete_form"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_FORM**</dt> </dl>                                            | A form was deleted from the server.<br/>            |
 * | <span id="PRINTER_CHANGE_DELETE_JOB"></span><span id="printer_change_delete_job"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_JOB**</dt> </dl>                                               | A job was deleted.<br/>                             |
 * | <span id="PRINTER_CHANGE_DELETE_PORT"></span><span id="printer_change_delete_port"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PORT**</dt> </dl>                                            | A port or monitor was deleted from the server.<br/> |
 * | <span id="PRINTER_CHANGE_DELETE_PRINT_PROCESSOR"></span><span id="printer_change_delete_print_processor"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PRINT\_PROCESSOR**</dt> </dl>          | A print processor was deleted from the server.<br/> |
 * | <span id="PRINTER_CHANGE_DELETE_PRINTER"></span><span id="printer_change_delete_printer"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PRINTER**</dt> </dl>                                   | A printer was deleted.<br/>                         |
 * | <span id="PRINTER_CHANGE_DELETE_PRINTER_DRIVER"></span><span id="printer_change_delete_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_DELETE\_PRINTER\_DRIVER**</dt> </dl>             | A printer driver was deleted from the server.<br/>  |
 * | <span id="PRINTER_CHANGE_FAILED_CONNECTION_PRINTER"></span><span id="printer_change_failed_connection_printer"></span><dl> <dt>**PRINTER\_CHANGE\_FAILED\_CONNECTION\_PRINTER**</dt> </dl> | A printer connection has failed.<br/>               |
 * | <span id="PRINTER_CHANGE_SET_FORM"></span><span id="printer_change_set_form"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_FORM**</dt> </dl>                                                     | A form was set on the server.<br/>                  |
 * | <span id="PRINTER_CHANGE_SET_JOB"></span><span id="printer_change_set_job"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_JOB**</dt> </dl>                                                        | A job was set.<br/>                                 |
 * | <span id="PRINTER_CHANGE_SET_PRINTER"></span><span id="printer_change_set_printer"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_PRINTER**</dt> </dl>                                            | A printer was set.<br/>                             |
 * | <span id="PRINTER_CHANGE_SET_PRINTER_DRIVER"></span><span id="printer_change_set_printer_driver"></span><dl> <dt>**PRINTER\_CHANGE\_SET\_PRINTER\_DRIVER**</dt> </dl>                      | A printer driver was set.<br/>                      |
 * | <span id="PRINTER_CHANGE_WRITE_JOB"></span><span id="printer_change_write_job"></span><dl> <dt>**PRINTER\_CHANGE\_WRITE\_JOB**</dt> </dl>                                                  | Job data was written.<br/>                          |
 * | <span id="PRINTER_CHANGE_TIMEOUT"></span><span id="printer_change_timeout"></span><dl> <dt>**PRINTER\_CHANGE\_TIMEOUT**</dt> </dl>                                                         | The job timed out.<br/>                             |
 * | <span id="PRINTER_CHANGE_SERVER"></span><span id="printer_change_server"></span><dl> <dt>**PRINTER\_CHANGE\_SERVER**</dt> </dl>                                                            | Windows 7: A change occurred on the server.<br/>    |
 * @param {Pointer<Void>} pvReserved 
 * @param {Pointer<Pointer<Void>>} ppPrinterNotifyInfo A pointer to a pointer variable that receives a pointer to a system-allocated, read-only buffer. Call the [**FreePrinterNotifyInfo**](freeprinternotifyinfo.md) function to free the buffer when you are finished with it. This parameter can be **NULL** if no information is required.
 * 
 * The buffer contains a [**PRINTER\_NOTIFY\_INFO**](printer-notify-info.md) structure, which contains an array of [**PRINTER\_NOTIFY\_INFO\_DATA**](printer-notify-info-data.md) structures. Each element of the array contains information about one of the fields specified in the *pPrinterNotifyOptions* parameter of the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) call. Typically, the function provides data only for the fields that changed to cause the most recent notification. However, if the structure pointed to by the *pPrinterNotifyOptions* parameter specifies **PRINTER\_NOTIFY\_OPTIONS\_REFRESH**, the function provides data for all monitored fields.
 * 
 * If the **PRINTER\_NOTIFY\_INFO\_DISCARDED** bit is set in the **Flags** member of the [**PRINTER\_NOTIFY\_INFO**](printer-notify-info.md) structure, an overflow or error occurred, and notifications may have been lost. In this case, no additional notifications will be sent until you make a second **FindNextPrinterChangeNotification** call that specifies **PRINTER\_NOTIFY\_OPTIONS\_REFRESH**.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/findnextprinterchangenotification
 */
export FindNextPrinterChangeNotification(_hChange, pdwChange, pvReserved, ppPrinterNotifyInfo) {
    pdwChangeMarshal := pdwChange is VarRef ? "uint*" : "ptr"
    pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"
    ppPrinterNotifyInfoMarshal := ppPrinterNotifyInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("winspool.drv\FindNextPrinterChangeNotification", FINDPRINTERCHANGENOTIFICATION_HANDLE, _hChange, pdwChangeMarshal, pdwChange, pvReservedMarshal, pvReserved, ppPrinterNotifyInfoMarshal, ppPrinterNotifyInfo, BOOL)
    return result
}

/**
 * The FreePrinterNotifyInfo function frees a system-allocated buffer created by the FindNextPrinterChangeNotification function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {Pointer<PRINTER_NOTIFY_INFO>} pPrinterNotifyInfo Pointer to a [**PRINTER\_NOTIFY\_INFO**](printer-notify-info.md) buffer returned from a call to the [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md) function. **FreePrinterNotifyInfo** deallocates this buffer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/freeprinternotifyinfo
 */
export FreePrinterNotifyInfo(pPrinterNotifyInfo) {
    result := DllCall("winspool.drv\FreePrinterNotifyInfo", PRINTER_NOTIFY_INFO.Ptr, pPrinterNotifyInfo, BOOL)
    return result
}

/**
 * The FindClosePrinterChangeNotification function closes a change notification object created by calling the FindFirstPrinterChangeNotification function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * After calling the **FindClosePrinterChangeNotification** function, you cannot use the *hChange* handle in subsequent calls to either [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) or [**FindNextPrinterChangeNotification**](findnextprinterchangenotification.md).
 * @param {FINDPRINTERCHANGENOTIFICATION_HANDLE} _hChange A handle to the change notification object to be closed. This is a handle created by calling the [**FindFirstPrinterChangeNotification**](findfirstprinterchangenotification.md) function.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/findcloseprinterchangenotification
 */
export FindClosePrinterChangeNotification(_hChange) {
    result := DllCall("winspool.drv\FindClosePrinterChangeNotification", FINDPRINTERCHANGENOTIFICATION_HANDLE, _hChange, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} _Error 
 * @param {HWND} _hWnd 
 * @param {PSTR} pText 
 * @param {PSTR} pCaption 
 * @param {Integer} dwType 
 * @returns {Integer} 
 */
export PrinterMessageBoxA(hPrinter, _Error, _hWnd, pText, pCaption, dwType) {
    pText := pText is String ? StrPtr(pText) : pText
    pCaption := pCaption is String ? StrPtr(pCaption) : pCaption

    result := DllCall("winspool.drv\PrinterMessageBoxA", PRINTER_HANDLE, hPrinter, "uint", _Error, HWND, _hWnd, "ptr", pText, "ptr", pCaption, "uint", dwType, UInt32)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} _Error 
 * @param {HWND} _hWnd 
 * @param {PWSTR} pText 
 * @param {PWSTR} pCaption 
 * @param {Integer} dwType 
 * @returns {Integer} 
 */
export PrinterMessageBoxW(hPrinter, _Error, _hWnd, pText, pCaption, dwType) {
    pText := pText is String ? StrPtr(pText) : pText
    pCaption := pCaption is String ? StrPtr(pCaption) : pCaption

    result := DllCall("winspool.drv\PrinterMessageBoxW", PRINTER_HANDLE, hPrinter, "uint", _Error, HWND, _hWnd, "ptr", pText, "ptr", pCaption, "uint", dwType, UInt32)
    return result
}

/**
 * The ClosePrinter function closes the specified printer object.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * When the **ClosePrinter** function returns, the handle *hPrinter* is invalid, regardless of whether the function has succeeded or failed.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer object to be closed. This handle is returned by the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/closeprinter
 */
export ClosePrinter(hPrinter) {
    A_LastError := 0

    result := DllCall("winspool.drv\ClosePrinter", PRINTER_HANDLE, hPrinter, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} Level 
 * @param {Pointer<Integer>} pForm 
 * @returns {BOOL} 
 */
export AddFormA(hPrinter, Level, pForm) {
    pFormMarshal := pForm is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\AddFormA", PRINTER_HANDLE, hPrinter, "uint", Level, pFormMarshal, pForm, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} Level 
 * @param {Pointer<Integer>} pForm 
 * @returns {BOOL} 
 */
export AddFormW(hPrinter, Level, pForm) {
    pFormMarshal := pForm is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\AddFormW", PRINTER_HANDLE, hPrinter, "uint", Level, pFormMarshal, pForm, BOOL)
    return result
}

/**
 * The DeleteForm function removes a form name from the list of supported forms.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **DeleteForm** can only delete form names that were added by using the [**AddForm**](addform.md) function.
 * @param {PRINTER_HANDLE} hPrinter Indicates the open printer handle that this function is to be performed upon. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pFormName Pointer to the form name to be removed.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteform
 */
export DeleteFormA(hPrinter, pFormName) {
    pFormName := pFormName is String ? StrPtr(pFormName) : pFormName

    result := DllCall("winspool.drv\DeleteFormA", PRINTER_HANDLE, hPrinter, "ptr", pFormName, BOOL)
    return result
}

/**
 * The DeleteForm function removes a form name from the list of supported forms.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **DeleteForm** can only delete form names that were added by using the [**AddForm**](addform.md) function.
 * @param {PRINTER_HANDLE} hPrinter Indicates the open printer handle that this function is to be performed upon. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pFormName Pointer to the form name to be removed.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteform
 */
export DeleteFormW(hPrinter, pFormName) {
    pFormName := pFormName is String ? StrPtr(pFormName) : pFormName

    result := DllCall("winspool.drv\DeleteFormW", PRINTER_HANDLE, hPrinter, "ptr", pFormName, BOOL)
    return result
}

/**
 * The GetForm function retrieves information about a specified form.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) will always be STRING\_LANGPAIR.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pFormName A pointer to a null-terminated string that specifies the name of the form. To get the names of the forms supported by the printer, call the [**EnumForms**](enumforms.md) function.
 * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
 * @param {Integer} pForm A pointer to an array of bytes that receives the initialized [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
 * @param {Integer} cbBuf The size, in bytes, of the *pForm* array.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getform
 */
export GetFormA(hPrinter, pFormName, Level, pForm, cbBuf, pcbNeeded) {
    pFormName := pFormName is String ? StrPtr(pFormName) : pFormName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetFormA", PRINTER_HANDLE, hPrinter, "ptr", pFormName, "uint", Level, "ptr", pForm, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetForm function retrieves information about a specified form.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) will always be STRING\_LANGPAIR.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pFormName A pointer to a null-terminated string that specifies the name of the form. To get the names of the forms supported by the printer, call the [**EnumForms**](enumforms.md) function.
 * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
 * @param {Integer} pForm A pointer to an array of bytes that receives the initialized [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
 * @param {Integer} cbBuf The size, in bytes, of the *pForm* array.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that specifies the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getform
 */
export GetFormW(hPrinter, pFormName, Level, pForm, cbBuf, pcbNeeded) {
    pFormName := pFormName is String ? StrPtr(pFormName) : pFormName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetFormW", PRINTER_HANDLE, hPrinter, "ptr", pFormName, "uint", Level, "ptr", pForm, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The SetForm function sets the form information for the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **SetForm** can be called multiple times for an existing [**FORM\_INFO\_2**](form-info-2.md), each call adding additional pairs of **pDisplayName** and **wLangId** values. All languages versions of the form will get the **Size** and **ImageableArea** values of the **FORM\_INFO\_2** in the most recent call to **SetForm**.
 * 
 * If the caller is remote and the *Level* is 2, the **StringType** value of the [**FORM\_INFO\_2**](form-info-2.md) cannot be STRING\_MUIDLL.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the form information is set. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PSTR} pFormName A pointer to a null-terminated string that specifies the form name for which the form information is set.
 * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
 * @param {Pointer<Integer>} pForm A pointer to a [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setform
 */
export SetFormA(hPrinter, pFormName, Level, pForm) {
    pFormName := pFormName is String ? StrPtr(pFormName) : pFormName

    pFormMarshal := pForm is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\SetFormA", PRINTER_HANDLE, hPrinter, "ptr", pFormName, "uint", Level, pFormMarshal, pForm, BOOL)
    return result
}

/**
 * The SetForm function sets the form information for the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * **SetForm** can be called multiple times for an existing [**FORM\_INFO\_2**](form-info-2.md), each call adding additional pairs of **pDisplayName** and **wLangId** values. All languages versions of the form will get the **Size** and **ImageableArea** values of the **FORM\_INFO\_2** in the most recent call to **SetForm**.
 * 
 * If the caller is remote and the *Level* is 2, the **StringType** value of the [**FORM\_INFO\_2**](form-info-2.md) cannot be STRING\_MUIDLL.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the form information is set. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pFormName A pointer to a null-terminated string that specifies the form name for which the form information is set.
 * @param {Integer} Level The version of the structure to which *pForm* points. This value must be 1 or 2.
 * @param {Pointer<Integer>} pForm A pointer to a [**FORM\_INFO\_1**](form-info-1.md) or [**FORM\_INFO\_2**](form-info-2.md) structure.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setform
 */
export SetFormW(hPrinter, pFormName, Level, pForm) {
    pFormName := pFormName is String ? StrPtr(pFormName) : pFormName

    pFormMarshal := pForm is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\SetFormW", PRINTER_HANDLE, hPrinter, "ptr", pFormName, "uint", Level, pFormMarshal, pForm, BOOL)
    return result
}

/**
 * The EnumForms function enumerates the forms supported by the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) structures will always be **STRING\_LANGPAIR**.
 * 
 * In Windows Vista, the form data returned by **EnumForms** is retrieved from a local cache when *hPrinter* refers to a remote print server or a printer hosted by a print server and there is at least one open connection to a printer on the remote print server. In all other configurations, the form data is queried from the remote print server.
 * @param {PRINTER_HANDLE} hPrinter Handle to the printer for which the forms should be enumerated. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level Specifies the version of the structure to which *pForm* points. This value must be 1 or 2.
 * @param {Integer} pForm Pointer to one or more [**FORM\_INFO\_1**](form-info-1.md) structures or to one or more [**FORM\_INFO\_2**](form-info-2.md) structures. All the structures will have the same level.
 * @param {Integer} cbBuf Specifies the size, in bytes, of the buffer to which *pForm* points.
 * @param {Pointer<Integer>} pcbNeeded Pointer to a variable that receives the number of bytes copied to the array to which *pForm* points (if the operation succeeds) or the number of bytes required (if it fails because *cbBuf* is too small).
 * @param {Pointer<Integer>} pcReturned Pointer to a variable that receives the number of structures copied into the array to which *pForm* points.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumforms
 */
export EnumFormsA(hPrinter, Level, pForm, cbBuf, pcbNeeded, pcReturned) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumFormsA", PRINTER_HANDLE, hPrinter, "uint", Level, "ptr", pForm, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The EnumForms function enumerates the forms supported by the specified printer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * If the caller is remote, and the *Level* is 2, the **StringType** value of the returned [**FORM\_INFO\_2**](form-info-2.md) structures will always be **STRING\_LANGPAIR**.
 * 
 * In Windows Vista, the form data returned by **EnumForms** is retrieved from a local cache when *hPrinter* refers to a remote print server or a printer hosted by a print server and there is at least one open connection to a printer on the remote print server. In all other configurations, the form data is queried from the remote print server.
 * @param {PRINTER_HANDLE} hPrinter Handle to the printer for which the forms should be enumerated. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} Level Specifies the version of the structure to which *pForm* points. This value must be 1 or 2.
 * @param {Integer} pForm Pointer to one or more [**FORM\_INFO\_1**](form-info-1.md) structures or to one or more [**FORM\_INFO\_2**](form-info-2.md) structures. All the structures will have the same level.
 * @param {Integer} cbBuf Specifies the size, in bytes, of the buffer to which *pForm* points.
 * @param {Pointer<Integer>} pcbNeeded Pointer to a variable that receives the number of bytes copied to the array to which *pForm* points (if the operation succeeds) or the number of bytes required (if it fails because *cbBuf* is too small).
 * @param {Pointer<Integer>} pcReturned Pointer to a variable that receives the number of structures copied into the array to which *pForm* points.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumforms
 */
export EnumFormsW(hPrinter, Level, pForm, cbBuf, pcbNeeded, pcReturned) {
    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumFormsW", PRINTER_HANDLE, hPrinter, "uint", Level, "ptr", pForm, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The EnumMonitors function retrieves information about the port monitors installed on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the monitors reside. If this parameter is **NULL**, the local monitors are enumerated.
 * @param {Integer} Level The version of the structure pointed to by *pMonitors*.
 * 
 * This value can be 1 or 2.
 * @param {Integer} pMonitor 
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pMonitors*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures that were returned in the buffer pointed to by *pMonitors*.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enummonitors
 */
export EnumMonitorsA(pName, Level, pMonitor, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumMonitorsA", "ptr", pName, "uint", Level, "ptr", pMonitor, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The EnumMonitors function retrieves information about the port monitors installed on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the monitors reside. If this parameter is **NULL**, the local monitors are enumerated.
 * @param {Integer} Level The version of the structure pointed to by *pMonitors*.
 * 
 * This value can be 1 or 2.
 * @param {Integer} pMonitor 
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pMonitors*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of structures that were returned in the buffer pointed to by *pMonitors*.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enummonitors
 */
export EnumMonitorsW(pName, Level, pMonitor, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumMonitorsW", "ptr", pName, "uint", Level, "ptr", pMonitor, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The AddMonitor function installs a local port monitor and links the configuration, data, and monitor files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before an application calls the **AddMonitor** function, all files required by the monitor must be copied to the SYSTEM32 directory.
 * 
 * To determine the port monitors that are currently installed, call the [**EnumMonitors**](enummonitors.md) function.
 * 
 * To remove a monitor added by **AddMonitor**, call the [**DeleteMonitor**](deletemonitor.md) function.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the monitor should be installed. For systems that support only local installation of monitors, this string should be **NULL**.
 * @param {Integer} Level The version of the structure to which *pMonitors* points. This value must be 2.
 * @param {Pointer<Integer>} pMonitors A pointer to a [**MONITOR\_INFO\_2**](monitor-info-2.md) structure. If the **pEnvironment** member of the *pMonitors* structure is **NULL**, the current environment of the caller (client), not of the destination (server), is used.
 * 
 * Note that the call will fail if the environment does not match the environment of the server, that is, you can only add a monitor that was written for the architecture of the server.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addmonitor
 */
export AddMonitorA(pName, Level, pMonitors) {
    pName := pName is String ? StrPtr(pName) : pName

    pMonitorsMarshal := pMonitors is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\AddMonitorA", "ptr", pName, "uint", Level, pMonitorsMarshal, pMonitors, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddMonitor function installs a local port monitor and links the configuration, data, and monitor files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have the [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * 
 * Before an application calls the **AddMonitor** function, all files required by the monitor must be copied to the SYSTEM32 directory.
 * 
 * To determine the port monitors that are currently installed, call the [**EnumMonitors**](enummonitors.md) function.
 * 
 * To remove a monitor added by **AddMonitor**, call the [**DeleteMonitor**](deletemonitor.md) function.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the monitor should be installed. For systems that support only local installation of monitors, this string should be **NULL**.
 * @param {Integer} Level The version of the structure to which *pMonitors* points. This value must be 2.
 * @param {Pointer<Integer>} pMonitors A pointer to a [**MONITOR\_INFO\_2**](monitor-info-2.md) structure. If the **pEnvironment** member of the *pMonitors* structure is **NULL**, the current environment of the caller (client), not of the destination (server), is used.
 * 
 * Note that the call will fail if the environment does not match the environment of the server, that is, you can only add a monitor that was written for the architecture of the server.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addmonitor
 */
export AddMonitorW(pName, Level, pMonitors) {
    pName := pName is String ? StrPtr(pName) : pName

    pMonitorsMarshal := pMonitors is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\AddMonitorW", "ptr", pName, "uint", Level, pMonitorsMarshal, pMonitors, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DeleteMonitor function removes a port monitor added by the AddMonitor function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the monitor is to be removed. If this parameter is **NULL**, the port monitor is removed locally.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the monitor is to be removed (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the monitor is removed from the current environment of the calling application and client machine (not of the destination application and print server).
 * @param {PSTR} pMonitorName A pointer to a null-terminated string that specifies the name of the monitor to be removed.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deletemonitor
 */
export DeleteMonitorA(pName, pEnvironment, pMonitorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName

    A_LastError := 0

    result := DllCall("winspool.drv\DeleteMonitorA", "ptr", pName, "ptr", pEnvironment, "ptr", pMonitorName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DeleteMonitor function removes a port monitor added by the AddMonitor function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller must have [SeLoadDriverPrivilege](/windows/desktop/SecAuthZ/authorization-constants).
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server from which the monitor is to be removed. If this parameter is **NULL**, the port monitor is removed locally.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the monitor is to be removed (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the monitor is removed from the current environment of the calling application and client machine (not of the destination application and print server).
 * @param {PWSTR} pMonitorName A pointer to a null-terminated string that specifies the name of the monitor to be removed.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deletemonitor
 */
export DeleteMonitorW(pName, pEnvironment, pMonitorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName

    A_LastError := 0

    result := DllCall("winspool.drv\DeleteMonitorW", "ptr", pName, "ptr", pEnvironment, "ptr", pMonitorName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The EnumPorts function enumerates the ports that are available for printing on a specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **EnumPorts** function can succeed even if the server specified by *pName* does not have a printer defined.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server whose printer ports you want to enumerate.
 * 
 * If *pName* is **NULL**, the function enumerates the local machine's printer ports.
 * @param {Integer} Level The type of information returned in the *pPorts* buffer. If *Level* is 1, *pPorts* receives an array of [**PORT\_INFO\_1**](port-info-1.md) structures. If *Level* is 2, *pPorts* receives an array of [**PORT\_INFO\_2**](port-info-2.md) structures.
 * @param {Integer} pPort 
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPorts*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPorts* buffer. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of [**PORT\_INFO\_1**](port-info-1.md) or [**PORT\_INFO\_2**](port-info-2.md) structures returned in the *pPorts* buffer. This is the number of printer ports that are available on the specified server.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumports
 */
export EnumPortsA(pName, Level, pPort, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPortsA", "ptr", pName, "uint", Level, "ptr", pPort, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The EnumPorts function enumerates the ports that are available for printing on a specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **EnumPorts** function can succeed even if the server specified by *pName* does not have a printer defined.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server whose printer ports you want to enumerate.
 * 
 * If *pName* is **NULL**, the function enumerates the local machine's printer ports.
 * @param {Integer} Level The type of information returned in the *pPorts* buffer. If *Level* is 1, *pPorts* receives an array of [**PORT\_INFO\_1**](port-info-1.md) structures. If *Level* is 2, *pPorts* receives an array of [**PORT\_INFO\_2**](port-info-2.md) structures.
 * @param {Integer} pPort 
 * @param {Integer} cbBuf The size, in bytes, of the buffer pointed to by *pPorts*.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a variable that receives the number of bytes copied to the *pPorts* buffer. If the buffer is too small, the function fails and the variable receives the number of bytes required.
 * @param {Pointer<Integer>} pcReturned A pointer to a variable that receives the number of [**PORT\_INFO\_1**](port-info-1.md) or [**PORT\_INFO\_2**](port-info-2.md) structures returned in the *pPorts* buffer. This is the number of printer ports that are available on the specified server.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/enumports
 */
export EnumPortsW(pName, Level, pPort, cbBuf, pcbNeeded, pcReturned) {
    pName := pName is String ? StrPtr(pName) : pName

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"
    pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\EnumPortsW", "ptr", pName, "uint", Level, "ptr", pPort, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, pcReturnedMarshal, pcReturned, BOOL)
    return result
}

/**
 * The AddPort function adds the name of a port to the list of supported ports. The AddPort function is exported by the port monitor.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **AddPort** function browses the network to find existing ports, and displays a dialog box for the user. The **AddPort** function should validate the port name entered by the user by calling [**EnumPorts**](enumports.md) to ensure that no duplicate names exist.
 * 
 * The caller of the **AddPort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
 * 
 * To add a port without displaying a dialog box, call the **XcvData** function instead of **AddPort**. For more information about **XcvData**, see the Microsoft Windows Driver Development Kit (DDK).
 * @param {PSTR} pName A pointer to a zero-terminated string that specifies the name of the server to which the port is connected. If this parameter is **NULL**, the port is local.
 * @param {HWND} _hWnd A handle to the parent window of the **AddPort** dialog box.
 * @param {PSTR} pMonitorName A pointer to a zero-terminated string that specifies the monitor associated with the port.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addport
 */
export AddPortA(pName, _hWnd, pMonitorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName

    A_LastError := 0

    result := DllCall("winspool.drv\AddPortA", "ptr", pName, HWND, _hWnd, "ptr", pMonitorName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddPort function adds the name of a port to the list of supported ports. The AddPort function is exported by the port monitor.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **AddPort** function browses the network to find existing ports, and displays a dialog box for the user. The **AddPort** function should validate the port name entered by the user by calling [**EnumPorts**](enumports.md) to ensure that no duplicate names exist.
 * 
 * The caller of the **AddPort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
 * 
 * To add a port without displaying a dialog box, call the **XcvData** function instead of **AddPort**. For more information about **XcvData**, see the Microsoft Windows Driver Development Kit (DDK).
 * @param {PWSTR} pName A pointer to a zero-terminated string that specifies the name of the server to which the port is connected. If this parameter is **NULL**, the port is local.
 * @param {HWND} _hWnd A handle to the parent window of the **AddPort** dialog box.
 * @param {PWSTR} pMonitorName A pointer to a zero-terminated string that specifies the monitor associated with the port.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addport
 */
export AddPortW(pName, _hWnd, pMonitorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pMonitorName := pMonitorName is String ? StrPtr(pMonitorName) : pMonitorName

    A_LastError := 0

    result := DllCall("winspool.drv\AddPortW", "ptr", pName, HWND, _hWnd, "ptr", pMonitorName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The ConfigurePort function displays the port-configuration dialog box for a port on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * Before calling the **ConfigurePort** function, an application should call the [**EnumPorts**](enumports.md) function to determine valid port names.
 * @param {PSTR} pName Pointer to a null-terminated string that specifies the name of the server on which the specified port exists. If this parameter is **NULL**, the port is local.
 * @param {HWND} _hWnd Handle to the parent window of the port-configuration dialog box.
 * @param {PSTR} pPortName Pointer to a null-terminated string that specifies the name of the port to be configured.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/configureport
 */
export ConfigurePortA(pName, _hWnd, pPortName) {
    pName := pName is String ? StrPtr(pName) : pName
    pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

    result := DllCall("winspool.drv\ConfigurePortA", "ptr", pName, HWND, _hWnd, "ptr", pPortName, BOOL)
    return result
}

/**
 * The ConfigurePort function displays the port-configuration dialog box for a port on the specified server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * Before calling the **ConfigurePort** function, an application should call the [**EnumPorts**](enumports.md) function to determine valid port names.
 * @param {PWSTR} pName Pointer to a null-terminated string that specifies the name of the server on which the specified port exists. If this parameter is **NULL**, the port is local.
 * @param {HWND} _hWnd Handle to the parent window of the port-configuration dialog box.
 * @param {PWSTR} pPortName Pointer to a null-terminated string that specifies the name of the port to be configured.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/configureport
 */
export ConfigurePortW(pName, _hWnd, pPortName) {
    pName := pName is String ? StrPtr(pName) : pName
    pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

    result := DllCall("winspool.drv\ConfigurePortW", "ptr", pName, HWND, _hWnd, "ptr", pPortName, BOOL)
    return result
}

/**
 * The DeletePort function displays a dialog box that allows the user to delete a port name.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * An application can retrieve the names of valid ports by calling the [**EnumPorts**](enumports.md) function.
 * 
 * The **DeletePort** function returns an error if a printer is currently connected to the specified port.
 * 
 * The caller of the **DeletePort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
 * @param {PSTR} pName A pointer to a zero-terminated string that specifies the name of the server for which the port should be deleted. If this parameter is **NULL**, a local port is deleted.
 * @param {HWND} _hWnd A handle to the parent window of the port-deletion dialog box.
 * @param {PSTR} pPortName A pointer to a zero-terminated string that specifies the name of the port that should be deleted.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteport
 */
export DeletePortA(pName, _hWnd, pPortName) {
    pName := pName is String ? StrPtr(pName) : pName
    pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

    A_LastError := 0

    result := DllCall("winspool.drv\DeletePortA", "ptr", pName, HWND, _hWnd, "ptr", pPortName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The DeletePort function displays a dialog box that allows the user to delete a port name.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * An application can retrieve the names of valid ports by calling the [**EnumPorts**](enumports.md) function.
 * 
 * The **DeletePort** function returns an error if a printer is currently connected to the specified port.
 * 
 * The caller of the **DeletePort** function must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
 * @param {PWSTR} pName A pointer to a zero-terminated string that specifies the name of the server for which the port should be deleted. If this parameter is **NULL**, a local port is deleted.
 * @param {HWND} _hWnd A handle to the parent window of the port-deletion dialog box.
 * @param {PWSTR} pPortName A pointer to a zero-terminated string that specifies the name of the port that should be deleted.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteport
 */
export DeletePortW(pName, _hWnd, pPortName) {
    pName := pName is String ? StrPtr(pName) : pName
    pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

    A_LastError := 0

    result := DllCall("winspool.drv\DeletePortW", "ptr", pName, HWND, _hWnd, "ptr", pPortName, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {HANDLE} hXcv 
 * @param {PWSTR} pszDataName 
 * @param {Integer} pInputData 
 * @param {Integer} cbInputData 
 * @param {Integer} pOutputData 
 * @param {Integer} cbOutputData 
 * @param {Pointer<Integer>} pcbOutputNeeded 
 * @param {Pointer<Integer>} pdwStatus 
 * @returns {BOOL} 
 */
export XcvDataW(hXcv, pszDataName, pInputData, cbInputData, pOutputData, cbOutputData, pcbOutputNeeded, pdwStatus) {
    pszDataName := pszDataName is String ? StrPtr(pszDataName) : pszDataName

    pcbOutputNeededMarshal := pcbOutputNeeded is VarRef ? "uint*" : "ptr"
    pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\XcvDataW", HANDLE, hXcv, "ptr", pszDataName, "ptr", pInputData, "uint", cbInputData, "ptr", pOutputData, "uint", cbOutputData, pcbOutputNeededMarshal, pcbOutputNeeded, pdwStatusMarshal, pdwStatus, BOOL)
    return result
}

/**
 * The GetDefaultPrinter function retrieves the printer name of the default printer for the current user on the local computer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pszBuffer A pointer to a buffer that receives a null-terminated character string containing the default printer name. If this parameter is **NULL**, the function fails and the variable pointed to by *pcchBuffer* returns the required buffer size, in characters.
 * @param {Pointer<Integer>} pcchBuffer On input, specifies the size, in characters, of the *pszBuffer* buffer. On output, receives the size, in characters, of the printer name string, including the terminating null character.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value and the variable pointed to by *pcchBuffer* contains the number of characters copied to the *pszBuffer* buffer, including the terminating null character.
 * 
 * If the function fails, the return value is zero.
 * 
 * 
 * 
 * | Value                       | Meaning                                                                                                                        |
 * |-----------------------------|--------------------------------------------------------------------------------------------------------------------------------|
 * | ERROR\_INSUFFICIENT\_BUFFER | The *pszBuffer* buffer is too small. The variable pointed to by *pcchBuffer* contains the required buffer size, in characters. |
 * | ERROR\_FILE\_NOT\_FOUND     | There is no default printer.                                                                                                   |
 * @see https://learn.microsoft.com/windows/win32/printdocs/getdefaultprinter
 */
export GetDefaultPrinterA(pszBuffer, pcchBuffer) {
    pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

    pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetDefaultPrinterA", "ptr", pszBuffer, pcchBufferMarshal, pcchBuffer, BOOL)
    return result
}

/**
 * The GetDefaultPrinter function retrieves the printer name of the default printer for the current user on the local computer.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pszBuffer A pointer to a buffer that receives a null-terminated character string containing the default printer name. If this parameter is **NULL**, the function fails and the variable pointed to by *pcchBuffer* returns the required buffer size, in characters.
 * @param {Pointer<Integer>} pcchBuffer On input, specifies the size, in characters, of the *pszBuffer* buffer. On output, receives the size, in characters, of the printer name string, including the terminating null character.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value and the variable pointed to by *pcchBuffer* contains the number of characters copied to the *pszBuffer* buffer, including the terminating null character.
 * 
 * If the function fails, the return value is zero.
 * 
 * 
 * 
 * | Value                       | Meaning                                                                                                                        |
 * |-----------------------------|--------------------------------------------------------------------------------------------------------------------------------|
 * | ERROR\_INSUFFICIENT\_BUFFER | The *pszBuffer* buffer is too small. The variable pointed to by *pcchBuffer* contains the required buffer size, in characters. |
 * | ERROR\_FILE\_NOT\_FOUND     | There is no default printer.                                                                                                   |
 * @see https://learn.microsoft.com/windows/win32/printdocs/getdefaultprinter
 */
export GetDefaultPrinterW(pszBuffer, pcchBuffer) {
    pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

    pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetDefaultPrinterW", "ptr", pszBuffer, pcchBufferMarshal, pcchBuffer, BOOL)
    return result
}

/**
 * The SetDefaultPrinter function sets the printer name of the default printer for the current user on the local computer.
 * @remarks
 * When using this method, you must specify a valid printer, driver, and port. If they are invalid, the APIs do not fail but the result is not defined. This could cause other programs to set the printer back to the previous valid printer. You can use [**EnumPrinters**](enumprinters.md) to retrieve the printer name, driver name, and port name of all available printers.
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pszPrinter A pointer to a null-terminated string containing the default printer name. For a remote printer connection, the name format is **\\\\***server***\\***printername*. For a local printer, the name format is *printername*.
 * 
 * If this parameter is **NULL** or an empty string, that is, "", **SetDefaultPrinter** will select a default printer from one of the installed printers. If a default printer already exists, calling **SetDefaultPrinter** with a **NULL** or an empty string in this parameter might change the default printer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setdefaultprinter
 */
export SetDefaultPrinterA(pszPrinter) {
    pszPrinter := pszPrinter is String ? StrPtr(pszPrinter) : pszPrinter

    result := DllCall("winspool.drv\SetDefaultPrinterA", "ptr", pszPrinter, BOOL)
    return result
}

/**
 * The SetDefaultPrinter function sets the printer name of the default printer for the current user on the local computer.
 * @remarks
 * When using this method, you must specify a valid printer, driver, and port. If they are invalid, the APIs do not fail but the result is not defined. This could cause other programs to set the printer back to the previous valid printer. You can use [**EnumPrinters**](enumprinters.md) to retrieve the printer name, driver name, and port name of all available printers.
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pszPrinter A pointer to a null-terminated string containing the default printer name. For a remote printer connection, the name format is **\\\\***server***\\***printername*. For a local printer, the name format is *printername*.
 * 
 * If this parameter is **NULL** or an empty string, that is, "", **SetDefaultPrinter** will select a default printer from one of the installed printers. If a default printer already exists, calling **SetDefaultPrinter** with a **NULL** or an empty string in this parameter might change the default printer.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setdefaultprinter
 */
export SetDefaultPrinterW(pszPrinter) {
    pszPrinter := pszPrinter is String ? StrPtr(pszPrinter) : pszPrinter

    result := DllCall("winspool.drv\SetDefaultPrinterW", "ptr", pszPrinter, BOOL)
    return result
}

/**
 * The SetPort function sets the status associated with a printer port.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller of the **SetPort** function must be executing as an Administrator. Additionally, if the caller is a Port Monitor or Language Monitor, it must call [**RevertToSelf**](/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself) to cease impersonation before it calls **SetPort**.
 * 
 * All programs that call **SetPort** must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
 * 
 * When you set a printer port status value with the severity value PORT\_STATUS\_TYPE\_ERROR, the print spooler stops sending jobs to the port. The print spooler resumes sending jobs to the port when the port status is cleared by another call to **SetPort**.
 * @param {PSTR} pName Pointer to a zero-terminated string that specifies the name of the printer server to which the port is connected. Set this parameter to **NULL** if the port is on the local machine.
 * @param {PSTR} pPortName Pointer to a zero-terminated string that specifies the name of the printer port.
 * @param {Integer} dwLevel Specifies the type of structure pointed to by the *pPortInfo* parameter.
 * 
 * This value must be 3, which corresponds to a [**PORT\_INFO\_3**](port-info-3.md) data structure.
 * @param {Pointer<Integer>} pPortInfo Pointer to a [**PORT\_INFO\_3**](port-info-3.md) structure that contains the port status information to set.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setport
 */
export SetPortA(pName, pPortName, dwLevel, pPortInfo) {
    pName := pName is String ? StrPtr(pName) : pName
    pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

    pPortInfoMarshal := pPortInfo is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\SetPortA", "ptr", pName, "ptr", pPortName, "uint", dwLevel, pPortInfoMarshal, pPortInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The SetPort function sets the status associated with a printer port.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The caller of the **SetPort** function must be executing as an Administrator. Additionally, if the caller is a Port Monitor or Language Monitor, it must call [**RevertToSelf**](/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself) to cease impersonation before it calls **SetPort**.
 * 
 * All programs that call **SetPort** must have SERVER\_ACCESS\_ADMINISTER access to the server to which the port is connected.
 * 
 * When you set a printer port status value with the severity value PORT\_STATUS\_TYPE\_ERROR, the print spooler stops sending jobs to the port. The print spooler resumes sending jobs to the port when the port status is cleared by another call to **SetPort**.
 * @param {PWSTR} pName Pointer to a zero-terminated string that specifies the name of the printer server to which the port is connected. Set this parameter to **NULL** if the port is on the local machine.
 * @param {PWSTR} pPortName Pointer to a zero-terminated string that specifies the name of the printer port.
 * @param {Integer} dwLevel Specifies the type of structure pointed to by the *pPortInfo* parameter.
 * 
 * This value must be 3, which corresponds to a [**PORT\_INFO\_3**](port-info-3.md) data structure.
 * @param {Pointer<Integer>} pPortInfo Pointer to a [**PORT\_INFO\_3**](port-info-3.md) structure that contains the port status information to set.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/setport
 */
export SetPortW(pName, pPortName, dwLevel, pPortInfo) {
    pName := pName is String ? StrPtr(pName) : pName
    pPortName := pPortName is String ? StrPtr(pPortName) : pPortName

    pPortInfoMarshal := pPortInfo is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("winspool.drv\SetPortW", "ptr", pName, "ptr", pPortName, "uint", dwLevel, pPortInfoMarshal, pPortInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The AddPrinterConnection function adds a connection to the specified printer for the current user.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * When Windows makes a connection to a printer, it may need to copy printer driver files to the server to which the printer is attached. If the user does not have permission to copy files to the appropriate location, the **AddPrinterConnection** function fails, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_ACCESS\_DENIED.
 * 
 * A printer connection established by calling **AddPrinterConnection** will be enumerated when [**EnumPrinters**](enumprinters.md) is called with *dwType* set to PRINTER\_ENUM\_CONNECTION.
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of a printer to which the current user wishes to establish a connection.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection
 */
export AddPrinterConnectionA(pName) {
    pName := pName is String ? StrPtr(pName) : pName

    result := DllCall("winspool.drv\AddPrinterConnectionA", "ptr", pName, BOOL)
    return result
}

/**
 * The AddPrinterConnection function adds a connection to the specified printer for the current user.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * When Windows makes a connection to a printer, it may need to copy printer driver files to the server to which the printer is attached. If the user does not have permission to copy files to the appropriate location, the **AddPrinterConnection** function fails, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_ACCESS\_DENIED.
 * 
 * A printer connection established by calling **AddPrinterConnection** will be enumerated when [**EnumPrinters**](enumprinters.md) is called with *dwType* set to PRINTER\_ENUM\_CONNECTION.
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of a printer to which the current user wishes to establish a connection.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection
 */
export AddPrinterConnectionW(pName) {
    pName := pName is String ? StrPtr(pName) : pName

    result := DllCall("winspool.drv\AddPrinterConnectionW", "ptr", pName, BOOL)
    return result
}

/**
 * The DeletePrinterConnection function deletes a connection to a printer that was established by a call to AddPrinterConnection or ConnectToPrinterDlg.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **DeletePrinterConnection** function does not delete any printer driver files that were copied to the server to which the printer is attached.
 * @param {PSTR} pName Pointer to a null-terminated string that specifies the name of the printer connection to delete.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterconnection
 */
export DeletePrinterConnectionA(pName) {
    pName := pName is String ? StrPtr(pName) : pName

    result := DllCall("winspool.drv\DeletePrinterConnectionA", "ptr", pName, BOOL)
    return result
}

/**
 * The DeletePrinterConnection function deletes a connection to a printer that was established by a call to AddPrinterConnection or ConnectToPrinterDlg.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **DeletePrinterConnection** function does not delete any printer driver files that were copied to the server to which the printer is attached.
 * @param {PWSTR} pName Pointer to a null-terminated string that specifies the name of the printer connection to delete.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterconnection
 */
export DeletePrinterConnectionW(pName) {
    pName := pName is String ? StrPtr(pName) : pName

    result := DllCall("winspool.drv\DeletePrinterConnectionW", "ptr", pName, BOOL)
    return result
}

/**
 * The ConnectToPrinterDlg function displays a dialog box that lets users browse and connect to printers on a network.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The **ConnectToPrinterDlg** function attempts to create a connection to the selected printer. However, if the server on which the printer resides does not have a suitable driver installed, the function offers the user the option of creating a printer locally. A calling application can determine whether the function has created a printer locally by calling [**GetPrinter**](getprinter.md) with a [**PRINTER\_INFO\_2**](printer-info-2.md) structure, then examining that structure's **Attributes** member.
 * 
 * An application should call [**DeletePrinter**](deleteprinter.md) to delete a local printer. An application should call [**DeletePrinterConnection**](deleteprinterconnection.md) to delete a connection to a printer.
 * @param {HWND} _hwnd Specifies the parent window of the dialog box.
 * @param {Integer} Flags This parameter is reserved and must be zero.
 * @returns {HANDLE} If the function succeeds and the user selects a printer, the return value is a handle to the selected printer.
 * 
 * If the function fails, or the user cancels the dialog box without selecting a printer, the return value is **NULL**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/connecttoprinterdlg
 */
export ConnectToPrinterDlg(_hwnd, Flags) {
    result := DllCall("winspool.drv\ConnectToPrinterDlg", HWND, _hwnd, "uint", Flags, HANDLE.Owned)
    return result
}

/**
 * The AddPrintProvidor function installs a local print provider and links the configuration, data, and provider files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * Before an application calls the **AddPrintProvidor** function, all files required by the provider must be copied to the SYSTEM32 directory.
 * 
 * A provider added by **AddPrintProvidor** may be removed by calling [**DeletePrintProvidor**](deleteprintprovidor.md).
 * @param {PSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the provider should be installed. For systems that only support local installation of providers, this parameter should be **NULL**.
 * @param {Integer} Level The level of the structure to which *pProviderInfo* points. It can be one of the following.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                                                            |
 * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_1**](providor-info-1.md) structure.<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_2**](providor-info-2.md) structure.<br/> |
 * @param {Pointer<Integer>} pProvidorInfo 
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprovidor
 */
export AddPrintProvidorA(pName, Level, pProvidorInfo) {
    pName := pName is String ? StrPtr(pName) : pName

    pProvidorInfoMarshal := pProvidorInfo is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\AddPrintProvidorA", "ptr", pName, "uint", Level, pProvidorInfoMarshal, pProvidorInfo, BOOL)
    return result
}

/**
 * The AddPrintProvidor function installs a local print provider and links the configuration, data, and provider files.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * Before an application calls the **AddPrintProvidor** function, all files required by the provider must be copied to the SYSTEM32 directory.
 * 
 * A provider added by **AddPrintProvidor** may be removed by calling [**DeletePrintProvidor**](deleteprintprovidor.md).
 * @param {PWSTR} pName A pointer to a null-terminated string that specifies the name of the server on which the provider should be installed. For systems that only support local installation of providers, this parameter should be **NULL**.
 * @param {Integer} Level The level of the structure to which *pProviderInfo* points. It can be one of the following.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                                                            |
 * |------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_1**](providor-info-1.md) structure.<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | Function uses a [**PROVIDOR\_INFO\_2**](providor-info-2.md) structure.<br/> |
 * @param {Pointer<Integer>} pProvidorInfo 
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprintprovidor
 */
export AddPrintProvidorW(pName, Level, pProvidorInfo) {
    pName := pName is String ? StrPtr(pName) : pName

    pProvidorInfoMarshal := pProvidorInfo is VarRef ? "char*" : "ptr"

    result := DllCall("winspool.drv\AddPrintProvidorW", "ptr", pName, "uint", Level, pProvidorInfoMarshal, pProvidorInfo, BOOL)
    return result
}

/**
 * The DeletePrintProvidor function removes a print provider added by the AddPrintProvidor function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pName Reserved; must be **NULL**.
 * @param {PSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the provider is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the provider is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value because it provides maximum portability.
 * @param {PSTR} pPrintProvidorName 
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprovidor
 */
export DeletePrintProvidorA(pName, pEnvironment, pPrintProvidorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pPrintProvidorName := pPrintProvidorName is String ? StrPtr(pPrintProvidorName) : pPrintProvidorName

    result := DllCall("winspool.drv\DeletePrintProvidorA", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProvidorName, BOOL)
    return result
}

/**
 * The DeletePrintProvidor function removes a print provider added by the AddPrintProvidor function.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pName Reserved; must be **NULL**.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment from which the provider is to be removed (for example, Windows NT x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the provider is removed from the current environment of the calling application and client machine (not of the destination application and print server). **NULL** is the recommended value because it provides maximum portability.
 * @param {PWSTR} pPrintProvidorName 
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero.
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprintprovidor
 */
export DeletePrintProvidorW(pName, pEnvironment, pPrintProvidorName) {
    pName := pName is String ? StrPtr(pName) : pName
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment
    pPrintProvidorName := pPrintProvidorName is String ? StrPtr(pPrintProvidorName) : pPrintProvidorName

    result := DllCall("winspool.drv\DeletePrintProvidorW", "ptr", pName, "ptr", pEnvironment, "ptr", pPrintProvidorName, BOOL)
    return result
}

/**
 * The IsValidDevmode function verifies that the contents of a DEVMODE structure are valid.
 * @remarks
 * No private printer driver fields of the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) are checked, only the public fields.
 * 
 * Callers should use **dmSize**+**dmDriverExtra** for **DevmodeSize** only if they can guarantee that the input buffer size is at least that big. Since the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is generally untrusted data, the values that are in the input buffer at the **dmSize** and **dmDriverExtra** offsets are also untrusted.
 * 
 * This function is executable in Least-Privileged User Account (LUA) context.
 * @param {Pointer<DEVMODEA>} pDevmode A pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) to validate.
 * @param {Pointer} DevmodeSize The size in bytes of the input byte buffer.
 * @returns {BOOL} **TRUE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is structurally valid. If minor errors are found the function will fix them and return **TRUE**.
 * 
 * **FALSE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) has one or more significant structural problems. For example, its **dmSize** member is misaligned or specifies a buffer that is too small. Also, **FALSE** if **pDevmode** is **NULL**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/isvaliddevmode
 */
export IsValidDevmodeA(pDevmode, DevmodeSize) {
    result := DllCall("winspool.drv\IsValidDevmodeA", DEVMODEA.Ptr, pDevmode, "ptr", DevmodeSize, BOOL)
    return result
}

/**
 * The IsValidDevmode function verifies that the contents of a DEVMODE structure are valid.
 * @remarks
 * No private printer driver fields of the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) are checked, only the public fields.
 * 
 * Callers should use **dmSize**+**dmDriverExtra** for **DevmodeSize** only if they can guarantee that the input buffer size is at least that big. Since the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is generally untrusted data, the values that are in the input buffer at the **dmSize** and **dmDriverExtra** offsets are also untrusted.
 * 
 * This function is executable in Least-Privileged User Account (LUA) context.
 * @param {Pointer<DEVMODEW>} pDevmode A pointer to the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) to validate.
 * @param {Pointer} DevmodeSize The size in bytes of the input byte buffer.
 * @returns {BOOL} **TRUE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) is structurally valid. If minor errors are found the function will fix them and return **TRUE**.
 * 
 * **FALSE**, if the [**DEVMODE**](/windows/win32/api/wingdi/ns-wingdi-devmodea) has one or more significant structural problems. For example, its **dmSize** member is misaligned or specifies a buffer that is too small. Also, **FALSE** if **pDevmode** is **NULL**.
 * @see https://learn.microsoft.com/windows/win32/printdocs/isvaliddevmode
 */
export IsValidDevmodeW(pDevmode, DevmodeSize) {
    result := DllCall("winspool.drv\IsValidDevmodeW", DEVMODEW.Ptr, pDevmode, "ptr", DevmodeSize, BOOL)
    return result
}

/**
 * Retrieves a handle to the specified printer, print server, or other types of handles in the print subsystem, while setting some of the printer options.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The ANSI version of this function is not implemented and returns ERROR\_NOT\_SUPPORTED.
 * 
 * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
 * 
 * You can call the **OpenPrinter2** function to open a handle to a print server or to determine client access rights to a print server. To do this, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
 * 
 * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the necessary access rights. The access rights can be one of the following.
 * 
 * 
 * 
 * | Desired Access value                        | Meaning                                                                                                                                                                                      |
 * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
 * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
 * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except SYNCHRONIZE. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                         |
 * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
 * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
 * 
 * 
 * 
 *  
 * 
 * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter2** call will fail, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
 * 
 * When *pPrinterName* is a local printer, then **OpenPrinter2** ignores all values of the **dwFlags** that the [**PRINTER\_OPTIONS**](printer-options.md) structure pointed to using *pOptions*, except PRINTER\_OPTION\_CLIENT\_CHANGE. If the latter is passed, then **OpenPrinter2** will return ERROR\_ACCESS\_DENIED. Accordingly, when opening a local printer, **OpenPrinter2** provides no advantage over [**OpenPrinter**](openprinter.md).
 * 
 * **Windows Vista:** The printer data returned by **OpenPrinter2** is retrieved from a local cache unless the **PRINTER\_OPTION\_NO\_CACHE** flag is set in the **dwFlags** field of the [**PRINTER\_OPTIONS**](printer-options.md) structure referenced by *pOptions*.
 * @param {PSTR} pPrinterName A pointer to a constant null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
 * 
 * For a printer object, use: PrinterName,Job xxxx. For an XcvMonitor, use: ServerName,XcvMonitor MonitorName. For an XcvPort, use: ServerName,XcvPort PortName.
 * 
 * **Windows Vista:** If **NULL**, it indicates the local print server.
 * @param {Pointer<PRINTER_HANDLE>} phPrinter A pointer to a variable that receives a handle to the open printer or print server object.
 * @param {Pointer<PRINTER_DEFAULTSA>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
 * @param {Pointer<PRINTER_OPTIONSA>} pOptions A pointer to a [**PRINTER\_OPTIONS**](printer-options.md) structure. This value can be **NULL**.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. For extended error information, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter2
 */
export OpenPrinter2A(pPrinterName, phPrinter, pDefault, pOptions) {
    pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

    A_LastError := 0

    result := DllCall("winspool.drv\OpenPrinter2A", "ptr", pPrinterName, PRINTER_HANDLE.Ptr, phPrinter, PRINTER_DEFAULTSA.Ptr, pDefault, PRINTER_OPTIONSA.Ptr, pOptions, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a handle to the specified printer, print server, or other types of handles in the print subsystem, while setting some of the printer options.
 * @remarks
 * Do not call this method in [**DllMain**](/windows/desktop/Dlls/dllmain).
 * 
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The ANSI version of this function is not implemented and returns ERROR\_NOT\_SUPPORTED.
 * 
 * The *pDefault* parameter enables you to specify the data type and device mode values that are used for printing documents submitted by the [**StartDocPrinter**](startdocprinter.md) function. However, you can override these values by using the [**SetJob**](setjob.md) function after a document has been started.
 * 
 * You can call the **OpenPrinter2** function to open a handle to a print server or to determine client access rights to a print server. To do this, specify the name of the print server in the *pPrinterName* parameter, set the **pDatatype** and **pDevMode** members of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to **NULL**, and set the **DesiredAccess** member to specify a server access mask value such as SERVER\_ALL\_ACCESS. When you are finished with the handle, pass it to the [**ClosePrinter**](closeprinter.md) function to close it.
 * 
 * Use the **DesiredAccess** member of the [**PRINTER\_DEFAULTS**](printer-defaults.md) structure to specify the necessary access rights. The access rights can be one of the following.
 * 
 * 
 * 
 * | Desired Access value                        | Meaning                                                                                                                                                                                      |
 * |---------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | PRINTER\_ACCESS\_ADMINISTER                 | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md).                                                                                                 |
 * | PRINTER\_ACCESS\_USE                        | To perform basic printing operations.                                                                                                                                                        |
 * | PRINTER\_ALL\_ACCESS                        | To perform all administrative tasks and basic printing operations except SYNCHRONIZE. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                         |
 * | PRINTER\_ACCESS\_MANAGE\_LIMITED            | To perform administrative tasks, such as those provided by [**SetPrinter**](setprinter.md) and [**SetPrinterData**](setprinterdata.md). This value is available starting from Windows 8.1. |
 * | generic security values, such as WRITE\_DAC | To allow specific control access rights. See [Standard Access Rights](/windows/desktop/SecAuthZ/standard-access-rights).                                                                                      |
 * 
 * 
 * 
 *  
 * 
 * If a user does not have permission to open a specified printer or print server with the desired access, the **OpenPrinter2** call will fail, and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) will return the value ERROR\_ACCESS\_DENIED.
 * 
 * When *pPrinterName* is a local printer, then **OpenPrinter2** ignores all values of the **dwFlags** that the [**PRINTER\_OPTIONS**](printer-options.md) structure pointed to using *pOptions*, except PRINTER\_OPTION\_CLIENT\_CHANGE. If the latter is passed, then **OpenPrinter2** will return ERROR\_ACCESS\_DENIED. Accordingly, when opening a local printer, **OpenPrinter2** provides no advantage over [**OpenPrinter**](openprinter.md).
 * 
 * **Windows Vista:** The printer data returned by **OpenPrinter2** is retrieved from a local cache unless the **PRINTER\_OPTION\_NO\_CACHE** flag is set in the **dwFlags** field of the [**PRINTER\_OPTIONS**](printer-options.md) structure referenced by *pOptions*.
 * @param {PWSTR} pPrinterName A pointer to a constant null-terminated string that specifies the name of the printer or print server, the printer object, the XcvMonitor, or the XcvPort.
 * 
 * For a printer object, use: PrinterName,Job xxxx. For an XcvMonitor, use: ServerName,XcvMonitor MonitorName. For an XcvPort, use: ServerName,XcvPort PortName.
 * 
 * **Windows Vista:** If **NULL**, it indicates the local print server.
 * @param {Pointer<PRINTER_HANDLE>} phPrinter A pointer to a variable that receives a handle to the open printer or print server object.
 * @param {Pointer<PRINTER_DEFAULTSW>} pDefault A pointer to a [**PRINTER\_DEFAULTS**](printer-defaults.md) structure. This value can be **NULL**.
 * @param {Pointer<PRINTER_OPTIONSW>} pOptions A pointer to a [**PRINTER\_OPTIONS**](printer-options.md) structure. This value can be **NULL**.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. For extended error information, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/printdocs/openprinter2
 */
export OpenPrinter2W(pPrinterName, phPrinter, pDefault, pOptions) {
    pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

    A_LastError := 0

    result := DllCall("winspool.drv\OpenPrinter2W", "ptr", pPrinterName, PRINTER_HANDLE.Ptr, phPrinter, PRINTER_DEFAULTSW.Ptr, pDefault, PRINTER_OPTIONSW.Ptr, pOptions, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {HWND} _hWnd 
 * @param {PSTR} pszName 
 * @param {Integer} dwLevel 
 * @param {Pointer<Void>} pConnectionInfo 
 * @returns {BOOL} 
 */
export AddPrinterConnection2A(_hWnd, pszName, dwLevel, pConnectionInfo) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    pConnectionInfoMarshal := pConnectionInfo is VarRef ? "ptr" : "ptr"

    result := DllCall("winspool.drv\AddPrinterConnection2A", HWND, _hWnd, "ptr", pszName, "uint", dwLevel, pConnectionInfoMarshal, pConnectionInfo, BOOL)
    return result
}

/**
 * Adds a connection to the specified printer for the current user and specifies connection details.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * When Windows Vista makes a connection to a printer, it may need to copy printer driver files from the server to which the printer is attached. If the user does not have permission to copy files to the appropriate location, the **AddPrinterConnection2** function fails and [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns ERROR\_ACCESS\_DENIED.
 * 
 * If the printer driver files must be copied from the print server but cannot be copied silently due to the group policies that are in effect and PRINTER\_CONNECTION\_NO\_UI is set in *pConnectionInfo->dwFlags*, no dialog boxes will be displayed and the call will fail.
 * 
 * If the local printer driver can be used to render print jobs for this printer and the version of the local driver must not match the version of the printer driver on the server, set PRINTER\_CONNECTION\_MISMATCH in *pConnectionInfo->dwFlags* and assign the pointer to a string variable that contains the path to the local printer driver to *pConnectionInfo->pszDriverName*.
 * 
 * A printer connection that is established by calling **AddPrinterConnection2** will be enumerated when [**EnumPrinters**](enumprinters.md) is called with *dwType* set to PRINTER\_ENUM\_CONNECTION.
 * 
 * The ANSI version of this function, **AddPrinterConnection2A**, is not supported and returns **ERROR\_NOT\_SUPPORTED**.
 * @param {HWND} _hWnd A handle to the parent window in which the dialog box will be displayed if the print system must download a printer driver from the print server for this connection.
 * @param {PWSTR} pszName A pointer to a constant null-terminated string specifying the name of the printer to which the current user wishes to connect.
 * @param {Integer} dwLevel The version of the structure pointed to by *pConnectionInfo*. Currently, only level 1 is defined so the value of *dwLevel* must be 1.
 * @param {Pointer<Void>} pConnectionInfo A pointer to a [**PRINTER\_CONNECTION\_INFO\_1**](printer-connection-info-1.md) structure. See the Remarks section for more about this parameter.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. For extended error information, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/printdocs/addprinterconnection2
 */
export AddPrinterConnection2W(_hWnd, pszName, dwLevel, pConnectionInfo) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    pConnectionInfoMarshal := pConnectionInfo is VarRef ? "ptr" : "ptr"

    result := DllCall("winspool.drv\AddPrinterConnection2W", HWND, _hWnd, "ptr", pszName, "uint", dwLevel, pConnectionInfoMarshal, pConnectionInfo, BOOL)
    return result
}

/**
 * Installs a printer driver from a driver package that is in the print servers driver store.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
 * 
 * **InstallPrinterDriverFromPackage** also installs other files in the package, such as color profiles and print processors.
 * 
 * Users must have printer administration rights to install either on a remote computer or on the local computer when the user is logged in with Terminal Services.
 * 
 * Only signed packages can be installed on a remote computer.
 * @param {PSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. **NULL** means the local computer.
 * @param {PSTR} pszInfPath A pointer to a constant, null-terminated string that specifies the driver store path to the print driver's .inf file. **NULL** means the driver is in an inf file that shipped with Windows.
 * @param {PSTR} pszDriverName A pointer to a constant, null-terminated string that specifies the name of the driver.
 * @param {PSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {Integer} dwFlags This can only be 0 or IPDFP\_COPY\_ALL\_FILES. A value of 0 means that the printer driver must be added and any files in the printer driver directory that are newer than corresponding files currently in use must be copied. A value of IPDFP\_COPY\_ALL\_FILES means the printer driver and all the files in the printer driver directory must be added. The file time stamps are ignored when *dwFlags* has a value of IPDFP\_COPY\_ALL\_FILES.
 * @returns {HRESULT} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/installprinterdriverfrompackage
 */
export InstallPrinterDriverFromPackageA(pszServer, pszInfPath, pszDriverName, pszEnvironment, dwFlags) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
    pszDriverName := pszDriverName is String ? StrPtr(pszDriverName) : pszDriverName
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

    result := DllCall("winspool.drv\InstallPrinterDriverFromPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszDriverName, "ptr", pszEnvironment, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Installs a printer driver from a driver package that is in the print servers driver store.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
 * 
 * **InstallPrinterDriverFromPackage** also installs other files in the package, such as color profiles and print processors.
 * 
 * Users must have printer administration rights to install either on a remote computer or on the local computer when the user is logged in with Terminal Services.
 * 
 * Only signed packages can be installed on a remote computer.
 * @param {PWSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. **NULL** means the local computer.
 * @param {PWSTR} pszInfPath A pointer to a constant, null-terminated string that specifies the driver store path to the print driver's .inf file. **NULL** means the driver is in an inf file that shipped with Windows.
 * @param {PWSTR} pszDriverName A pointer to a constant, null-terminated string that specifies the name of the driver.
 * @param {PWSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {Integer} dwFlags This can only be 0 or IPDFP\_COPY\_ALL\_FILES. A value of 0 means that the printer driver must be added and any files in the printer driver directory that are newer than corresponding files currently in use must be copied. A value of IPDFP\_COPY\_ALL\_FILES means the printer driver and all the files in the printer driver directory must be added. The file time stamps are ignored when *dwFlags* has a value of IPDFP\_COPY\_ALL\_FILES.
 * @returns {HRESULT} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/installprinterdriverfrompackage
 */
export InstallPrinterDriverFromPackageW(pszServer, pszInfPath, pszDriverName, pszEnvironment, dwFlags) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
    pszDriverName := pszDriverName is String ? StrPtr(pszDriverName) : pszDriverName
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

    result := DllCall("winspool.drv\InstallPrinterDriverFromPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszDriverName, "ptr", pszEnvironment, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Uploads a printer driver to the print servers driver store so that it can be installed by calling InstallPrinterDriverFromPackage.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
 * 
 * Only one package at a time can be uploaded. If a package is dependent on others, they must be uploaded separately.
 * 
 * Only signed driver packages can be uploaded.
 * @param {PSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** if the server is the local computer.
 * @param {PSTR} pszInfPath A pointer to a constant ,null-terminated string that specifies the source path to the driver's .inf file.
 * @param {PSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the server's processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {Integer} dwFlags This can be any of the following values:
 * 
 * 
 * 
 * | Value                                                                                                                                                                                     | Meaning                                                                                                                                                            |
 * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="UPDP_SILENT_UPLOAD"></span><span id="updp_silent_upload"></span><dl> <dt>**UPDP_SILENT_UPLOAD**</dt> </dl>             | The UI will not be shown during the upload.<br/>                                                                                                             |
 * | <span id="UPDP_UPLOAD_ALWAYS"></span><span id="updp_upload_always"></span><dl> <dt>**UPDP_UPLOAD_ALWAYS**</dt> </dl>             | The files will be uploaded even if the package is already in the server's driver store.<br/>                                                                 |
 * | <span id="UPDP_CHECK_DRIVERSTORE"></span><span id="updp_check_driverstore"></span><dl> <dt>**UPDP_CHECK_DRIVERSTORE**</dt> </dl> | The server's driver store will be checked before upload to see if the package is already there. This setting is ignored if UPDP_UPLOAD_ALWAYS is set.<br/> |
 * @param {HWND} _hwnd A handle to the copying user interface.
 * @param {PSTR} pszDestInfPath A pointer to the destination path, in the driver store, to which the driver's .inf file was copied.
 * @param {Pointer<Integer>} pcchDestInfPath On input, specifies the size, in characters, of the *pszDestInfPath* buffer. On output, receives the size, in characters, of the path string, including the terminating null character.
 * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/uploadprinterdriverpackage
 */
export UploadPrinterDriverPackageA(pszServer, pszInfPath, pszEnvironment, dwFlags, _hwnd, pszDestInfPath, pcchDestInfPath) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
    pszDestInfPath := pszDestInfPath is String ? StrPtr(pszDestInfPath) : pszDestInfPath

    pcchDestInfPathMarshal := pcchDestInfPath is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\UploadPrinterDriverPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "uint", dwFlags, HWND, _hwnd, "ptr", pszDestInfPath, pcchDestInfPathMarshal, pcchDestInfPath, "HRESULT")
    return result
}

/**
 * Uploads a printer driver to the print servers driver store so that it can be installed by calling InstallPrinterDriverFromPackage.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The driver store is typically either %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
 * 
 * Only one package at a time can be uploaded. If a package is dependent on others, they must be uploaded separately.
 * 
 * Only signed driver packages can be uploaded.
 * @param {PWSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** if the server is the local computer.
 * @param {PWSTR} pszInfPath A pointer to a constant ,null-terminated string that specifies the source path to the driver's .inf file.
 * @param {PWSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the server's processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {Integer} dwFlags This can be any of the following values:
 * 
 * 
 * 
 * | Value                                                                                                                                                                                     | Meaning                                                                                                                                                            |
 * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | <span id="UPDP_SILENT_UPLOAD"></span><span id="updp_silent_upload"></span><dl> <dt>**UPDP_SILENT_UPLOAD**</dt> </dl>             | The UI will not be shown during the upload.<br/>                                                                                                             |
 * | <span id="UPDP_UPLOAD_ALWAYS"></span><span id="updp_upload_always"></span><dl> <dt>**UPDP_UPLOAD_ALWAYS**</dt> </dl>             | The files will be uploaded even if the package is already in the server's driver store.<br/>                                                                 |
 * | <span id="UPDP_CHECK_DRIVERSTORE"></span><span id="updp_check_driverstore"></span><dl> <dt>**UPDP_CHECK_DRIVERSTORE**</dt> </dl> | The server's driver store will be checked before upload to see if the package is already there. This setting is ignored if UPDP_UPLOAD_ALWAYS is set.<br/> |
 * @param {HWND} _hwnd A handle to the copying user interface.
 * @param {PWSTR} pszDestInfPath A pointer to the destination path, in the driver store, to which the driver's .inf file was copied.
 * @param {Pointer<Integer>} pcchDestInfPath On input, specifies the size, in characters, of the *pszDestInfPath* buffer. On output, receives the size, in characters, of the path string, including the terminating null character.
 * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/uploadprinterdriverpackage
 */
export UploadPrinterDriverPackageW(pszServer, pszInfPath, pszEnvironment, dwFlags, _hwnd, pszDestInfPath, pcchDestInfPath) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
    pszDestInfPath := pszDestInfPath is String ? StrPtr(pszDestInfPath) : pszDestInfPath

    pcchDestInfPathMarshal := pcchDestInfPath is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\UploadPrinterDriverPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "uint", dwFlags, HWND, _hwnd, "ptr", pszDestInfPath, pcchDestInfPathMarshal, pcchDestInfPath, "HRESULT")
    return result
}

/**
 * Retrieves GUID, version, and date of the specified core printer drivers and the path to their packages.
 * @remarks
 * This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
 * @param {PSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {PSTR} pszzCoreDriverDependencies A pointer to a null-terminated multi-string that specifies the GUIDs of the core printer drivers.
 * @param {Integer} cCorePrinterDrivers The number of strings in *pszzCoreDriverDependencies*.
 * @param {Pointer<CORE_PRINTER_DRIVERA>} pCorePrinterDrivers A pointer to an array of one or more [**CORE\_PRINTER\_DRIVER**](core-printer-driver.md) structures.
 * @returns {HRESULT} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/getcoreprinterdrivers
 */
export GetCorePrinterDriversA(pszServer, pszEnvironment, pszzCoreDriverDependencies, cCorePrinterDrivers, pCorePrinterDrivers) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
    pszzCoreDriverDependencies := pszzCoreDriverDependencies is String ? StrPtr(pszzCoreDriverDependencies) : pszzCoreDriverDependencies

    result := DllCall("winspool.drv\GetCorePrinterDriversA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszzCoreDriverDependencies, "uint", cCorePrinterDrivers, CORE_PRINTER_DRIVERA.Ptr, pCorePrinterDrivers, "HRESULT")
    return result
}

/**
 * Retrieves GUID, version, and date of the specified core printer drivers and the path to their packages.
 * @remarks
 * This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
 * @param {PWSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {PWSTR} pszzCoreDriverDependencies A pointer to a null-terminated multi-string that specifies the GUIDs of the core printer drivers.
 * @param {Integer} cCorePrinterDrivers The number of strings in *pszzCoreDriverDependencies*.
 * @param {Pointer<CORE_PRINTER_DRIVERW>} pCorePrinterDrivers A pointer to an array of one or more [**CORE\_PRINTER\_DRIVER**](core-printer-driver.md) structures.
 * @returns {HRESULT} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/getcoreprinterdrivers
 */
export GetCorePrinterDriversW(pszServer, pszEnvironment, pszzCoreDriverDependencies, cCorePrinterDrivers, pCorePrinterDrivers) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
    pszzCoreDriverDependencies := pszzCoreDriverDependencies is String ? StrPtr(pszzCoreDriverDependencies) : pszzCoreDriverDependencies

    result := DllCall("winspool.drv\GetCorePrinterDriversW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszzCoreDriverDependencies, "uint", cCorePrinterDrivers, CORE_PRINTER_DRIVERW.Ptr, pCorePrinterDrivers, "HRESULT")
    return result
}

/**
 * The CorePrinterDriverInstalled function reports whether a core printer driver with a specified GUID, date, and version is installed.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PSTR} pszServer Pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
 * @param {PSTR} pszEnvironment Pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {Guid} CoreDriverGUID The GUID of the core printer driver.
 * @param {FILETIME} ftDriverDate The date of the core printer driver.
 * @param {Integer} dwlDriverVersion The version of the core printer driver.
 * @returns {BOOL} A pointer to **TRUE** if the driver, or a newer version, is installed, **FALSE** otherwise.
 * @see https://learn.microsoft.com/windows/win32/printdocs/coreprinterdriverinstalled
 */
export CorePrinterDriverInstalledA(pszServer, pszEnvironment, CoreDriverGUID, ftDriverDate, dwlDriverVersion) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

    result := DllCall("winspool.drv\CorePrinterDriverInstalledA", "ptr", pszServer, "ptr", pszEnvironment, Guid, CoreDriverGUID, FILETIME, ftDriverDate, "uint", dwlDriverVersion, BOOL.Ptr, &pbDriverInstalled := 0, "HRESULT")
    return pbDriverInstalled
}

/**
 * The CorePrinterDriverInstalled function reports whether a core printer driver with a specified GUID, date, and version is installed.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * @param {PWSTR} pszServer Pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
 * @param {PWSTR} pszEnvironment Pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {Guid} CoreDriverGUID The GUID of the core printer driver.
 * @param {FILETIME} ftDriverDate The date of the core printer driver.
 * @param {Integer} dwlDriverVersion The version of the core printer driver.
 * @returns {BOOL} A pointer to **TRUE** if the driver, or a newer version, is installed, **FALSE** otherwise.
 * @see https://learn.microsoft.com/windows/win32/printdocs/coreprinterdriverinstalled
 */
export CorePrinterDriverInstalledW(pszServer, pszEnvironment, CoreDriverGUID, ftDriverDate, dwlDriverVersion) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

    result := DllCall("winspool.drv\CorePrinterDriverInstalledW", "ptr", pszServer, "ptr", pszEnvironment, Guid, CoreDriverGUID, FILETIME, ftDriverDate, "uint", dwlDriverVersion, BOOL.Ptr, &pbDriverInstalled := 0, "HRESULT")
    return pbDriverInstalled
}

/**
 * Retrieves the path to the specified printer driver package on a print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * To obtain a value for *cchDriverPackageCab*, call the function with **NULL** as the value of *pszDriverPackageCab*. Use the value returned in *pcchRequiredSize* as the value of *cchDriverPackageCab* and call the function again.
 * 
 * The *pszPackageID* is typically obtained from a call to [**GetCorePrinterDrivers**](getcoreprinterdrivers.md).
 * @param {PSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
 * @param {PSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {PSTR} pszLanguage A pointer to a constant, null-terminated string that specifies the [Multilingual User Interface](/windows/desktop/Intl/mui-resource-management) language for the driver being installed. This can be **NULL**.
 * @param {PSTR} pszPackageID A pointer to a constant, null-terminated string that specifies the ID of the driver package.
 * @param {PSTR} pszDriverPackageCab A pointer to a null-terminated string that specifies the path to the cabinet file for the driver package. This can be **NULL**. See Remarks.
 * @param {Integer} cchDriverPackageCab The size, in characters, of the *pszDriverPackageCab* buffer. This can be **NULL**.
 * @returns {Integer} A pointer to the required size of the *pszDriverPackageCab* buffer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverpackagepath
 */
export GetPrinterDriverPackagePathA(pszServer, pszEnvironment, pszLanguage, pszPackageID, pszDriverPackageCab, cchDriverPackageCab) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
    pszLanguage := pszLanguage is String ? StrPtr(pszLanguage) : pszLanguage
    pszPackageID := pszPackageID is String ? StrPtr(pszPackageID) : pszPackageID
    pszDriverPackageCab := pszDriverPackageCab is String ? StrPtr(pszDriverPackageCab) : pszDriverPackageCab

    result := DllCall("winspool.drv\GetPrinterDriverPackagePathA", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszLanguage, "ptr", pszPackageID, "ptr", pszDriverPackageCab, "uint", cchDriverPackageCab, "uint*", &pcchRequiredSize := 0, "HRESULT")
    return pcchRequiredSize
}

/**
 * Retrieves the path to the specified printer driver package on a print server.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * To obtain a value for *cchDriverPackageCab*, call the function with **NULL** as the value of *pszDriverPackageCab*. Use the value returned in *pcchRequiredSize* as the value of *cchDriverPackageCab* and call the function again.
 * 
 * The *pszPackageID* is typically obtained from a call to [**GetCorePrinterDrivers**](getcoreprinterdrivers.md).
 * @param {PWSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server. Use **NULL** for the local computer.
 * @param {PWSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @param {PWSTR} pszLanguage A pointer to a constant, null-terminated string that specifies the [Multilingual User Interface](/windows/desktop/Intl/mui-resource-management) language for the driver being installed. This can be **NULL**.
 * @param {PWSTR} pszPackageID A pointer to a constant, null-terminated string that specifies the ID of the driver package.
 * @param {PWSTR} pszDriverPackageCab A pointer to a null-terminated string that specifies the path to the cabinet file for the driver package. This can be **NULL**. See Remarks.
 * @param {Integer} cchDriverPackageCab The size, in characters, of the *pszDriverPackageCab* buffer. This can be **NULL**.
 * @returns {Integer} A pointer to the required size of the *pszDriverPackageCab* buffer.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriverpackagepath
 */
export GetPrinterDriverPackagePathW(pszServer, pszEnvironment, pszLanguage, pszPackageID, pszDriverPackageCab, cchDriverPackageCab) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment
    pszLanguage := pszLanguage is String ? StrPtr(pszLanguage) : pszLanguage
    pszPackageID := pszPackageID is String ? StrPtr(pszPackageID) : pszPackageID
    pszDriverPackageCab := pszDriverPackageCab is String ? StrPtr(pszDriverPackageCab) : pszDriverPackageCab

    result := DllCall("winspool.drv\GetPrinterDriverPackagePathW", "ptr", pszServer, "ptr", pszEnvironment, "ptr", pszLanguage, "ptr", pszPackageID, "ptr", pszDriverPackageCab, "uint", cchDriverPackageCab, "uint*", &pcchRequiredSize := 0, "HRESULT")
    return pcchRequiredSize
}

/**
 * Deletes a printer driver package from the driver store.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The driver store is typically %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
 * 
 * A driver package that shipped with Windows cannot be removed with this function.
 * 
 * The user must have printer administration privileges.
 * @param {PSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server from which the driver package is being deleted. A **NULL** pointer value means the local computer.
 * @param {PSTR} pszInfPath A pointer to a constant, null-terminated string that specifies the path to the driver's \*.inf file.
 * @param {PSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @returns {HRESULT} S\_OK, if the operation succeeds.
 * 
 * E\_ACCESSDENIED, if the package was shipped with Windows.
 * 
 * HRESULT\_CODE(ERROR\_PRINT\_DRIVER\_PACKAGE\_IN\_USE), if the package is being used.
 * 
 * Otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverpackage
 */
export DeletePrinterDriverPackageA(pszServer, pszInfPath, pszEnvironment) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

    result := DllCall("winspool.drv\DeletePrinterDriverPackageA", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "HRESULT")
    return result
}

/**
 * Deletes a printer driver package from the driver store.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * The driver store is typically %windir%\\inf or %windir%\\System32\\DriverStore\\FileRepository.
 * 
 * A driver package that shipped with Windows cannot be removed with this function.
 * 
 * The user must have printer administration privileges.
 * @param {PWSTR} pszServer A pointer to a constant, null-terminated string that specifies the name of the print server from which the driver package is being deleted. A **NULL** pointer value means the local computer.
 * @param {PWSTR} pszInfPath A pointer to a constant, null-terminated string that specifies the path to the driver's \*.inf file.
 * @param {PWSTR} pszEnvironment A pointer to a constant, null-terminated string that specifies the processor architecture (for example, Windows NT x86). This can be **NULL**.
 * @returns {HRESULT} S\_OK, if the operation succeeds.
 * 
 * E\_ACCESSDENIED, if the package was shipped with Windows.
 * 
 * HRESULT\_CODE(ERROR\_PRINT\_DRIVER\_PACKAGE\_IN\_USE), if the package is being used.
 * 
 * Otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/deleteprinterdriverpackage
 */
export DeletePrinterDriverPackageW(pszServer, pszInfPath, pszEnvironment) {
    pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
    pszInfPath := pszInfPath is String ? StrPtr(pszInfPath) : pszInfPath
    pszEnvironment := pszEnvironment is String ? StrPtr(pszEnvironment) : pszEnvironment

    result := DllCall("winspool.drv\DeletePrinterDriverPackageW", "ptr", pszServer, "ptr", pszInfPath, "ptr", pszEnvironment, "HRESULT")
    return result
}

/**
 * Reports to the Print Spooler service whether an XPS print job is in the spooling or the rendering phase and what part of the processing is currently underway.
 * @remarks
 * > [!Note]  
 * > This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.
 * 
 *  
 * 
 * > [!Note]  
 * > **ReportJobProcessingProgress** will only report the progress of the XPS print job if the print job is in the spooling or rendering phase. **ReportJobProcessingProgress** will fail if it is called when the XPS print job is not in the spooling or rendering phase.
 * @param {HANDLE} printerHandle A printer handle for which the function is to retrieve information. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {Integer} jobId Identifies the print job for which to retrieve data. Use the [**AddJob**](addjob.md) function or [**StartDoc**](/windows/desktop/api/Wingdi/nf-wingdi-startdoca) function to get a print job identifier.
 * @param {EPrintXPSJobOperation} jobOperation Specifies whether the job is in the spooling phase or the rendering phase.
 * @param {EPrintXPSJobProgress} jobProgress Specifies what part of the processing is currently underway. This value refers to events in either the spooling or rendering phase depending on the value of *jobOperation*.
 * @returns {HRESULT} If the operation succeeds, the return value is S\_OK, otherwise the **HRESULT** will contain an error code.
 * 
 * For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
 * @see https://learn.microsoft.com/windows/win32/printdocs/reportjobprocessingprogress
 */
export ReportJobProcessingProgress(printerHandle, jobId, jobOperation, jobProgress) {
    result := DllCall("winspool.drv\ReportJobProcessingProgress", HANDLE, printerHandle, "uint", jobId, EPrintXPSJobOperation, jobOperation, EPrintXPSJobProgress, jobProgress, "HRESULT")
    return result
}

/**
 * 
 * @param {HWND} _hWnd 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {PSTR} pEnvironment 
 * @param {Integer} Level 
 * @param {Integer} pDriverInfo 
 * @param {Integer} cbBuf 
 * @param {Pointer<Integer>} pcbNeeded 
 * @returns {BOOL} 
 */
export GetPrinterDriver2A(_hWnd, hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDriver2A", HWND, _hWnd, PRINTER_HANDLE, hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetPrinterDriver2 function retrieves driver data for the specified printer. If the driver is not installed on the local computer, GetPrinterDriver2 installs it and displays any user interface to the specified window.
 * @remarks
 * The [**DRIVER\_INFO\_2**](driver-info-2.md), [**DRIVER\_INFO\_3**](driver-info-3.md), [**DRIVER\_INFO\_4**](driver-info-4.md), [**DRIVER\_INFO\_5**](driver-info-5.md), [**DRIVER\_INFO\_6**](driver-info-6.md), and [**DRIVER\_INFO\_8**](driver-info-8.md) structures contain the file name or the full path and file name of the printer driver in the **pDriverPath** member. An application can use the path and file name to load a printer driver by calling the [**LoadLibrary**](/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya) function and supplying the path and file name as the single argument.
 * 
 * The ANSI version of this function, **GetPrinterDriver2A** is not supported and returns **ERROR\_NOT\_SUPPORTED**.
 * @param {HWND} _hWnd A handle of the window that will be used as the parent window of any user interface, such as a dialog box, that the driver displays during installation. If the value of this parameter is **NULL**, the driver's user interface will still be displayed to the user during installation, but it will not have a parent window.
 * @param {PRINTER_HANDLE} hPrinter A handle to the printer for which the driver data should be retrieved. Use the [**OpenPrinter**](openprinter.md) or [**AddPrinter**](addprinter.md) function to retrieve a printer handle.
 * @param {PWSTR} pEnvironment A pointer to a null-terminated string that specifies the environment (for example, Windows x86, Windows IA64, or Windows x64). If this parameter is **NULL**, the current environment of the calling application and client machine (not of the destination application and print server) is used.
 * @param {Integer} Level The printer driver structure returned in the *pDriverInfo* buffer. This parameter can be one of the following values.
 * 
 * 
 * 
 * | Value                                                                                                | Meaning                                             |
 * |------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
 * | <span id="1"></span><dl> <dt>**1**</dt> </dl> | [**DRIVER\_INFO\_1**](driver-info-1.md)<br/> |
 * | <span id="2"></span><dl> <dt>**2**</dt> </dl> | [**DRIVER\_INFO\_2**](driver-info-2.md)<br/> |
 * | <span id="3"></span><dl> <dt>**3**</dt> </dl> | [**DRIVER\_INFO\_3**](driver-info-3.md)<br/> |
 * | <span id="4"></span><dl> <dt>**4**</dt> </dl> | [**DRIVER\_INFO\_4**](driver-info-4.md)<br/> |
 * | <span id="5"></span><dl> <dt>**5**</dt> </dl> | [**DRIVER\_INFO\_5**](driver-info-5.md)<br/> |
 * | <span id="6"></span><dl> <dt>**6**</dt> </dl> | [**DRIVER\_INFO\_6**](driver-info-6.md)<br/> |
 * | <span id="8"></span><dl> <dt>**8**</dt> </dl> | [**DRIVER\_INFO\_8**](driver-info-8.md)<br/> |
 * @param {Integer} pDriverInfo A pointer to a buffer that receives a structure containing information about the driver, as specified by *Level*. The buffer must be large enough to store the strings pointed to by the structure members.
 * 
 * To determine the required buffer size, call **GetPrinterDriver2** with *cbBuf* set to zero. **GetPrinterDriver2** fails, [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns **ERROR\_INSUFFICIENT\_BUFFER**, and the *pcbNeeded* parameter returns the size, in bytes, of the buffer required to hold the array of structures and their data.
 * @param {Integer} cbBuf The size, in bytes, of the array at which *pDriverInfo* points.
 * @param {Pointer<Integer>} pcbNeeded A pointer to a value that receives the number of bytes copied if the function succeeds or the number of bytes required if *cbBuf* is too small.
 * @returns {BOOL} If the function succeeds, the return value is a nonzero value.
 * 
 * If the function fails, the return value is zero. To get the return status, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror).
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprinterdriver2
 */
export GetPrinterDriver2W(_hWnd, hPrinter, pEnvironment, Level, pDriverInfo, cbBuf, pcbNeeded) {
    pEnvironment := pEnvironment is String ? StrPtr(pEnvironment) : pEnvironment

    pcbNeededMarshal := pcbNeeded is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\GetPrinterDriver2W", HWND, _hWnd, PRINTER_HANDLE, hPrinter, "ptr", pEnvironment, "uint", Level, "ptr", pDriverInfo, "uint", cbBuf, pcbNeededMarshal, pcbNeeded, BOOL)
    return result
}

/**
 * The GetPrintExecutionData retrieves the current print context.
 * @remarks
 * Printer drivers should call [**GetProcAddress**](/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress) on the winspool.drv module to get the address of the **GetPrintExecutionData** function because **GetPrintExecutionData** is not supported on Windows Vista or earlier versions of Windows.
 * 
 * **GetPrintExecutionData** only fails if the value of *pData* is **NULL**.
 * 
 * The value of the **clientAppPID** member of [**PRINT\_EXECUTION\_DATA**](print-execution-data.md) is only meaningful if the value of **context** is **PRINT\_EXECUTION\_CONTEXT\_WOW64**. If the value of **context** is not **PRINT\_EXECUTION\_CONTEXT\_WOW64**, the value of **clientAppPID** is 0.
 * @param {Pointer<PRINT_EXECUTION_DATA>} pData A pointer to a variable that receives the address of the [**PRINT\_EXECUTION\_DATA**](print-execution-data.md) structure.
 * @returns {BOOL} Returns **TRUE** if the function succeeds; otherwise **FALSE**. If the return value is **FALSE**, call [**GetLastError**](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror) to get the error status.
 * @see https://learn.microsoft.com/windows/win32/printdocs/getprintexecutiondata
 */
export GetPrintExecutionData(pData) {
    result := DllCall("winspool.drv\GetPrintExecutionData", PRINT_EXECUTION_DATA.Ptr, pData, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} JobId 
 * @param {PWSTR} pszName 
 * @param {Pointer<PrintPropertyValue>} pValue 
 * @returns {Integer} 
 */
export GetJobNamedPropertyValue(hPrinter, JobId, pszName, pValue) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("winspool.drv\GetJobNamedPropertyValue", PRINTER_HANDLE, hPrinter, "uint", JobId, "ptr", pszName, PrintPropertyValue.Ptr, pValue, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<PrintPropertyValue>} pValue 
 * @returns {String} Nothing - always returns an empty string
 */
export FreePrintPropertyValue(pValue) {
    DllCall("winspool.drv\FreePrintPropertyValue", PrintPropertyValue.Ptr, pValue)
}

/**
 * 
 * @param {Integer} cProperties 
 * @param {Pointer<Pointer<PrintNamedProperty>>} ppProperties 
 * @returns {String} Nothing - always returns an empty string
 */
export FreePrintNamedPropertyArray(cProperties, ppProperties) {
    ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

    DllCall("winspool.drv\FreePrintNamedPropertyArray", "uint", cProperties, ppPropertiesMarshal, ppProperties)
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} JobId 
 * @param {Pointer<PrintNamedProperty>} pProperty 
 * @returns {Integer} 
 */
export SetJobNamedProperty(hPrinter, JobId, pProperty) {
    result := DllCall("winspool.drv\SetJobNamedProperty", PRINTER_HANDLE, hPrinter, "uint", JobId, PrintNamedProperty.Ptr, pProperty, UInt32)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} JobId 
 * @param {PWSTR} pszName 
 * @returns {Integer} 
 */
export DeleteJobNamedProperty(hPrinter, JobId, pszName) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("winspool.drv\DeleteJobNamedProperty", PRINTER_HANDLE, hPrinter, "uint", JobId, "ptr", pszName, UInt32)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} JobId 
 * @param {Pointer<Integer>} pcProperties 
 * @param {Pointer<Pointer<PrintNamedProperty>>} ppProperties 
 * @returns {Integer} 
 */
export EnumJobNamedProperties(hPrinter, JobId, pcProperties, ppProperties) {
    pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"
    ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

    result := DllCall("winspool.drv\EnumJobNamedProperties", PRINTER_HANDLE, hPrinter, "uint", JobId, pcPropertiesMarshal, pcProperties, ppPropertiesMarshal, ppProperties, UInt32)
    return result
}

/**
 * 
 * @param {HWND} _hWnd 
 * @param {PWSTR} pszPrinter 
 * @param {Pointer<HANDLE>} phFile 
 * @param {Pointer<PWSTR>} ppszOutputFile 
 * @returns {HRESULT} 
 */
export GetPrintOutputInfo(_hWnd, pszPrinter, phFile, ppszOutputFile) {
    pszPrinter := pszPrinter is String ? StrPtr(pszPrinter) : pszPrinter

    ppszOutputFileMarshal := ppszOutputFile is VarRef ? "ptr*" : "ptr"

    result := DllCall("winspool.drv\GetPrintOutputInfo", HWND, _hWnd, "ptr", pszPrinter, HANDLE.Ptr, phFile, ppszOutputFileMarshal, ppszOutputFile, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<DEVQUERYPRINT_INFO>} pDQPInfo 
 * @returns {BOOL} 
 */
export DevQueryPrintEx(pDQPInfo) {
    result := DllCall("winspool.drv\DevQueryPrintEx", DEVQUERYPRINT_INFO.Ptr, pDQPInfo, BOOL)
    return result
}

/**
 * Enables an application to register for notifications from Print Spooler-hosted printing components such as printer drivers, print processors, and port monitors.
 * @remarks
 * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
 * <div> </div>
 * To stop notifications through a unidirectional channel, the listening application passes the <i>pRegistrationHandler</i> value returned by <b>RegisterForPrintAsyncNotifications</b> to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-unregisterforprintasyncnotifications">UnRegisterForPrintAsyncNotifications</a>. For a bidirectional channel, call <b>UnRegisterForPrintAsyncNotifications</b> to block notifications in any new channels that were created after that call. To block notifications on existing bidirectional channels, the listening application must close the channel with <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a>.
 * 
 * As a result of a <b>RegisterForPrintAsyncNotifications</b> call, the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> method is called for the <i>pCallback</i> object. Calling <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-unregisterforprintasyncnotifications">UnRegisterForPrintAsyncNotifications</a> will release the <i>pCallback</i> object. The reference count of <i>pCallback</i> object will be also incremented when a channel is created and decremented when the channel is closed.
 * 
 * The <i>pSchema</i> parameter is a GUID pointer that the spooler accepts and uses to filter the listener clients. Any client of the spooler asynchronous notification mechanism can define its own notification type. Even though the spooler is unaware of the notification type that is sent, it still filters the listener clients based on the notification type. The notification schema that <i>pSchema</i> references is the schema that is used by the notification object that exposes <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nn-prnasnot-iprintasyncnotifydataobject">IPrintAsyncNotifyDataObject</a>. Clients of the spooler notification pipe can define their own data schema and can send any data type back and forth and the GUID referenced by <i>pSchema</i> is unique to that data schema.
 * @param {PWSTR} pszName A pointer to the name of a print server or print queue.
 * @param {Pointer<Guid>} pNotificationType A pointer to the GUID of the data schema for the type of notifications that the application must receive.
 * @param {PrintAsyncNotifyUserFilter} eUserFilter A value specifying whether notifications will be sent to:
 * 
 * <ul>
 * <li>Only applications that are running as the same user as the Print Spooler-hosted plug-in sender.</li>
 * <li>A broader set of listening applications.</li>
 * </ul>
 * @param {PrintAsyncNotifyConversationStyle} eConversationStyle A value specifying whether communication is bidirectional or unidirectional.
 * @param {IPrintAsyncNotifyCallback} pCallback A pointer to an object that the Print Spooler-hosted component will use to call back the application. This should never be <b>NULL</b>.
 * @returns {HANDLE} A pointer to a structure that represents the registration.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-registerforprintasyncnotifications
 * @since windows6.0.6000
 */
export RegisterForPrintAsyncNotifications(pszName, pNotificationType, eUserFilter, eConversationStyle, pCallback) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    phNotify := HANDLE.Owned()
    result := DllCall("winspool.drv\RegisterForPrintAsyncNotifications", "ptr", pszName, Guid.Ptr, pNotificationType, PrintAsyncNotifyUserFilter, eUserFilter, PrintAsyncNotifyConversationStyle, eConversationStyle, "ptr", pCallback, HANDLE.Ptr, phNotify, "HRESULT")
    return phNotify
}

/**
 * Enables an application that has registered to receive notifications from Print Spooler-hosted printing components to unregister.
 * @remarks
 * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
 * <div> </div>
 * A call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-registerforprintasyncnotifications">RegisterForPrintAsyncNotifications</a> must return <i>hRegistrationHandler</i>.
 * 
 * If the channel is bidirectional, a call to <b>UnRegisterForPrintAsyncNotifications</b> only prevents notifications from communication channels created after that point. To end notifications from the existing channel, the listening application must close the channel with <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a>.
 * 
 * A call to <b>UnRegisterForPrintAsyncNotifications</b> will decrement the reference count of the <i>pCallback</i> object passed to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-registerforprintasyncnotifications">RegisterForPrintAsyncNotifications</a>.
 * 
 * After this function succeeds, <i>hRegistrationHandler</i> is invalid and must not be used again.
 * @param {HANDLE} param0 
 * @returns {HRESULT} <table>
 * <tr>
 * <th>HRESULT</th>
 * <th>Severity</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>S_OK</td>
 * <td>SUCCESS</td>
 * <td>The function completed successfully.</td>
 * </tr>
 * <tr>
 * <td>ALREADY_UNREGISTERED</td>
 * <td>
 * SUCCESS
 * 
 * ERROR
 * 
 * </td>
 * <td>The registration handler has already been unregistered. If this HRESULT has an ERROR severity, the calling function should handle the error condition.</td>
 * </tr>
 * <tr>
 * <td>NOT_REGISTERED</td>
 * <td>SUCCESS</td>
 * <td>The registration handler was not registered.</td>
 * </tr>
 * </table>
 *  
 * 
 * The return values are COM error codes. Because this function might complete the operation successfully yet return an <b>HRESULT</b> other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific <b>HRESULT</b> that was returned by the function, use the HRESULT_CODE macro.
 * 
 * The following code example shows how these macros can be used to evaluate the return value.
 * 
 * 
 * ```cpp
 * if (SUCCEEDED(hr)) {
 *   // Call succeeded, check HRESULT value returned
 *   switch (HRESULT_CODE(hr)){
 *     case S_OK:
 *       // Some action 
 *       break;
 *     case NOT_REGISTERED:
 *       // Some action 
 *       break;
 *     case ALREADY_UNREGISTERED:
 *       // Some action 
 *       break;
 *     default:
 *       // Default action 
 *       break;
 *   }
 * } else {
 *   // Call failed, check HRESULT value returned
 *   switch (HRESULT_CODE(hr)){
 *     // This can be error and a successful return
 *     case ALREADY_UNREGISTERED:
 *       // Some action 
 *       break;
 *     default:
 *       // Default action 
 *       break;
 *   }
 * }
 * 
 * ```
 * 
 * 
 * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-unregisterforprintasyncnotifications
 * @since windows6.0.6000
 */
export UnRegisterForPrintAsyncNotifications(param0) {
    result := DllCall("winspool.drv\UnRegisterForPrintAsyncNotifications", HANDLE, param0, "HRESULT")
    return result
}

/**
 * Creates a communication channel between a Print Spooler-hosted printing component, such as a print driver or port monitor, and an application that receives notifications from the component.
 * @remarks
 * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
 * <div> </div>
 * A component can open a channel only if it runs in the Print Spooler's process. For example, if an application loads a printer driver, the driver cannot open a channel, but a printer driver loaded inside the Print Spooler can open a channel. Listening applications can either be inside or outside the Print Spooler's process.
 * 
 * To close a channel, call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a>; however, <b>IPrintAsyncNotifyChannel::CloseChannel</b> cannot be called immediately after the call to <b>CreatePrintAsyncNotifyChannel</b>.
 * 
 * Call IPrintAsyncNotifyChannel::Release() only:
 * 
 * <ol>
 * <li>if it is an explicit match to an earlier IPrintAsyncNotifyChannel::AddRef() call.</li>
 * <li>if the channel is a UniDirectional channel and you are abandoning the pointer received in a successful call to CreatePrintAsyncNotifyChannel.</li>
 * <li>if, after you created a BiDirectional channel or in the implementation of IPrintNotifyAsyncCallback::OnEventNotify and:<ol>
 * <li>you did not call IPrintAsyncNotifyChannel::SendNotification or IPrintAsyncNotifyChannel::CloseChannel OR</li>
 * <li>you did not retry a call to IPrintAsyncNotifyChannel::SendNotification or IPrintAsyncNotifyChannel::CloseChannel that failed OR</li>
 * <li>on the server side, you didn't retry a call to IPrintAsyncNotifyChannel::SendNotification that succeeded with the return value NO_LISTENER OR</li>
 * <li>on the client side, you didn't retry a call to IPrintAsyncNotifyChannel::SendNotification that succeeded with return value CHANNEL_ACQUIRED.</li>
 * </ol>
 * </li>
 * </ol>
 * @param {PWSTR} pszName A pointer to the name of a print server or print queue.
 * @param {Pointer<Guid>} pNotificationType A pointer to the GUID of the data schema for the type of notifications to be sent in the channel.
 * @param {PrintAsyncNotifyUserFilter} eUserFilter A value specifying whether notifications will be sent to:
 * 
 * <ul>
 * <li>Only applications that are running as the same user as the Print Spooler-hosted plug-in sender.</li>
 * <li>A broader set of listening applications.</li>
 * </ul>
 * @param {PrintAsyncNotifyConversationStyle} eConversationStyle A value specifying whether communication is bidirectional or unidirectional.
 * @param {IPrintAsyncNotifyCallback} pCallback A pointer to an object that the listening application will use to call back the Print Spooler-hosted component. This should be <b>NULL</b> if <i>directionality</i> is <b>kUniDirectional</b>.
 * @returns {IPrintAsyncNotifyChannel} A pointer to the new channel.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-createprintasyncnotifychannel
 * @since windows6.0.6000
 */
export CreatePrintAsyncNotifyChannel(pszName, pNotificationType, eUserFilter, eConversationStyle, pCallback) {
    pszName := pszName is String ? StrPtr(pszName) : pszName

    result := DllCall("winspool.drv\CreatePrintAsyncNotifyChannel", "ptr", pszName, Guid.Ptr, pNotificationType, PrintAsyncNotifyUserFilter, eUserFilter, PrintAsyncNotifyConversationStyle, eConversationStyle, "ptr", pCallback, "ptr*", &ppIAsynchNotification := 0, "HRESULT")
    return IPrintAsyncNotifyChannel(ppIAsynchNotification)
}

/**
 * 
 * @param {HANDLE} hNotify 
 * @returns {HRESULT} 
 */
export RouterUnregisterForPrintAsyncNotifications(hNotify) {
    result := DllCall("SPOOLSS.dll\RouterUnregisterForPrintAsyncNotifications", HANDLE, hNotify, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pName 
 * @param {Pointer<Guid>} pNotificationType 
 * @param {PrintAsyncNotifyUserFilter} eNotifyFilter 
 * @param {PrintAsyncNotifyConversationStyle} eConversationStyle 
 * @param {IPrintAsyncNotifyCallback} pCallback 
 * @returns {IPrintAsyncNotifyChannel} 
 */
export RouterCreatePrintAsyncNotificationChannel(pName, pNotificationType, eNotifyFilter, eConversationStyle, pCallback) {
    pName := pName is String ? StrPtr(pName) : pName

    result := DllCall("SPOOLSS.dll\RouterCreatePrintAsyncNotificationChannel", "ptr", pName, Guid.Ptr, pNotificationType, PrintAsyncNotifyUserFilter, eNotifyFilter, PrintAsyncNotifyConversationStyle, eConversationStyle, "ptr", pCallback, "ptr*", &ppIAsynchNotification := 0, "HRESULT")
    return IPrintAsyncNotifyChannel(ppIAsynchNotification)
}

/**
 * 
 * @param {PWSTR} pPrinter 
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} 
 */
export RouterGetPrintClassObject(pPrinter, riid) {
    pPrinter := pPrinter is String ? StrPtr(pPrinter) : pPrinter

    result := DllCall("SPOOLSS.dll\RouterGetPrintClassObject", "ptr", pPrinter, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * 
 * @param {PWSTR} pwszPrinterName 
 * @param {Pointer<DEVMODEW>} pDevmode 
 * @param {PWSTR} pwszDocName 
 * @returns {HANDLE} 
 */
export GdiGetSpoolFileHandle(pwszPrinterName, pDevmode, pwszDocName) {
    pwszPrinterName := pwszPrinterName is String ? StrPtr(pwszPrinterName) : pwszPrinterName
    pwszDocName := pwszDocName is String ? StrPtr(pwszDocName) : pwszDocName

    result := DllCall("GDI32.dll\GdiGetSpoolFileHandle", "ptr", pwszPrinterName, DEVMODEW.Ptr, pDevmode, "ptr", pwszDocName, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @returns {BOOL} 
 */
export GdiDeleteSpoolFileHandle(SpoolFileHandle) {
    result := DllCall("GDI32.dll\GdiDeleteSpoolFileHandle", HANDLE, SpoolFileHandle, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @returns {Integer} 
 */
export GdiGetPageCount(SpoolFileHandle) {
    result := DllCall("GDI32.dll\GdiGetPageCount", HANDLE, SpoolFileHandle, UInt32)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @returns {HDC} 
 */
export GdiGetDC(SpoolFileHandle) {
    result := DllCall("GDI32.dll\GdiGetDC", HANDLE, SpoolFileHandle, HDC)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @param {Integer} Page 
 * @param {Pointer<Integer>} pdwPageType 
 * @returns {HANDLE} 
 */
export GdiGetPageHandle(SpoolFileHandle, Page, pdwPageType) {
    pdwPageTypeMarshal := pdwPageType is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\GdiGetPageHandle", HANDLE, SpoolFileHandle, "uint", Page, pdwPageTypeMarshal, pdwPageType, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @param {Pointer<DOCINFOW>} pDocInfo 
 * @returns {BOOL} 
 */
export GdiStartDocEMF(SpoolFileHandle, pDocInfo) {
    result := DllCall("GDI32.dll\GdiStartDocEMF", HANDLE, SpoolFileHandle, DOCINFOW.Ptr, pDocInfo, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @returns {BOOL} 
 */
export GdiStartPageEMF(SpoolFileHandle) {
    result := DllCall("GDI32.dll\GdiStartPageEMF", HANDLE, SpoolFileHandle, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @param {HANDLE} hemf 
 * @param {Pointer<RECT>} prectDocument 
 * @param {Pointer<RECT>} prectBorder 
 * @param {Pointer<RECT>} prectClip 
 * @returns {BOOL} 
 */
export GdiPlayPageEMF(SpoolFileHandle, hemf, prectDocument, prectBorder, prectClip) {
    result := DllCall("GDI32.dll\GdiPlayPageEMF", HANDLE, SpoolFileHandle, HANDLE, hemf, RECT.Ptr, prectDocument, RECT.Ptr, prectBorder, RECT.Ptr, prectClip, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @param {Integer} dwOptimization 
 * @returns {BOOL} 
 */
export GdiEndPageEMF(SpoolFileHandle, dwOptimization) {
    result := DllCall("GDI32.dll\GdiEndPageEMF", HANDLE, SpoolFileHandle, "uint", dwOptimization, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @returns {BOOL} 
 */
export GdiEndDocEMF(SpoolFileHandle) {
    result := DllCall("GDI32.dll\GdiEndDocEMF", HANDLE, SpoolFileHandle, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @param {Integer} dwPageNumber 
 * @param {Pointer<Pointer<DEVMODEW>>} pCurrDM 
 * @param {Pointer<Pointer<DEVMODEW>>} pLastDM 
 * @returns {BOOL} 
 */
export GdiGetDevmodeForPage(SpoolFileHandle, dwPageNumber, pCurrDM, pLastDM) {
    pCurrDMMarshal := pCurrDM is VarRef ? "ptr*" : "ptr"
    pLastDMMarshal := pLastDM is VarRef ? "ptr*" : "ptr"

    result := DllCall("GDI32.dll\GdiGetDevmodeForPage", HANDLE, SpoolFileHandle, "uint", dwPageNumber, pCurrDMMarshal, pCurrDM, pLastDMMarshal, pLastDM, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} SpoolFileHandle 
 * @param {Pointer<DEVMODEW>} pCurrDM 
 * @returns {BOOL} 
 */
export GdiResetDCEMF(SpoolFileHandle, pCurrDM) {
    result := DllCall("GDI32.dll\GdiResetDCEMF", HANDLE, SpoolFileHandle, DEVMODEW.Ptr, pCurrDM, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pPrinterName 
 * @param {Pointer<DEVMODEW>} pDevmode 
 * @param {Pointer<ATTRIBUTE_INFO_3>} pAttributeInfo 
 * @returns {BOOL} 
 */
export GetJobAttributes(pPrinterName, pDevmode, pAttributeInfo) {
    pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

    result := DllCall("SPOOLSS.dll\GetJobAttributes", "ptr", pPrinterName, DEVMODEW.Ptr, pDevmode, ATTRIBUTE_INFO_3.Ptr, pAttributeInfo, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pPrinterName 
 * @param {Pointer<DEVMODEW>} pDevmode 
 * @param {Integer} dwLevel 
 * @param {Integer} pAttributeInfo 
 * @param {Integer} nSize 
 * @param {Integer} dwFlags 
 * @returns {BOOL} 
 */
export GetJobAttributesEx(pPrinterName, pDevmode, dwLevel, pAttributeInfo, nSize, dwFlags) {
    pPrinterName := pPrinterName is String ? StrPtr(pPrinterName) : pPrinterName

    result := DllCall("SPOOLSS.dll\GetJobAttributesEx", "ptr", pPrinterName, DEVMODEW.Ptr, pDevmode, "uint", dwLevel, "ptr", pAttributeInfo, "uint", nSize, "uint", dwFlags, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Pointer<DEVMODEW>} pDevMode 
 * @returns {HANDLE} 
 */
export CreatePrinterIC(hPrinter, pDevMode) {
    result := DllCall("winspool.drv\CreatePrinterIC", PRINTER_HANDLE, hPrinter, DEVMODEW.Ptr, pDevMode, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} hPrinterIC 
 * @param {Integer} pIn 
 * @param {Integer} cIn 
 * @param {Integer} pOut 
 * @param {Integer} cOut 
 * @param {Integer} ul 
 * @returns {BOOL} 
 */
export PlayGdiScriptOnPrinterIC(hPrinterIC, pIn, cIn, pOut, cOut, ul) {
    result := DllCall("winspool.drv\PlayGdiScriptOnPrinterIC", HANDLE, hPrinterIC, "ptr", pIn, "uint", cIn, "ptr", pOut, "uint", cOut, "uint", ul, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} hPrinterIC 
 * @returns {BOOL} 
 */
export DeletePrinterIC(hPrinterIC) {
    result := DllCall("winspool.drv\DeletePrinterIC", HANDLE, hPrinterIC, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Pointer<DEVMODEA>} pDevMode 
 * @param {Pointer<Integer>} pResID 
 * @returns {BOOL} 
 */
export DevQueryPrint(hPrinter, pDevMode, pResID) {
    pResIDMarshal := pResID is VarRef ? "uint*" : "ptr"

    result := DllCall("winspool.drv\DevQueryPrint", PRINTER_HANDLE, hPrinter, DEVMODEA.Ptr, pDevMode, pResIDMarshal, pResID, BOOL)
    return result
}

/**
 * 
 * @returns {HANDLE} 
 */
export RevertToPrinterSelf() {
    result := DllCall("SPOOLSS.dll\RevertToPrinterSelf", HANDLE.Owned)
    return result
}

/**
 * 
 * @param {HANDLE} hToken 
 * @returns {BOOL} 
 */
export ImpersonatePrinterClient(hToken) {
    result := DllCall("SPOOLSS.dll\ImpersonatePrinterClient", HANDLE, hToken, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} fdwChangeFlags 
 * @param {Pointer<Integer>} pdwResult 
 * @param {Pointer<Void>} pPrinterNotifyInfo 
 * @returns {BOOL} 
 */
export ReplyPrinterChangeNotification(hPrinter, fdwChangeFlags, pdwResult, pPrinterNotifyInfo) {
    pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"
    pPrinterNotifyInfoMarshal := pPrinterNotifyInfo is VarRef ? "ptr" : "ptr"

    result := DllCall("SPOOLSS.dll\ReplyPrinterChangeNotification", PRINTER_HANDLE, hPrinter, "uint", fdwChangeFlags, pdwResultMarshal, pdwResult, pPrinterNotifyInfoMarshal, pPrinterNotifyInfo, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} hNotify 
 * @param {Integer} dwColor 
 * @param {Integer} fdwFlags 
 * @param {Pointer<Integer>} pdwResult 
 * @param {Pointer<Void>} pPrinterNotifyInfo 
 * @returns {BOOL} 
 */
export ReplyPrinterChangeNotificationEx(hNotify, dwColor, fdwFlags, pdwResult, pPrinterNotifyInfo) {
    pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"
    pPrinterNotifyInfoMarshal := pPrinterNotifyInfo is VarRef ? "ptr" : "ptr"

    result := DllCall("SPOOLSS.dll\ReplyPrinterChangeNotificationEx", HANDLE, hNotify, "uint", dwColor, "uint", fdwFlags, pdwResultMarshal, pdwResult, pPrinterNotifyInfoMarshal, pPrinterNotifyInfo, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Pointer<PRINTER_NOTIFY_INFO_DATA>} pDataSrc 
 * @returns {BOOL} 
 */
export PartialReplyPrinterChangeNotification(hPrinter, pDataSrc) {
    result := DllCall("SPOOLSS.dll\PartialReplyPrinterChangeNotification", PRINTER_HANDLE, hPrinter, PRINTER_NOTIFY_INFO_DATA.Ptr, pDataSrc, BOOL)
    return result
}

/**
 * 
 * @param {Integer} cPrinterNotifyInfoData 
 * @returns {Pointer<PRINTER_NOTIFY_INFO>} 
 */
export RouterAllocPrinterNotifyInfo(cPrinterNotifyInfoData) {
    result := DllCall("SPOOLSS.dll\RouterAllocPrinterNotifyInfo", "uint", cPrinterNotifyInfoData, PRINTER_NOTIFY_INFO.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfo 
 * @returns {BOOL} 
 */
export RouterFreePrinterNotifyInfo(pInfo) {
    result := DllCall("SPOOLSS.dll\RouterFreePrinterNotifyInfo", PRINTER_NOTIFY_INFO.Ptr, pInfo, BOOL)
    return result
}

/**
 * 
 * @param {Integer} Count 
 * @returns {Pointer<BIDI_RESPONSE_CONTAINER>} 
 */
export RouterAllocBidiResponseContainer(Count) {
    result := DllCall("SPOOLSS.dll\RouterAllocBidiResponseContainer", "uint", Count, BIDI_RESPONSE_CONTAINER.Ptr)
    return result
}

/**
 * 
 * @param {Pointer} NumBytes 
 * @returns {Pointer<Void>} 
 */
export RouterAllocBidiMem(NumBytes) {
    result := DllCall("SPOOLSS.dll\RouterAllocBidiMem", "ptr", NumBytes, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<BIDI_RESPONSE_CONTAINER>} pData 
 * @returns {Integer} 
 */
export RouterFreeBidiResponseContainer(pData) {
    result := DllCall("winspool.drv\RouterFreeBidiResponseContainer", BIDI_RESPONSE_CONTAINER.Ptr, pData, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} pMemPointer 
 * @returns {String} Nothing - always returns an empty string
 */
export RouterFreeBidiMem(pMemPointer) {
    pMemPointerMarshal := pMemPointer is VarRef ? "ptr" : "ptr"

    DllCall("SPOOLSS.dll\RouterFreeBidiMem", pMemPointerMarshal, pMemPointer)
}

/**
 * 
 * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfoDest 
 * @param {Pointer<PRINTER_NOTIFY_INFO_DATA>} pDataSrc 
 * @param {Integer} fdwFlags 
 * @returns {BOOL} 
 */
export AppendPrinterNotifyInfoData(pInfoDest, pDataSrc, fdwFlags) {
    result := DllCall("SPOOLSS.dll\AppendPrinterNotifyInfoData", PRINTER_NOTIFY_INFO.Ptr, pInfoDest, PRINTER_NOTIFY_INFO_DATA.Ptr, pDataSrc, "uint", fdwFlags, BOOL)
    return result
}

/**
 * 
 * @param {HANDLE} hPrinterRPC 
 * @param {Integer} fdwFilterFlags 
 * @param {Integer} fdwOptions 
 * @param {HANDLE} hNotify 
 * @param {Pointer<PRINTER_NOTIFY_OPTIONS>} pPrinterNotifyOptions 
 * @returns {Integer} 
 */
export CallRouterFindFirstPrinterChangeNotification(hPrinterRPC, fdwFilterFlags, fdwOptions, hNotify, pPrinterNotifyOptions) {
    result := DllCall("SPOOLSS.dll\CallRouterFindFirstPrinterChangeNotification", HANDLE, hPrinterRPC, "uint", fdwFilterFlags, "uint", fdwOptions, HANDLE, hNotify, PRINTER_NOTIFY_OPTIONS.Ptr, pPrinterNotifyOptions, UInt32)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} fdwFlags 
 * @param {Integer} fdwOptions 
 * @param {HANDLE} hNotify 
 * @param {Pointer<Void>} pPrinterNotifyOptions 
 * @param {Pointer<Void>} pvReserved1 
 * @returns {BOOL} 
 */
export ProvidorFindFirstPrinterChangeNotification(hPrinter, fdwFlags, fdwOptions, hNotify, pPrinterNotifyOptions, pvReserved1) {
    pPrinterNotifyOptionsMarshal := pPrinterNotifyOptions is VarRef ? "ptr" : "ptr"
    pvReserved1Marshal := pvReserved1 is VarRef ? "ptr" : "ptr"

    result := DllCall("SPOOLSS.dll\ProvidorFindFirstPrinterChangeNotification", PRINTER_HANDLE, hPrinter, "uint", fdwFlags, "uint", fdwOptions, HANDLE, hNotify, pPrinterNotifyOptionsMarshal, pPrinterNotifyOptions, pvReserved1Marshal, pvReserved1, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @returns {BOOL} 
 */
export ProvidorFindClosePrinterChangeNotification(hPrinter) {
    result := DllCall("SPOOLSS.dll\ProvidorFindClosePrinterChangeNotification", PRINTER_HANDLE, hPrinter, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} fdwFilterFlags 
 * @param {Integer} fdwOptions 
 * @param {Pointer<Void>} pPrinterNotifyOptions 
 * @param {Pointer<Void>} pvReserved 
 * @param {Pointer<Void>} pNotificationConfig 
 * @param {Pointer<HANDLE>} phNotify 
 * @param {Pointer<HANDLE>} phEvent 
 * @returns {BOOL} 
 */
export SpoolerFindFirstPrinterChangeNotification(hPrinter, fdwFilterFlags, fdwOptions, pPrinterNotifyOptions, pvReserved, pNotificationConfig, phNotify, phEvent) {
    pPrinterNotifyOptionsMarshal := pPrinterNotifyOptions is VarRef ? "ptr" : "ptr"
    pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"
    pNotificationConfigMarshal := pNotificationConfig is VarRef ? "ptr" : "ptr"

    result := DllCall("SPOOLSS.dll\SpoolerFindFirstPrinterChangeNotification", PRINTER_HANDLE, hPrinter, "uint", fdwFilterFlags, "uint", fdwOptions, pPrinterNotifyOptionsMarshal, pPrinterNotifyOptions, pvReservedMarshal, pvReserved, pNotificationConfigMarshal, pNotificationConfig, HANDLE.Ptr, phNotify, HANDLE.Ptr, phEvent, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Pointer<Integer>} pfdwChange 
 * @param {Pointer<Void>} pPrinterNotifyOptions 
 * @param {Pointer<Pointer<Void>>} ppPrinterNotifyInfo 
 * @returns {BOOL} 
 */
export SpoolerFindNextPrinterChangeNotification(hPrinter, pfdwChange, pPrinterNotifyOptions, ppPrinterNotifyInfo) {
    pfdwChangeMarshal := pfdwChange is VarRef ? "uint*" : "ptr"
    pPrinterNotifyOptionsMarshal := pPrinterNotifyOptions is VarRef ? "ptr" : "ptr"
    ppPrinterNotifyInfoMarshal := ppPrinterNotifyInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("SPOOLSS.dll\SpoolerFindNextPrinterChangeNotification", PRINTER_HANDLE, hPrinter, pfdwChangeMarshal, pfdwChange, pPrinterNotifyOptionsMarshal, pPrinterNotifyOptions, ppPrinterNotifyInfoMarshal, ppPrinterNotifyInfo, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} dwColor 
 * @param {Pointer<PRINTER_NOTIFY_OPTIONS>} pOptions 
 * @param {Pointer<Pointer<PRINTER_NOTIFY_INFO>>} ppInfo 
 * @returns {BOOL} 
 */
export SpoolerRefreshPrinterChangeNotification(hPrinter, dwColor, pOptions, ppInfo) {
    ppInfoMarshal := ppInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("SPOOLSS.dll\SpoolerRefreshPrinterChangeNotification", PRINTER_HANDLE, hPrinter, "uint", dwColor, PRINTER_NOTIFY_OPTIONS.Ptr, pOptions, ppInfoMarshal, ppInfo, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<PRINTER_NOTIFY_INFO>} pInfo 
 * @returns {String} Nothing - always returns an empty string
 */
export SpoolerFreePrinterNotifyInfo(pInfo) {
    DllCall("SPOOLSS.dll\SpoolerFreePrinterNotifyInfo", PRINTER_NOTIFY_INFO.Ptr, pInfo)
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @returns {BOOL} 
 */
export SpoolerFindClosePrinterChangeNotification(hPrinter) {
    result := DllCall("SPOOLSS.dll\SpoolerFindClosePrinterChangeNotification", PRINTER_HANDLE, hPrinter, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pszPrinterName 
 * @param {PWSTR} pszKey 
 * @param {Integer} dwCopyFileEvent 
 * @returns {BOOL} 
 */
export SpoolerCopyFileEvent(pszPrinterName, pszKey, dwCopyFileEvent) {
    pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName
    pszKey := pszKey is String ? StrPtr(pszKey) : pszKey

    result := DllCall("mscms.dll\SpoolerCopyFileEvent", "ptr", pszPrinterName, "ptr", pszKey, "uint", dwCopyFileEvent, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pszPrinterName 
 * @param {PWSTR} pszDirectory 
 * @param {Pointer<Integer>} pSplClientInfo 
 * @param {Integer} dwLevel 
 * @param {PWSTR} pszSourceDir 
 * @param {Pointer<Integer>} pcchSourceDirSize 
 * @param {PWSTR} pszTargetDir 
 * @param {Pointer<Integer>} pcchTargetDirSize 
 * @param {Integer} dwFlags 
 * @returns {Integer} 
 */
export GenerateCopyFilePaths(pszPrinterName, pszDirectory, pSplClientInfo, dwLevel, pszSourceDir, pcchSourceDirSize, pszTargetDir, pcchTargetDirSize, dwFlags) {
    pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName
    pszDirectory := pszDirectory is String ? StrPtr(pszDirectory) : pszDirectory
    pszSourceDir := pszSourceDir is String ? StrPtr(pszSourceDir) : pszSourceDir
    pszTargetDir := pszTargetDir is String ? StrPtr(pszTargetDir) : pszTargetDir

    pSplClientInfoMarshal := pSplClientInfo is VarRef ? "char*" : "ptr"
    pcchSourceDirSizeMarshal := pcchSourceDirSize is VarRef ? "uint*" : "ptr"
    pcchTargetDirSizeMarshal := pcchTargetDirSize is VarRef ? "uint*" : "ptr"

    result := DllCall("mscms.dll\GenerateCopyFilePaths", "ptr", pszPrinterName, "ptr", pszDirectory, pSplClientInfoMarshal, pSplClientInfo, "uint", dwLevel, "ptr", pszSourceDir, pcchSourceDirSizeMarshal, pcchSourceDirSize, "ptr", pszTargetDir, pcchTargetDirSizeMarshal, pcchTargetDirSize, "uint", dwFlags, UInt32)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} JobId 
 * @param {Pointer<SHOWUIPARAMS>} pUIParams 
 * @param {Pointer<Integer>} pResponse 
 * @returns {BOOL} 
 */
export SplPromptUIInUsersSession(hPrinter, JobId, pUIParams, pResponse) {
    pResponseMarshal := pResponse is VarRef ? "uint*" : "ptr"

    result := DllCall("SPOOLSS.dll\SplPromptUIInUsersSession", PRINTER_HANDLE, hPrinter, "uint", JobId, SHOWUIPARAMS.Ptr, pUIParams, pResponseMarshal, pResponse, BOOL)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {Integer} JobId 
 * @param {Pointer<BOOL>} pIsSessionZero 
 * @returns {Integer} 
 */
export SplIsSessionZero(hPrinter, JobId, pIsSessionZero) {
    pIsSessionZeroMarshal := pIsSessionZero is VarRef ? "int*" : "ptr"

    result := DllCall("SPOOLSS.dll\SplIsSessionZero", PRINTER_HANDLE, hPrinter, "uint", JobId, pIsSessionZeroMarshal, pIsSessionZero, UInt32)
    return result
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @returns {HANDLE} 
 */
export AddPrintDeviceObject(hPrinter) {
    phDeviceObject := HANDLE.Owned()
    result := DllCall("SPOOLSS.dll\AddPrintDeviceObject", PRINTER_HANDLE, hPrinter, HANDLE.Ptr, phDeviceObject, "HRESULT")
    return phDeviceObject
}

/**
 * 
 * @param {PRINTER_HANDLE} hPrinter 
 * @param {HANDLE} hDeviceObject 
 * @returns {HRESULT} 
 */
export UpdatePrintDeviceObject(hPrinter, hDeviceObject) {
    result := DllCall("SPOOLSS.dll\UpdatePrintDeviceObject", PRINTER_HANDLE, hPrinter, HANDLE, hDeviceObject, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} hDeviceObject 
 * @returns {HRESULT} 
 */
export RemovePrintDeviceObject(hDeviceObject) {
    result := DllCall("SPOOLSS.dll\RemovePrintDeviceObject", HANDLE, hDeviceObject, "HRESULT")
    return result
}

;@endregion Functions

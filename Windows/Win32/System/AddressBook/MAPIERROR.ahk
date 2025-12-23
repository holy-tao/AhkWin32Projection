#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the MAPIERROR function and provides syntax, members, additional remarks, and links to additional resources.
 * @remarks
 * The **MAPIERROR** structure is used to describe error information. Clients and service providers pass a pointer to a **MAPIERROR** structure in the _lppMAPIError_ parameter of the [IMAPIProp::GetLastError](imapiprop-getlasterror.md) method. **GetLastError** returns information about the previous error that has occurred to an object. Callers of **GetLastError** free the memory for the **MAPIERROR** structure by calling [MAPIFreeBuffer](mapifreebuffer.md).
 *   
 * The **lpszComponent** member can be used to map the component's Help file, if one exists. Service providers should limit the size of the component string to 30 characters so that it can easily be displayed in a dialog box. The **ulContext** member can also be used to refer to an online Help topic for common errors. 
 *   
 * Because service providers are not required to provide detailed error information, clients should not expect any of the members of the **MAPIERROR** structure that are returned to contain valid data. However, at a minimum MAPI strongly recommends that providers specify information in the **lpszComponent** and **ulContext** members. 
 *   
 * For more information about error handling in MAPI, see [Error Handling](error-handling-in-mapi.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapierror
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class MAPIERROR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * > Version number of the structure. The **ulVersion** member is used for future expansion and should be set to MAPI_ERROR_VERSION, which is currently defined as zero.
     * @type {Integer}
     */
    ulVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Pointer to a string that describes the error. This string will be in Unicode format if the _ulFlags_ parameter to the method in which this structure is used is set to MAPI_UNICODE.
     * @type {Pointer<Integer>}
     */
    lpszError {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * > Pointer to a string that describes the component that generated the error. This string will be in Unicode format if the _ulFlags_ parameter to the method in which this structure is used is set to MAPI_UNICODE.
     * @type {Pointer<Integer>}
     */
    lpszComponent {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * > Low-level error value that is used only when the error to be returned is low-level.
     * @type {Integer}
     */
    ulLowLevelError {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * > Value that represents the location in the component pointed to by the **lpszComponent** member that identifies where the error occurred.
     * @type {Integer}
     */
    ulContext {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

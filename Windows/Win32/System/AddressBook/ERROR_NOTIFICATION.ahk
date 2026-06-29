#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MAPIERROR.ahk" { MAPIERROR }
#Import ".\ENTRYID.ahk" { ENTRYID }

/**
 * Describes information that relate to a critical error. This causes an error notification to be generated.
 * @remarks
 * The **ERROR_NOTIFICATION** structure is one of the members of the union of structures included in the **info** member of the [NOTIFICATION](notification.md) structure. When the **info** member of a **NOTIFICATION** structure contains an **ERROR_NOTIFICATION** structure, the **ulEventType** member of the **NOTIFICATION** structure is set to  _fnevCriticalError_.
 *   
 * The value of the **cbEntryID** member and the **lpEntryID** member can be NULL. 
 *   
 * For more information about notification, see the topics described in the following table.
 *   
 * |**Topic**|**Description**|
 * |:-----|:-----|
 * |[Event Notification in MAPI](event-notification-in-mapi.md) <br/> |General overview of notification and notification events. |
 * |[Handling Notifications](handling-notifications.md) <br/> |Discussion of how clients should handle notifications. |
 * |[Supporting Event Notification](supporting-event-notification.md) <br/> |Discussion of how service providers can use the **IMAPISupport** method to generate notifications. |
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/error_notification
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct ERROR_NOTIFICATION {
    #StructPack 8

    /**
     * > Count of bytes in the entry identifier pointed to by **lpEntryID**.
     */
    cbEntryID : UInt32

    /**
     * > Pointer to the entry identifier of the object that causes the error.
     */
    lpEntryID : ENTRYID.Ptr

    /**
     * > Error value for the critical error.
     */
    scode : Int32

    /**
     * > Bitmask of flags used to designate the format of the text pointed to by the **lpszError** member in the structure pointed to by **lpMAPIError**. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The passed-in strings are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     */
    ulFlags : UInt32

    /**
     * > Pointer to a [MAPIERROR](mapierror.md) structure describing the error.
     */
    lpMAPIError : MAPIERROR.Ptr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFPOLICYMANAGER_ACTION.ahk" { MFPOLICYMANAGER_ACTION }

/**
 * Describes an action requested by an output trust authority (OTA). The request is sent to an input trust authority (ITA).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfinputtrustauthority_access_action
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFINPUTTRUSTAUTHORITY_ACCESS_ACTION {
    #StructPack 8

    /**
     * Specifies the action as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpolicymanager_action">MFPOLICYMANAGER_ACTION</a> enumeration.
     */
    Action : MFPOLICYMANAGER_ACTION

    /**
     * Pointer to a buffer that contains a ticket object, provided by the OTA.
     */
    pbTicket : IntPtr

    /**
     * Size of the ticket object, in bytes.
     */
    cbTicket : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * ISCSI_TARGET_PORTAL_INFO structure contains information about a target portal. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_TARGET_PORTAL_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_infow
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @charset Unicode
 */
export default struct ISCSI_TARGET_PORTAL_INFOW {
    #StructPack 4

    /**
     * A string representing the name of the Host-Bus Adapter initiator.
     */
    InitiatorName : WCHAR[256]

    /**
     * The port number on the Host-Bus Adapter (HBA) associated with the portal. This port number corresponds to the source IP address on the HBA
     */
    InitiatorPortNumber : UInt32

    /**
     * A string representing the symbolic name of the portal.
     */
    SymbolicName : WCHAR[256]

    /**
     * A string representing the IP address or DNS name of the portal.
     */
    Address : WCHAR[256]

    /**
     * The socket number.
     */
    Socket : UInt16

}

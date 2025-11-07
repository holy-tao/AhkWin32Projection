#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * ISCSI_TARGET_PORTAL_INFO structure contains information about a target portal.
 * @remarks
 * 
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_TARGET_PORTAL_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/ns-iscsidsc-iscsi_target_portal_infow
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset Unicode
 */
class ISCSI_TARGET_PORTAL_INFOW extends Win32Struct
{
    static sizeof => 1544

    static packingSize => 4

    /**
     * A string representing the name of the Host-Bus Adapter initiator.
     * @type {String}
     */
    InitiatorName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * The port number on the Host-Bus Adapter (HBA) associated with the portal. This port number corresponds to the source IP address on the HBA
     * @type {Integer}
     */
    InitiatorPortNumber {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }

    /**
     * A string representing the symbolic name of the portal.
     * @type {String}
     */
    SymbolicName {
        get => StrGet(this.ptr + 516, 255, "UTF-16")
        set => StrPut(value, this.ptr + 516, 255, "UTF-16")
    }

    /**
     * A string representing the IP address or DNS name of the portal.
     * @type {String}
     */
    Address {
        get => StrGet(this.ptr + 1028, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1028, 255, "UTF-16")
    }

    /**
     * The socket number.
     * @type {Integer}
     */
    Socket {
        get => NumGet(this, 1540, "ushort")
        set => NumPut("ushort", value, this, 1540)
    }
}

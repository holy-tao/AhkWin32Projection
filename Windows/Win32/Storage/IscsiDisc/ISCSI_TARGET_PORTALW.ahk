#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * ISCSI_TARGET_PORTAL structure contains information about a portal. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The iscsidsc.h header defines ISCSI_TARGET_PORTAL as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_target_portalw
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset Unicode
 */
class ISCSI_TARGET_PORTALW extends Win32Struct
{
    static sizeof => 1026

    static packingSize => 2

    /**
     * A string representing the name of the portal.
     * @type {String}
     */
    SymbolicName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * A string representing the IP address or DNS name of the portal.
     * @type {String}
     */
    Address {
        get => StrGet(this.ptr + 512, 255, "UTF-16")
        set => StrPut(value, this.ptr + 512, 255, "UTF-16")
    }

    /**
     * The socket number of the portal.
     * @type {Integer}
     */
    Socket {
        get => NumGet(this, 1024, "ushort")
        set => NumPut("ushort", value, this, 1024)
    }
}

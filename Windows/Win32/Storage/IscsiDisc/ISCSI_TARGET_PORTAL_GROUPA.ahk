#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_TARGET_PORTALA.ahk

/**
 * ISCSI_TARGET_PORTAL_GROUP. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The iscsidsc.h header defines ISCSI_TARGET_PORTAL_GROUP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_groupa
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset ANSI
 */
class ISCSI_TARGET_PORTAL_GROUPA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of portals in the portal group.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> structures that describe the portals associated with the portal group. Portal names and addresses are described by either wide-character or ascii strings, depending upon implementation.
     * @type {Array<ISCSI_TARGET_PORTALA>}
     */
    Portals{
        get {
            if(!this.HasProp("__PortalsProxyArray"))
                this.__PortalsProxyArray := Win32FixedArray(this.ptr + 8, 1, ISCSI_TARGET_PORTALA, "")
            return this.__PortalsProxyArray
        }
    }
}

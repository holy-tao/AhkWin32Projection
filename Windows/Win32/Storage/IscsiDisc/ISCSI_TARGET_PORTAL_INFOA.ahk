#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * ISCSI_TARGET_PORTAL_INFO structure contains information about a target portal. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The iscsidsc.h header defines ISCSI_TARGET_PORTAL_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_target_portal_infoa
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset ANSI
 */
class ISCSI_TARGET_PORTAL_INFOA extends Win32Struct
{
    static sizeof => 776

    static packingSize => 4

    /**
     * A string representing the name of the Host-Bus Adapter initiator.
     * @type {Array<SByte>}
     */
    InitiatorName{
        get {
            if(!this.HasProp("__InitiatorNameProxyArray"))
                this.__InitiatorNameProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "char")
            return this.__InitiatorNameProxyArray
        }
    }

    /**
     * The port number on the Host-Bus Adapter (HBA) associated with the portal. This port number corresponds to the source IP address on the HBA
     * @type {Integer}
     */
    InitiatorPortNumber {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * A string representing the symbolic name of the portal.
     * @type {Array<SByte>}
     */
    SymbolicName{
        get {
            if(!this.HasProp("__SymbolicNameProxyArray"))
                this.__SymbolicNameProxyArray := Win32FixedArray(this.ptr + 260, 256, Primitive, "char")
            return this.__SymbolicNameProxyArray
        }
    }

    /**
     * A string representing the IP address or DNS name of the portal.
     * @type {Array<SByte>}
     */
    Address{
        get {
            if(!this.HasProp("__AddressProxyArray"))
                this.__AddressProxyArray := Win32FixedArray(this.ptr + 516, 256, Primitive, "char")
            return this.__AddressProxyArray
        }
    }

    /**
     * The socket number.
     * @type {Integer}
     */
    Socket {
        get => NumGet(this, 772, "ushort")
        set => NumPut("ushort", value, this, 772)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * The LSA_OBJECT_ATTRIBUTES structure is used with the LsaOpenPolicy function to specify the attributes of the connection to the Policy object.
 * @remarks
 * 
  * The <b>LSA_OBJECT_ATTRIBUTES</b> structure is defined in the LsaLookup.h header file.
  * 
  * <b>Windows Server 2008 with SP2 and earlier, Windows Vista with SP2 and earlier, Windows Server 2003, Windows XP/2000:  </b>The <b>LSA_OBJECT_ATTRIBUTES</b> structure is defined in the NTSecAPI.h header file.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lsalookup/ns-lsalookup-lsa_object_attributes
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_OBJECT_ATTRIBUTES extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the size, in bytes, of the <b>LSA_OBJECT_ATTRIBUTES</b> structure.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Should be <b>NULL</b>.
     * @type {HANDLE}
     */
    RootDirectory{
        get {
            if(!this.HasProp("__RootDirectory"))
                this.__RootDirectory := HANDLE(this.ptr + 8)
            return this.__RootDirectory
        }
    }

    /**
     * Should be <b>NULL</b>.
     * @type {Pointer<LSA_UNICODE_STRING>}
     */
    ObjectName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Should be zero.
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Should be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    SecurityDescriptor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Should be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    SecurityQualityOfService {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

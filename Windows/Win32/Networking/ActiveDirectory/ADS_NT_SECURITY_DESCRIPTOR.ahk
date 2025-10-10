#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_NT_SECURITY_DESCRIPTOR structure defines the data type of the security descriptor for Windows.
 * @remarks
 * 
  * The <b>ADS_NT_SECURITY_DESCRIPTOR</b> structure is normally used as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structure definition.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_nt_security_descriptor
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_NT_SECURITY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length data, in bytes.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the security descriptor, represented as a byte array.
     * @type {Pointer<Byte>}
     */
    lpValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

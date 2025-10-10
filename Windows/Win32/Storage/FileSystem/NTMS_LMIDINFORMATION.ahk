#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NTMS_LMIDINFORMATION structure defines the properties specific to a logical media object.
 * @remarks
 * 
  * The 
  * <b>NTMS_LMIDINFORMATION</b> structure is included in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntmsapi/ns-ntmsapi-ntms_lmidinformation
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NTMS_LMIDINFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Unique identifier of the media pool that contains the logical media.
     * @type {Pointer<Guid>}
     */
    MediaPool {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of sides in the media object.
     * @type {Integer}
     */
    dwNumberOfPartitions {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

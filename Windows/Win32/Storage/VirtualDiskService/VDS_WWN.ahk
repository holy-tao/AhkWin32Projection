#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_WWN structure (vdshwprv.h) defines a world-wide name (WWN). This structure corresponds to the HBA_WWN structure defined by the ANSI HBA API.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_wwn
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_WWN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * An array of 8 bytes that together specify the 64-bit WWN value. The first element of the array is the most 
     *       significant byte of the WWN, with the most significant bit of that byte being the most significant bit of the 
     *       WWN.
     * @type {Array<Byte>}
     */
    rguchWwn{
        get {
            if(!this.HasProp("__rguchWwnProxyArray"))
                this.__rguchWwnProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__rguchWwnProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CCAB structure contains cabinet information.
 * @see https://learn.microsoft.com/windows/win32/api/fci/ns-fci-ccab
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class CCAB extends Win32Struct
{
    static sizeof => 804

    static packingSize => 4

    /**
     * The maximum size, in bytes, of a cabinet  created by FCI.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum size, in bytes, that  a folder will contain before a new folder is created.
     * @type {Integer}
     */
    cbFolderThresh {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the CFHeader reserve area. Possible value range is 0-60,000.
     * @type {Integer}
     */
    cbReserveCFHeader {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size, in bytes, of the CFFolder reserve area. Possible value range is 0-255.
     * @type {Integer}
     */
    cbReserveCFFolder {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size, in bytes, of the CFData reserve area. Possible value range is 0-255.
     * @type {Integer}
     */
    cbReserveCFData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of created cabinets.
     * @type {Integer}
     */
    iCab {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The maximum size, in bytes, of a cabinet  created by FCI.
     * @type {Integer}
     */
    iDisk {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * TBD
     * @type {Integer}
     */
    fFailOnIncompressible {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * A value that represents the association between a collection of linked cabinet files.
     * @type {Integer}
     */
    setID {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * The name of the disk on which the cabinet is placed.
     * @type {Array<SByte>}
     */
    szDisk{
        get {
            if(!this.HasProp("__szDiskProxyArray"))
                this.__szDiskProxyArray := Win32FixedArray(this.ptr + 34, 256, Primitive, "char")
            return this.__szDiskProxyArray
        }
    }

    /**
     * The name of the cabinet.
     * @type {Array<SByte>}
     */
    szCab{
        get {
            if(!this.HasProp("__szCabProxyArray"))
                this.__szCabProxyArray := Win32FixedArray(this.ptr + 290, 256, Primitive, "char")
            return this.__szCabProxyArray
        }
    }

    /**
     * The full path that indicates where to create the cabinet.
     * @type {Array<SByte>}
     */
    szCabPath{
        get {
            if(!this.HasProp("__szCabPathProxyArray"))
                this.__szCabPathProxyArray := Win32FixedArray(this.ptr + 546, 256, Primitive, "char")
            return this.__szCabPathProxyArray
        }
    }
}

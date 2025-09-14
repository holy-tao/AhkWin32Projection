#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The header of an opened user dictionary file. Used to get the user dictionary's properties, such as version, title, description, and copyright.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-imeshf
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMESHF extends Win32Struct
{
    static sizeof => 436

    static packingSize => 1

    /**
     * The size of this structure. You must set this value before using the structure.
     * @type {Integer}
     */
    cbShf {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Dictionary version.
     * @type {Integer}
     */
    verDic {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Dictionary title.
     * @type {Array<SByte>}
     */
    szTitle{
        get {
            if(!this.HasProp("__szTitleProxyArray"))
                this.__szTitleProxyArray := Win32FixedArray(this.ptr + 4, 48, Primitive, "char")
            return this.__szTitleProxyArray
        }
    }

    /**
     * Dictionary description.
     * @type {Array<SByte>}
     */
    szDescription{
        get {
            if(!this.HasProp("__szDescriptionProxyArray"))
                this.__szDescriptionProxyArray := Win32FixedArray(this.ptr + 52, 256, Primitive, "char")
            return this.__szDescriptionProxyArray
        }
    }

    /**
     * Dictionary copyright information.
     * @type {Array<SByte>}
     */
    szCopyright{
        get {
            if(!this.HasProp("__szCopyrightProxyArray"))
                this.__szCopyrightProxyArray := Win32FixedArray(this.ptr + 308, 128, Primitive, "char")
            return this.__szCopyrightProxyArray
        }
    }
}

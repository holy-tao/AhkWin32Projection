#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A variable-size structure that contains information about a menu file name.
 * @remarks
 * <div class="alert"><b>Important</b>  This structure cannot be used with operating systems later than Windows 2000.</div>
  * <div> </div>
  * When reading an <b>AASHELLMENUFILENAME</b> structure, first read a single SHORT to determine the total size of the structure, then use that value to read the remainder of the structure.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-aashellmenufilename
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class AASHELLMENUFILENAME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * Type: <b>SHORT</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbTotal {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Type: <b>BYTE[12]</b>
     * 
     * Reserved. Applications should ignore this value.
     * @type {Array<Byte>}
     */
    rgbReserved{
        get {
            if(!this.HasProp("__rgbReservedProxyArray"))
                this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 2, 12, Primitive, "char")
            return this.__rgbReservedProxyArray
        }
    }

    /**
     * Type: <b>TCHAR[1]</b>
     * 
     * The menu file name. This string is in Unicode on Windows 2000.
     * @type {String}
     */
    szFileName {
        get => StrGet(this.ptr + 14, 0, "UTF-16")
        set => StrPut(value, this.ptr + 14, 0, "UTF-16")
    }
}

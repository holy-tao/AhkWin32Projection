#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to initialize the Link tab of the Object Properties dialog box.
 * @remarks
 * 
  * > [!NOTE]
  * > The oledlg.h header defines OLEUILINKPROPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/ns-oledlg-oleuilinkpropsw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class OLEUILINKPROPSW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains in/out flags specific to the <b>Links</b> page.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This member is reserved.
     * @type {Array<UInt32>}
     */
    dwReserved1{
        get {
            if(!this.HasProp("__dwReserved1ProxyArray"))
                this.__dwReserved1ProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "uint")
            return this.__dwReserved1ProxyArray
        }
    }

    /**
     * Pointer to the hook callback (not used in this dialog box).
     * @type {Pointer<LPFNOLEUIHOOK>}
     */
    lpfnHook {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Custom data to pass to hook (not used in this dialog box).
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * This member is reserved.
     * @type {Array<UInt32>}
     */
    dwReserved2{
        get {
            if(!this.HasProp("__dwReserved2ProxyArray"))
                this.__dwReserved2ProxyArray := Win32FixedArray(this.ptr + 32, 3, Primitive, "uint")
            return this.__dwReserved2ProxyArray
        }
    }

    /**
     * Used internally.
     * @type {Pointer<OLEUIOBJECTPROPSW>}
     */
    lpOP {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Initializes the General tab of the Object Properties dialog box. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The oledlg.h header defines OLEUIGNRLPROPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuignrlpropsw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class OLEUIGNRLPROPSW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the structure, in bytes. This field must be filled on input.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Currently no flags associated with this member. It should be set to 0 (zero).
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
                this.__dwReserved1ProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__dwReserved1ProxyArray
        }
    }

    /**
     * Pointer to a hook function that processes messages intended for the dialog box. The hook function must return zero to pass a message that it didn't process back to the dialog box procedure in the library. The hook function must return a nonzero value to prevent the library's dialog box procedure from processing a message it has already processed.
     * @type {Pointer<Ptr>}
     */
    lpfnHook {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Application-defined data that the library passes to the hook function pointed to by the <b>lpfnHook</b> member during WM_INITDIALOG.
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
                this.__dwReserved2ProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "uint")
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

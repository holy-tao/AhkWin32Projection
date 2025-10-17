#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Used in the WNetDisconnectDialog1 function. The structure contains required information for the disconnect attempt.
 * @remarks
 * 
  * > [!NOTE]
  * > The winnetwk.h header defines DISCDLGSTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnetwk/ns-winnetwk-discdlgstructw
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 * @charset Unicode
 */
class DISCDLGSTRUCTW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the 
     * <b>DISCDLGSTRUCT</b> structure. The caller must supply this value.
     * @type {Integer}
     */
    cbStructure {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the owner window of the dialog box.
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(8, this)
            return this.__hwndOwner
        }
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated  string that specifies the local device name that is redirected to the network resource, such as "F:" or "LPT1".
     * @type {PWSTR}
     */
    lpLocalName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to a <b>NULL</b>-terminated  string that specifies the name of the network resource to disconnect. This member can be NULL if the <b>lpLocalName</b> member is specified. When <b>lpLocalName</b> is specified, the connection to the network resource redirected from <b>lpLocalName</b>  is disconnected.
     * @type {PWSTR}
     */
    lpRemoteName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The GPOBROWSEINFO structure contains information that the BrowseForGPO function uses to initialize a GPO browser dialog box. After the user closes the dialog box, the system returns information about the user's actions in this structure.
 * @see https://learn.microsoft.com/windows/win32/api/gpedit/ns-gpedit-gpobrowseinfo
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPOBROWSEINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies the size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the handle to the parent window. If this member is <b>NULL</b>, the dialog box has no owner.
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(this.ptr + 8)
            return this.__hwndOwner
        }
    }

    /**
     * Specifies the title bar text. If this member is <b>NULL</b>, the title bar text is <b>Browse for a Group Policy Object</b>.
     * @type {PWSTR}
     */
    lpTitle{
        get {
            if(!this.HasProp("__lpTitle"))
                this.__lpTitle := PWSTR(this.ptr + 16)
            return this.__lpTitle
        }
    }

    /**
     * Specifies the initial domain or organizational unit.
     * @type {PWSTR}
     */
    lpInitialOU{
        get {
            if(!this.HasProp("__lpInitialOU"))
                this.__lpInitialOU := PWSTR(this.ptr + 24)
            return this.__lpInitialOU
        }
    }

    /**
     * Pointer to a buffer that receives the Active Directory path of the GPO.
     * @type {PWSTR}
     */
    lpDSPath{
        get {
            if(!this.HasProp("__lpDSPath"))
                this.__lpDSPath := PWSTR(this.ptr + 32)
            return this.__lpDSPath
        }
    }

    /**
     * Specifies the size, in characters, of the <b>lpDSPath</b> buffer.
     * @type {Integer}
     */
    dwDSPathSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Pointer to a buffer that receives either the computer name or the friendly (display) name of the GPO. If the user opens or creates a GPO in the <b>Computers</b> tab, this member contains the computer name. If the user opens or creates a GPO in the Active Directory, this member contains the friendly name. To determine the GPO type, see the description for the <b>gpoType</b> member.
     * 
     * This member can be <b>NULL</b>.
     * @type {PWSTR}
     */
    lpName{
        get {
            if(!this.HasProp("__lpName"))
                this.__lpName := PWSTR(this.ptr + 48)
            return this.__lpName
        }
    }

    /**
     * Specifies the size, in characters, of the <b>lpName</b> buffer.
     * @type {Integer}
     */
    dwNameSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    gpoType {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * 
     * @type {Integer}
     */
    gpoHint {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Stores information for the SHOpenWithDialog function.
 * @remarks
 * 
  * Starting in Windows 10, the <b>OAIF_ALLOW_REGISTRATION</b>, <b>OAIF_FORCE_REGISTRATION</b>, and <b>OAIF_HIDE_REGISTRATION</b> flags will be ignored by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shopenwithdialog">SHOpenWithDialog</a>. The <b>Open With</b> dialog box can no longer be used to change the default program used to open a file extension. You can only use <b>SHOpenWithDialog</b> to open a single file.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-openasinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class OPENASINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to the file name.
     * @type {PWSTR}
     */
    pcszFile{
        get {
            if(!this.HasProp("__pcszFile"))
                this.__pcszFile := PWSTR(this.ptr + 0)
            return this.__pcszFile
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to the file type description. Set this parameter to <b>NULL</b> to use the file name extension of <b>pcszFile</b>.
     * @type {PWSTR}
     */
    pcszClass{
        get {
            if(!this.HasProp("__pcszClass"))
                this.__pcszClass := PWSTR(this.ptr + 8)
            return this.__pcszClass
        }
    }

    /**
     * Type: <b>OPEN_AS_INFO_FLAGS</b>
     * @type {Integer}
     */
    oaifInFlags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}

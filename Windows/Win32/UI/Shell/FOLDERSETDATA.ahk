#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FOLDERSETTINGS.ahk

/**
 * Deprecated. Data used in IBrowserService2::GetFolderSetData.
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/ns-shdeprecated-foldersetdata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FOLDERSETDATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure containing folder view informtion.
     * @type {FOLDERSETTINGS}
     */
    _fs{
        get {
            if(!this.HasProp("___fs"))
                this.___fs := FOLDERSETTINGS(0, this)
            return this.___fs
        }
    }

    /**
     * Type: <b>SHELLVIEWID</b>
     * 
     * The last view used for this folder, used as a suggestion for this visit.
     * @type {Pointer<Guid>}
     */
    _vidRestore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    _dwViewPriority {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

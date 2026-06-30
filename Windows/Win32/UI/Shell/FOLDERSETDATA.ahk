#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FOLDERSETTINGS.ahk

/**
 * Deprecated. Data used in IBrowserService2::GetFolderSetData.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-foldersetdata
 * @namespace Windows.Win32.UI.Shell
 */
class FOLDERSETDATA extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-foldersettings">FOLDERSETTINGS</a> structure containing folder view information.
     * @type {FOLDERSETTINGS}
     */
    _fs {
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
     * @type {Guid}
     */
    _vidRestore {
        get {
            if(!this.HasProp("___vidRestore"))
                this.___vidRestore := Guid(8, this)
            return this.___vidRestore
        }
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    _dwViewPriority {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

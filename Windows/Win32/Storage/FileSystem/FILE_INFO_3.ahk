#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the identification number and other pertinent information about files, devices, and pipes.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-file_info_3
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_INFO_3 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies a DWORD value that contains the identification number assigned to the resource when it is opened.
     * @type {Integer}
     */
    fi3_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    fi3_permissions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies a DWORD value that contains the number of file locks on the file, device, or pipe.
     * @type {Integer}
     */
    fi3_num_locks {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a string that specifies the path of the opened resource.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    fi3_pathname{
        get {
            if(!this.HasProp("__fi3_pathname"))
                this.__fi3_pathname := PWSTR(this.ptr + 16)
            return this.__fi3_pathname
        }
    }

    /**
     * Pointer to a string that specifies which user (on servers that have user-level security) or which computer (on servers that have share-level security) opened the resource. Note that Windows does not support share-level security.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    fi3_username{
        get {
            if(!this.HasProp("__fi3_username"))
                this.__fi3_username := PWSTR(this.ptr + 24)
            return this.__fi3_username
        }
    }
}

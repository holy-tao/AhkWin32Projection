#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FILE_INFO_FLAGS_PERMISSIONS.ahk" { FILE_INFO_FLAGS_PERMISSIONS }

/**
 * Contains the identification number and other pertinent information about files, devices, and pipes.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-file_info_3
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_INFO_3 {
    #StructPack 8

    /**
     * Specifies a DWORD value that contains the identification number assigned to the resource when it is opened.
     */
    fi3_id : UInt32

    fi3_permissions : FILE_INFO_FLAGS_PERMISSIONS

    /**
     * Specifies a DWORD value that contains the number of file locks on the file, device, or pipe.
     */
    fi3_num_locks : UInt32

    /**
     * Pointer to a string that specifies the path of the opened resource.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    fi3_pathname : PWSTR

    /**
     * Pointer to a string that specifies which user (on servers that have user-level security) or which computer (on servers that have share-level security) opened the resource. Note that Windows does not support share-level security.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    fi3_username : PWSTR

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CLUSTER_VALIDATE_DIRECTORY (clusapi.h) structure passes in the directory to validate, with more information to be determined.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_validate_directory
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_VALIDATE_DIRECTORY extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * 
     * @type {String}
     */
    szPath {
        get => StrGet(this.ptr + 0, 0, "UTF-16")
        set => StrPut(value, this.ptr + 0, 0, "UTF-16")
    }
}

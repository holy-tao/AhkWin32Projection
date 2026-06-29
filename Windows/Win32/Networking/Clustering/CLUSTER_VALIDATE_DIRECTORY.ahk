#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The CLUSTER_VALIDATE_DIRECTORY (clusapi.h) structure passes in the directory to validate, with more information to be determined.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-cluster_validate_directory
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_VALIDATE_DIRECTORY {
    #StructPack 2

    szPath : WCHAR[1]

}

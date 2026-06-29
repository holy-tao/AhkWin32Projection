#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The CLUSTERVERSIONINFO_NT4 (clusapi.h) structure relates to multiple field types, with more information is to be determined.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusterversioninfo_nt4
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTERVERSIONINFO_NT4 {
    #StructPack 4

    /**
     * Contains the  size, in bytes, of the data structure. Users must set this size prior to calling the  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusterinformation">GetClusterInformation</a>   function.
     */
    dwVersionInfoSize : UInt32

    /**
     * Identifies the major version number of the operating system that is  installed on the local node. For example, for 
     *       version X.Y, the major version number is X.
     */
    MajorVersion : UInt16

    /**
     * Identifies the minor version number of the operating system that is  installed on the local node. For example, for 
     *       version X.Y, the minor version number is Y.
     */
    MinorVersion : UInt16

    /**
     * Identifies the build number of the operating system that is  installed on the local node, such as 224.
     */
    BuildNumber : UInt16

    /**
     * Contains the vendor identifier information for the cluster service that is  installed on the local node.
     */
    szVendorId : WCHAR[64]

    /**
     * Contains the latest service pack that is  installed on the node. If a Service Pack is not installed, the 
     *       <b>szCSDVersion</b> member is empty.
     */
    szCSDVersion : WCHAR[64]

}

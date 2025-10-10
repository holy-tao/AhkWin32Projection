#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * TBD.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusterversioninfo_nt4
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTERVERSIONINFO_NT4 extends Win32Struct
{
    static sizeof => 268

    static packingSize => 4

    /**
     * Contains the  size, in bytes, of the data structure. Users must set this size prior to calling the  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusterinformation">GetClusterInformation</a>   function.
     * @type {Integer}
     */
    dwVersionInfoSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifies the major version number of the operating system that is  installed on the local node. For example, for 
     *       version X.Y, the major version number is X.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Identifies the minor version number of the operating system that is  installed on the local node. For example, for 
     *       version X.Y, the minor version number is Y.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Identifies the build number of the operating system that is  installed on the local node, such as 224.
     * @type {Integer}
     */
    BuildNumber {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Contains the vendor identifier information for the cluster service that is  installed on the local node.
     * @type {String}
     */
    szVendorId {
        get => StrGet(this.ptr + 10, 63, "UTF-16")
        set => StrPut(value, this.ptr + 10, 63, "UTF-16")
    }

    /**
     * Contains the latest service pack that is  installed on the node. If a Service Pack is not installed, the 
     *       <b>szCSDVersion</b> member is empty.
     * @type {String}
     */
    szCSDVersion {
        get => StrGet(this.ptr + 138, 63, "UTF-16")
        set => StrPut(value, this.ptr + 138, 63, "UTF-16")
    }
}

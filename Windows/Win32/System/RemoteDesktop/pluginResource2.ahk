#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\pluginResource.ahk

/**
 * Contains additional information about a resource that can be assigned to users in RemoteApp and Desktop Connection.
 * @remarks
 * The <b>pluginFolderName</b> type is defined as follows:
  * 
  * <c>typedef [string] WCHAR* pluginFolderName;</c>
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/ns-tspubplugin2com-pluginresource2
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class pluginResource2 extends Win32Struct
{
    static sizeof => 2136

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tspubplugincom/ns-tspubplugincom-pluginresource">pluginResource</a> structure that contains the basic information about the resource.
     * @type {pluginResource}
     */
    resourceV1{
        get {
            if(!this.HasProp("__resourceV1"))
                this.__resourceV1 := pluginResource(this.ptr + 0)
            return this.__resourceV1
        }
    }

    /**
     * Reserved for future use. This member must be zero.
     * @type {Integer}
     */
    pceFileAssocListSize {
        get => NumGet(this, 2096, "uint")
        set => NumPut("uint", value, this, 2096)
    }

    /**
     * Reserved for future use. This member must be <b>NULL</b>.
     * @type {Pointer<pluginResource2FileAssociation>}
     */
    fileAssocList {
        get => NumGet(this, 2104, "ptr")
        set => NumPut("ptr", value, this, 2104)
    }

    /**
     * A string representation of a security descriptor used to specify the domain users and groups that have access to the resource. For more information about security descriptor strings, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>.
     * @type {Pointer<Ptr>}
     */
    securityDescriptor {
        get => NumGet(this, 2112, "ptr")
        set => NumPut("ptr", value, this, 2112)
    }

    /**
     * The number of strings in the <b>folderList</b> array.
     * @type {Integer}
     */
    pceFolderListSize {
        get => NumGet(this, 2120, "uint")
        set => NumPut("uint", value, this, 2120)
    }

    /**
     * An array of pointers to null-terminated strings that contain the names of the folders that the resource should be displayed in. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function to allocate these strings. The caller is responsible for freeing these strings.
     * @type {Pointer<UInt16>}
     */
    folderList {
        get => NumGet(this, 2128, "ptr")
        set => NumPut("ptr", value, this, 2128)
    }
}

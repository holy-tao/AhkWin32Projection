#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\pluginResource2FileAssociation.ahk" { pluginResource2FileAssociation }
#Import ".\pluginResource.ahk" { pluginResource }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains additional information about a resource that can be assigned to users in RemoteApp and Desktop Connection.
 * @remarks
 * The <b>pluginFolderName</b> type is defined as follows:
 * 
 * <c>typedef [string] WCHAR* pluginFolderName;</c>
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugin2com/ns-tspubplugin2com-pluginresource2
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct pluginResource2 {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/tspubplugincom/ns-tspubplugincom-pluginresource">pluginResource</a> structure that contains the basic information about the resource.
     */
    resourceV1 : pluginResource

    /**
     * Reserved for future use. This member must be zero.
     */
    pceFileAssocListSize : UInt32

    /**
     * Reserved for future use. This member must be <b>NULL</b>.
     */
    fileAssocList : pluginResource2FileAssociation.Ptr

    /**
     * A string representation of a security descriptor used to specify the domain users and groups that have access to the resource. For more information about security descriptor strings, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>.
     */
    securityDescriptor : PWSTR

    /**
     * The number of strings in the <b>folderList</b> array.
     */
    pceFolderListSize : UInt32

    /**
     * An array of pointers to null-terminated strings that contain the names of the folders that the resource should be displayed in. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function to allocate these strings. The caller is responsible for freeing these strings.
     */
    folderList : IntPtr

}

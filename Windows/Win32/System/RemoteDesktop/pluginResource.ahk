#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a resource that can be assigned to users in RemoteApp and Desktop Connection.
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/ns-tspubplugincom-pluginresource
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct pluginResource {
    #StructPack 8

    /**
     * The  alias of the resource.
     */
    alias : WCHAR[256]

    /**
     * The  name of the resource.
     */
    name : WCHAR[256]

    /**
     * The contents of the resource file. The plug-in should allocate memory for this member by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function.
     */
    resourceFileContents : PWSTR

    /**
     * The file name extension of the resource file. If this member is set to ".rdp", RD Web Access opens the file by using the ActiveX control.
     */
    fileExtension : WCHAR[256]

    /**
     * A unique identifier that identifies the resource plug-in.
     */
    resourcePluginType : WCHAR[256]

    /**
     * A Boolean value that indicates whether the resource should be displayed in RD Web Access or RemoteApp and Desktop Connections.
     */
    isDiscoverable : Int8

    /**
     * The type of resource.
     */
    resourceType : Int32

    /**
     * The size, in bytes, of the icon.
     */
    pceIconSize : UInt32

    /**
     * A byte array that defines the icon to be displayed for the resource.
     */
    iconContents : IntPtr

    /**
     * The size, in bytes, of the <b>blobContents</b> member.
     */
    pcePluginBlobSize : UInt32

    /**
     * This member is reserved. Set it to <b>NULL</b>.
     */
    blobContents : IntPtr

}

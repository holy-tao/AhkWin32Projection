#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a resource that can be assigned to users in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//tspubplugincom/ns-tspubplugincom-pluginresource
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class pluginResource extends Win32Struct
{
    static sizeof => 2096

    static packingSize => 8

    /**
     * The  alias of the resource.
     * @type {String}
     */
    alias {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * The  name of the resource.
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 512, 255, "UTF-16")
        set => StrPut(value, this.ptr + 512, 255, "UTF-16")
    }

    /**
     * The contents of the resource file. The plug-in should allocate memory for this member by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function.
     * @type {PWSTR}
     */
    resourceFileContents {
        get => NumGet(this, 1024, "ptr")
        set => NumPut("ptr", value, this, 1024)
    }

    /**
     * The file name extension of the resource file. If this member is set to ".rdp", RD Web Access opens the file by using the ActiveX control.
     * @type {String}
     */
    fileExtension {
        get => StrGet(this.ptr + 1032, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1032, 255, "UTF-16")
    }

    /**
     * A unique identifier that identifies the resource plug-in.
     * @type {String}
     */
    resourcePluginType {
        get => StrGet(this.ptr + 1544, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1544, 255, "UTF-16")
    }

    /**
     * A Boolean value that indicates whether the resource should be displayed in RD Web Access or RemoteApp and Desktop Connections.
     * @type {Integer}
     */
    isDiscoverable {
        get => NumGet(this, 2056, "char")
        set => NumPut("char", value, this, 2056)
    }

    /**
     * The type of resource.
     * @type {Integer}
     */
    resourceType {
        get => NumGet(this, 2060, "int")
        set => NumPut("int", value, this, 2060)
    }

    /**
     * The size, in bytes, of the icon.
     * @type {Integer}
     */
    pceIconSize {
        get => NumGet(this, 2064, "uint")
        set => NumPut("uint", value, this, 2064)
    }

    /**
     * A byte array that defines the icon to be displayed for the resource.
     * @type {Pointer<Byte>}
     */
    iconContents {
        get => NumGet(this, 2072, "ptr")
        set => NumPut("ptr", value, this, 2072)
    }

    /**
     * The size, in bytes, of the <b>blobContents</b> member.
     * @type {Integer}
     */
    pcePluginBlobSize {
        get => NumGet(this, 2080, "uint")
        set => NumPut("uint", value, this, 2080)
    }

    /**
     * This member is reserved. Set it to <b>NULL</b>.
     * @type {Pointer<Byte>}
     */
    blobContents {
        get => NumGet(this, 2088, "ptr")
        set => NumPut("ptr", value, this, 2088)
    }
}

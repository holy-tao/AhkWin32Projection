#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PACKAGE_VERSION.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Represents package identification information, such as name, version, and publisher.
 * @remarks
 * 
  * For info about string size limits, see <a href="https://docs.microsoft.com/windows/desktop/appxpkg/identity-constants">Identity constants</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appmodel/ns-appmodel-package_id
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PACKAGE_ID extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a></b>
     * 
     * Reserved; do not use.
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a></b>
     * 
     * The processor architecture of the package. This member must be one of the values of the <b>PROCESSOR_ARCHITECTURE_...</b> constants that matches the <b><a href="https://docs.microsoft.com/uwp/api/Windows.System.ProcessorArchitecture">ProcessorArchitecture</b> enumeration</a> values. This includes:
     * 
     * * PROCESSOR_ARCHITECTURE_AMD64
     * * PROCESSOR_ARCHITECTURE_ARM
     * * PROCESSOR_ARCHITECTURE_ARM64
     * * PROCESSOR_ARCHITECTURE_INTEL
     * * PROCESSOR_ARCHITECTURE_IA32_ON_ARM64
     * * PROCESSOR_ARCHITECTURE_NEUTRAL
     * * PROCESSOR_ARCHITECTURE_UNKNOWN
     * @type {Integer}
     */
    processorArchitecture {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appmodel/ns-appmodel-package_version">PACKAGE_VERSION</a></b>
     * 
     * The version of the package.
     * @type {PACKAGE_VERSION}
     */
    version{
        get {
            if(!this.HasProp("__version"))
                this.__version := PACKAGE_VERSION(this.ptr + 8)
            return this.__version
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The name of the package.
     * @type {PWSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PWSTR(this.ptr + 16)
            return this.__name
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The publisher of the package. If there is no publisher for the package, this member is <b>NULL</b>.
     * @type {PWSTR}
     */
    publisher{
        get {
            if(!this.HasProp("__publisher"))
                this.__publisher := PWSTR(this.ptr + 24)
            return this.__publisher
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The resource identifier (ID) of the package. If there is no resource ID for the package, this member is <b>NULL</b>.
     * @type {PWSTR}
     */
    resourceId{
        get {
            if(!this.HasProp("__resourceId"))
                this.__resourceId := PWSTR(this.ptr + 32)
            return this.__resourceId
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * The publisher identifier (ID) of the package. If there is no publisher ID for the package, this member is <b>NULL</b>.
     * @type {PWSTR}
     */
    publisherId{
        get {
            if(!this.HasProp("__publisherId"))
                this.__publisherId := PWSTR(this.ptr + 40)
            return this.__publisherId
        }
    }
}

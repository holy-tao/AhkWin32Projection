#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The INFCONTEXT structure stores context information that functions such as SetupGetLineText use to navigate INF files.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-infcontext
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class INFCONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Handle to the INF file returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupopeninffilea">SetupOpenInfFile</a>.
     * @type {Pointer<Void>}
     */
    Inf {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the current INF file. The <b>Inf</b> member may point to multiple files if they were appended to the open INF file using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupopenappendinffilea">SetupOpenAppendInfFile</a>.
     * @type {Pointer<Void>}
     */
    CurrentInf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Section in the current INF file.
     * @type {Integer}
     */
    Section {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Line of the current section in the INF file. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>    The setup functions use this structure internally and it must not be accessed or modified by applications. It is included here for informational purposes only.</div>
     * <div> </div>
     * @type {Integer}
     */
    Line {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

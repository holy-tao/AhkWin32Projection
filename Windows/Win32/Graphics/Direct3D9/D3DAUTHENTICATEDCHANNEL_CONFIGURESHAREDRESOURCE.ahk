#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_SHAREDRESOURCE command.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configuresharedresource
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGURESHAREDRESOURCE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
     * @type {D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT(this.ptr + 0)
            return this.__Parameters
        }
    }

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_PROCESSIDENTIFIERTYPE**](d3dauthenticatedchannel-processidentifiertype.md) value that specifies the type of process. To specify the Desktop Window Manager (DWM) process, set this member to **PROCESSIDTYPE\_DWM**. Otherwise, set this member to **PROCESSIDTYPE\_HANDLE** and set the **ProcessHandle** member to a valid handle.
     * @type {Integer}
     */
    ProcessIdentiferType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * A process handle. If the **ProcessIdentifier** member equals **PROCESSTIDTYPE\_HANDLE**, the **ProcessHandle** member specifies a handle to a process. Otherwise, the value is ignored.
     * @type {Pointer<Ptr>}
     */
    ProcessHandle {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * If **TRUE**, the specified process has access to restricted shared resources.
     * @type {Integer}
     */
    AllowAccess {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}

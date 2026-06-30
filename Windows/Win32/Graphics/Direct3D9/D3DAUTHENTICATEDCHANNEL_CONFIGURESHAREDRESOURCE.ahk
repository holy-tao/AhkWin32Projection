#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D_OMAC.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE.ahk

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_SHAREDRESOURCE command.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configuresharedresource
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DAUTHENTICATEDCHANNEL_CONFIGURESHAREDRESOURCE extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
     * @type {D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT}
     */
    Parameters {
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT(0, this)
            return this.__Parameters
        }
    }

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_PROCESSIDENTIFIERTYPE**](d3dauthenticatedchannel-processidentifiertype.md) value that specifies the type of process. To specify the Desktop Window Manager (DWM) process, set this member to **PROCESSIDTYPE\_DWM**. Otherwise, set this member to **PROCESSIDTYPE\_HANDLE** and set the **ProcessHandle** member to a valid handle.
     * @type {D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE}
     */
    ProcessIdentiferType {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * A process handle. If the **ProcessIdentifier** member equals **PROCESSTIDTYPE\_HANDLE**, the **ProcessHandle** member specifies a handle to a process. Otherwise, the value is ignored.
     * @type {HANDLE}
     */
    ProcessHandle {
        get {
            if(!this.HasProp("__ProcessHandle"))
                this.__ProcessHandle := HANDLE(56, this)
            return this.__ProcessHandle
        }
    }

    /**
     * If **TRUE**, the specified process has access to restricted shared resources.
     * @type {BOOL}
     */
    AllowAccess {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}

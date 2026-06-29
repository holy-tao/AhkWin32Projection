#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk" { D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT }
#Import ".\D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE.ahk" { D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_SHAREDRESOURCE command.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configuresharedresource
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_CONFIGURESHAREDRESOURCE {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
     */
    Parameters : D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_PROCESSIDENTIFIERTYPE**](d3dauthenticatedchannel-processidentifiertype.md) value that specifies the type of process. To specify the Desktop Window Manager (DWM) process, set this member to **PROCESSIDTYPE\_DWM**. Otherwise, set this member to **PROCESSIDTYPE\_HANDLE** and set the **ProcessHandle** member to a valid handle.
     */
    ProcessIdentiferType : D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE

    /**
     * A process handle. If the **ProcessIdentifier** member equals **PROCESSTIDTYPE\_HANDLE**, the **ProcessHandle** member specifies a handle to a process. Otherwise, the value is ignored.
     */
    ProcessHandle : HANDLE

    /**
     * If **TRUE**, the specified process has access to restricted shared resources.
     */
    AllowAccess : BOOL

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE.ahk" { D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_RESTRICTEDSHAREDRESOURCEPROCESS query.
 * @remarks
 * The Desktop Window Manager (DWM) process is identified by setting **ProcessIdentifier** equal to **PROCESSIDTYPE\_DWM**. Other processes are identified by setting the process handle in **ProcessHandle** and setting **ProcessIdentifier** equal to **PROCESSIDTYPE\_HANDLE**.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryrestrictedsharedresourceprocess-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYRESTRICTEDSHAREDRESOURCEPROCESS_OUTPUT {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT

    /**
     * The index of the process in the list of processes.
     */
    ProcessIndex : UInt32

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_PROCESSIDENTIFIERTYPE**](d3dauthenticatedchannel-processidentifiertype.md) value that specifies the type of process.
     */
    ProcessIdentifer : D3DAUTHENTICATEDCHANNEL_PROCESSIDENTIFIERTYPE

    /**
     * A process handle. If the **ProcessIdentifier** member equals **PROCESSIDTYPE\_HANDLE**, the **ProcessHandle** member contains a valid handle to a process. Otherwise, this member is ignored.
     */
    ProcessHandle : HANDLE

}

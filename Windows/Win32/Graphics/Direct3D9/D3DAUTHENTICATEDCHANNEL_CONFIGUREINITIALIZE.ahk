#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk" { D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_INITIALIZE command.
 * @remarks
 * The **StartSequenceQuery** and **StartSequenceConfigure** members each contain a cryptographically secure 32-bit random number.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configureinitialize
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_CONFIGUREINITIALIZE {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
     */
    Parameters : D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT

    /**
     * The initial sequence number for queries.
     */
    StartSequenceQuery : UInt32

    /**
     * The initial sequence number for commands.
     */
    StartSequenceConfigure : UInt32

}

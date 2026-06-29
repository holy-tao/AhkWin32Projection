#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response to a call to the IDirect3DAuthenticatedChannel9::Configure method.
 * @remarks
 * For the **ConfigureType**, **hChannel**, and **SequenceNumber** members, the driver uses the same values that the application provided in the [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure. The application should verify that these values match.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configure-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_CONFIGURE_OUTPUT {
    #StructPack 8

    /**
     * A [**D3D\_OMAC**](d3d-omac.md) structure that contains a Message Authentication Code (MAC) of the data. The driver uses AES-based one-key CBC MAC (OMAC) to calculate this value for the block of data that appears after this structure member.
     */
    omac : D3D_OMAC

    /**
     * A GUID that specifies the command. For a list of values, see [Content Protection Commands](content-protection-commands.md).
     */
    ConfigureType : Guid

    /**
     * A handle to the authenticated channel.
     */
    hChannel : HANDLE

    /**
     * The command sequence number.
     */
    SequenceNumber : UInt32

    /**
     * The result code for the command.
     */
    ReturnCode : HRESULT

}

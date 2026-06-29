#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for the IDirect3DAuthenticatedChannel9::Configure method.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configure-input
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT {
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
     * A handle to the authenticated channel. To get the handle, call [**IDirect3DDevice9Video::CreateAuthenticatedChannel**](/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-createauthenticatedchannel).
     */
    hChannel : HANDLE

    /**
     * The query sequence number. At the start of the session, generate a cryptographically secure 32-bit random number to use as the starting sequence number. For each command, increment the sequence number by 1.
     */
    SequenceNumber : UInt32

}

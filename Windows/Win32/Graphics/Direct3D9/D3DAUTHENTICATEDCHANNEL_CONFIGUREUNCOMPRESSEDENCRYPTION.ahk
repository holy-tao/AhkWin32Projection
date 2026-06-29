#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk" { D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for the D3DAUTHENTICATEDCONFIGURE\_ENCRYPTIONWHENACCESSIBLE command.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configureuncompressedencryption
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_CONFIGUREUNCOMPRESSEDENCRYPTION {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
     */
    Parameters : D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT

    /**
     * A GUID that specifies the type of encryption to apply.
     */
    EncryptionGuid : Guid

}

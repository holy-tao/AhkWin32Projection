#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT.ahk" { D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT }
#Import ".\D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS.ahk" { D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains input data for a D3DAUTHENTICATEDCONFIGURE\_PROTECTION command.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-configureprotection
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_CONFIGUREPROTECTION {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_CONFIGURE\_INPUT**](d3dauthenticatedchannel-configure-input.md) structure that contains the command GUID and other data.
     */
    Parameters : D3DAUTHENTICATEDCHANNEL_CONFIGURE_INPUT

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_PROTECTION\_FLAGS**](d3dauthenticatedchannel-protection-flags.md) structure that specifies the protection level.
     */
    Protections : D3DAUTHENTICATEDCHANNEL_PROTECTION_FLAGS

}

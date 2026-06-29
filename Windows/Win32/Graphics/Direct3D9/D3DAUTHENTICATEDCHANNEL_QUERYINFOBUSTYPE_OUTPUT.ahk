#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT.ahk" { D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D_OMAC.ahk" { D3D_OMAC }
#Import ".\D3DBUSTYPE.ahk" { D3DBUSTYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the response to a D3DAUTHENTICATEDQUERY\_ACCESSIBILITYATTRIBUTES query.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchannel-queryinfobustype-output
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNEL_QUERYINFOBUSTYPE_OUTPUT {
    #StructPack 8

    /**
     * A [**D3DAUTHENTICATEDCHANNEL\_QUERY\_OUTPUT**](d3dauthenticatedchannel-query-output.md) structure that contains a Message Authentication Code (MAC) and other data.
     */
    Output : D3DAUTHENTICATEDCHANNEL_QUERY_OUTPUT

    /**
     * A bitwise **OR** of flags from the [**D3DBUSTYPE**](d3dbustype.md) enumeration.
     */
    BusType : D3DBUSTYPE

    /**
     * If **TRUE**, contiguous blocks of video memory may be accessible to the CPU or the bus.
     */
    bAccessibleInContiguousBlocks : BOOL

    /**
     * If **TRUE**, non-contiguous blocks of video memory may be accessible to the CPU or the bus.
     */
    bAccessibleInNonContiguousBlocks : BOOL

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CompositionFrameInstanceKind.ahk" { CompositionFrameInstanceKind }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\PresentationTransform.ahk" { PresentationTransform }

/**
 * Represents a single instance of the content shown on a single output.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ns-presentation-compositionframedisplayinstance
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct CompositionFrameDisplayInstance {
    #StructPack 4

    displayAdapterLUID : LUID

    displayVidPnSourceId : UInt32

    displayUniqueId : UInt32

    renderAdapterLUID : LUID

    /**
     * Type: **[CompositionFrameInstanceKind](ne-presentation-compositionframeinstancekind.md)**
     * 
     * The kind of instance.
     */
    instanceKind : CompositionFrameInstanceKind

    /**
     * Type: **[PresentationTransform](../presentationtypes/ns-presentationtypes-presentationtransform.md)**
     * 
     * The accumulated transform on screen of displayed content, including all transforms of ancestor visuals, if applicable.
     */
    finalTransform : PresentationTransform

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if a copy took place to display this instance due to the destination being a different adapter than the allocation's adapter; otherwise, `FALSE`.
     */
    requiredCrossAdapterCopy : Int8

    /**
     * Type: **[DXGI_COLOR_SPACE_TYPE](/windows/win32/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type)**
     * 
     * The color space type of the output this instance was shown on.
     */
    colorSpace : DXGI_COLOR_SPACE_TYPE

}

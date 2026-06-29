#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDynamicRenderer.ahk" { IDynamicRenderer }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DYNAMIC_RENDERER_CACHED_DATA {
    #StructPack 8

    strokeId : Int32

    dynamicRenderer : IDynamicRenderer

}

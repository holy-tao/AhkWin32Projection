#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MODIFY_WORLD_TRANSFORM_MODE.ahk" { MODIFY_WORLD_TRANSFORM_MODE }
#Import ".\XFORM.ahk" { XFORM }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRMODIFYWORLDTRANSFORM structure contains members for the ModifyWorldTransform enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrmodifyworldtransform
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRMODIFYWORLDTRANSFORM {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * The world-space to page-space transform data.
     */
    xform : XFORM

    iMode : MODIFY_WORLD_TRANSFORM_MODE

}

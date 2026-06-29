#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_CONFIGURE_PARAMETERS {
    #StructPack 8

    omac : IntPtr

    guidSetting : Guid

    ulSequenceNumber : UInt32

    cbParametersSize : UInt32

    abParameters : Int8[4056]

}

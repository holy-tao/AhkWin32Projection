#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDDEVICEIDENTIFIER {
    #StructPack 8

    szDriver : CHAR[512]

    szDescription : CHAR[512]

    liDriverVersion : Int64

    dwVendorId : UInt32

    dwDeviceId : UInt32

    dwSubSysId : UInt32

    dwRevision : UInt32

    guidDeviceIdentifier : Guid

}

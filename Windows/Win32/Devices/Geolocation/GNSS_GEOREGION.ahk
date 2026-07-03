#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_GEOREGIONTYPE.ahk" { GNSS_GEOREGIONTYPE }
#Import ".\GNSS_GEOREGION_CIRCLE.ahk" { GNSS_GEOREGION_CIRCLE }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_GEOREGION {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    GeoRegionType : GNSS_GEOREGIONTYPE

    Circle : GNSS_GEOREGION_CIRCLE

    static __New() {
        DefineProp(this.Prototype, 'Unused', { type: Int8[512], offset: 16 })
        this.DeleteProp("__New")
    }
}

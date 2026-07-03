#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct SENSOR_PROPERTY_LIST {
    #StructPack 4

    AllocatedSizeInBytes : UInt32

    Count : UInt32

    List : PROPERTYKEY[1]

}

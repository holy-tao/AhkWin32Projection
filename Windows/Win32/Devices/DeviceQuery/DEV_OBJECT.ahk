#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Properties\DEVPROPERTY.ahk" { DEVPROPERTY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DEV_OBJECT_TYPE.ahk" { DEV_OBJECT_TYPE }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
export default struct DEV_OBJECT {
    #StructPack 8

    ObjectType : DEV_OBJECT_TYPE

    pszObjectId : PWSTR

    cPropertyCount : UInt32

    pProperties : DEVPROPERTY.Ptr

}

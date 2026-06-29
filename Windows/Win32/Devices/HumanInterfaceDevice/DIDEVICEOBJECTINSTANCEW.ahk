#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct DIDEVICEOBJECTINSTANCEW {
    #StructPack 4

    dwSize : UInt32

    guidType : Guid

    dwOfs : UInt32

    dwType : UInt32

    dwFlags : UInt32

    tszName : WCHAR[260]

    dwFFMaxForce : UInt32

    dwFFForceResolution : UInt32

    wCollectionNumber : UInt16

    wDesignatorIndex : UInt16

    wUsagePage : UInt16

    wUsage : UInt16

    dwDimension : UInt32

    wExponent : UInt16

    wReportId : UInt16

}

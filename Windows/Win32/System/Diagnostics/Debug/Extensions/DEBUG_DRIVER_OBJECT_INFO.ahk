#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_DRIVER_OBJECT_INFO {
    #StructPack 8


    struct _DriverName {
        Length : UInt16

        MaximumLength : UInt16

        Buffer : Int64

    }

    SizeOfStruct : UInt32

    DriverSize : UInt32

    DriverObjAddress : Int64

    DriverStart : Int64

    DriverExtension : Int64

    DeviceObject : Int64

    DriverName : DEBUG_DRIVER_OBJECT_INFO._DriverName

}

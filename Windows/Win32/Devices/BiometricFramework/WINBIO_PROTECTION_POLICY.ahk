#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_PROTECTION_POLICY {
    #StructPack 8

    Version : UInt32

    Identity : WINBIO_IDENTITY

    DatabaseId : Guid

    UserState : Int64

    PolicySize : IntPtr

    Policy : Int8[128]

}

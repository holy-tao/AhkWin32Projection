#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OB_OPERATION_REGISTRATION.ahk" { OB_OPERATION_REGISTRATION }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct OB_CALLBACK_REGISTRATION {
    #StructPack 8

    Version : UInt16

    OperationRegistrationCount : UInt16

    Altitude : IntPtr

    RegistrationContext : IntPtr

    OperationRegistration : OB_OPERATION_REGISTRATION.Ptr

}

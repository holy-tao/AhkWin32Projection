#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_CREATE_KEY_INFORMATION {
    #StructPack 8

    CompleteName : UNICODE_STRING.Ptr

    RootObject : IntPtr

    ObjectType : IntPtr

    CreateOptions : UInt32

    Class : UNICODE_STRING.Ptr

    SecurityDescriptor : IntPtr

    SecurityQualityOfService : IntPtr

    DesiredAccess : UInt32

    GrantedAccess : UInt32

    Disposition : IntPtr

    ResultObject : IntPtr

    CallContext : IntPtr

    RootObjectContext : IntPtr

    Transaction : IntPtr

    Reserved : IntPtr

}

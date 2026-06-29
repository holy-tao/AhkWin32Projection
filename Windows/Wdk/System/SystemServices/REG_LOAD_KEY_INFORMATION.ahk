#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_LOAD_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    KeyName : UNICODE_STRING.Ptr

    SourceFile : UNICODE_STRING.Ptr

    Flags : UInt32

    TrustClassObject : IntPtr

    UserEvent : IntPtr

    DesiredAccess : UInt32

    RootHandle : HANDLE.Ptr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}

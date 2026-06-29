#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\ECP_LIST.ahk" { ECP_LIST }
#Import "..\..\Foundation\IO_SECURITY_CONTEXT.ahk" { IO_SECURITY_CONTEXT }
#Import "..\..\Foundation\PESILO.ahk" { PESILO }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_PATH_REQUEST_EX {
    #StructPack 8

    pSecurityContext : IO_SECURITY_CONTEXT.Ptr

    EaLength : UInt32

    pEaBuffer : IntPtr

    PathName : IntPtr

    DomainServiceName : IntPtr

    EcpList : ECP_LIST.Ptr

    Silo : PESILO

    Reserved : IntPtr

}

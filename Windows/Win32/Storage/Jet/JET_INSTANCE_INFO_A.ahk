#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_INSTANCE.ahk" { JET_INSTANCE }
#Import "..\StructuredStorage\JET_API_PTR.ahk" { JET_API_PTR }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_INSTANCE_INFO_A {
    #StructPack 8

    hInstanceId : JET_INSTANCE

    szInstanceName : IntPtr

    cDatabases : JET_API_PTR

    szDatabaseFileName : IntPtr

    szDatabaseDisplayName : IntPtr

    szDatabaseSLVFileName_Obsolete : IntPtr

}

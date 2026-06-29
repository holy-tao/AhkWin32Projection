#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_TRACKING_INFORMATION {
    #StructPack 8

    DestinationFile : HANDLE

    ObjectInformationLength : UInt32

    ObjectInformation : CHAR[1]

}

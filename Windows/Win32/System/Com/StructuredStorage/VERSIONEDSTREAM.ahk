#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\IStream.ahk" { IStream }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct VERSIONEDSTREAM {
    #StructPack 8

    guidVersion : Guid

    pStream : IStream

}

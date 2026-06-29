#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct DEVPROPKEY {
    #StructPack 4

    fmtid : Guid

    pid : UInt32

}

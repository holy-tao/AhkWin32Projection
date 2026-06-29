#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Q2931_IE_TYPE.ahk" { Q2931_IE_TYPE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct Q2931_IE {
    #StructPack 4

    IEType : Q2931_IE_TYPE

    IELength : UInt32

    IE : Int8[1]

}

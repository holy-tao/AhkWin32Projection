#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct SChannelHookCallInfo {
    #StructPack 8

    iid : Guid

    cbSize : UInt32 := this.Size

    uCausality : Guid

    dwServerPid : UInt32

    iMethod : UInt32

    pObject : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SET_PARTITION_INFORMATION.ahk" { SET_PARTITION_INFORMATION }
#Import ".\PARTITION_INFORMATION_GPT.ahk" { PARTITION_INFORMATION_GPT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PARTITION_STYLE.ahk" { PARTITION_STYLE }
#Import ".\GPT_ATTRIBUTES.ahk" { GPT_ATTRIBUTES }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SET_PARTITION_INFORMATION_EX {
    #StructPack 8

    PartitionStyle : PARTITION_STYLE

    Mbr : SET_PARTITION_INFORMATION

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: PARTITION_INFORMATION_GPT, offset: 8 })
        this.DeleteProp("__New")
    }
}

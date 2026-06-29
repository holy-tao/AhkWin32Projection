#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Kernel\FLOATING_SAVE_AREA.ahk" { FLOATING_SAVE_AREA }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct VDMCONTEXT_WITHOUT_XSAVE {
    #StructPack 4

    ContextFlags : UInt32

    Dr0 : UInt32

    Dr1 : UInt32

    Dr2 : UInt32

    Dr3 : UInt32

    Dr6 : UInt32

    Dr7 : UInt32

    FloatSave : FLOATING_SAVE_AREA

    SegGs : UInt32

    SegFs : UInt32

    SegEs : UInt32

    SegDs : UInt32

    Edi : UInt32

    Esi : UInt32

    Ebx : UInt32

    Edx : UInt32

    Ecx : UInt32

    Eax : UInt32

    Ebp : UInt32

    Eip : UInt32

    SegCs : UInt32

    EFlags : UInt32

    Esp : UInt32

    SegSs : UInt32

}

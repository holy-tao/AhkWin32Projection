#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_X86_REGISTER_STATE {
    #StructPack 8

    Eax : UInt32

    Ebx : UInt32

    Ecx : UInt32

    Edx : UInt32

    Esi : UInt32

    Edi : UInt32

    Ebp : UInt32

    Esp : UInt32

    Cs : UInt16

    Ds : UInt16

    Ss : UInt16

    Es : UInt16

    Fs : UInt16

    Gs : UInt16

    Eflags : UInt32

    Eip : UInt32

    Cr0 : UInt32

    Cr1 : UInt32

    Cr2 : UInt32

    Cr3 : UInt32

    Cr4 : UInt32

    Gdtr : Int64

    Idtr : Int64

    Ldtr : UInt16

    Tr : UInt16

}

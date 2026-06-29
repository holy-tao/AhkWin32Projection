#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETW_PMC_COUNTER_OWNER_TYPE.ahk" { ETW_PMC_COUNTER_OWNER_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_PMC_COUNTER_OWNER {
    #StructPack 4

    OwnerType : ETW_PMC_COUNTER_OWNER_TYPE

    ProfileSource : UInt32

    OwnerTag : UInt32

}

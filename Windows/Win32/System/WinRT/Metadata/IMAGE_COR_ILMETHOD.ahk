#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_COR_ILMETHOD_FAT.ahk" { IMAGE_COR_ILMETHOD_FAT }
#Import ".\IMAGE_COR_ILMETHOD_TINY.ahk" { IMAGE_COR_ILMETHOD_TINY }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_ILMETHOD {
    #StructPack 4

    Tiny : IMAGE_COR_ILMETHOD_TINY

    static __New() {
        DefineProp(this.Prototype, 'Fat', { type: IMAGE_COR_ILMETHOD_FAT, offset: 0 })
        this.DeleteProp("__New")
    }
}

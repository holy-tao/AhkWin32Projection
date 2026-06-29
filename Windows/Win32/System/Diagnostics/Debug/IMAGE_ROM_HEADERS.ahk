#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_FILE_HEADER.ahk" { IMAGE_FILE_HEADER }
#Import ".\IMAGE_ROM_OPTIONAL_HEADER.ahk" { IMAGE_ROM_OPTIONAL_HEADER }
#Import ".\IMAGE_FILE_CHARACTERISTICS.ahk" { IMAGE_FILE_CHARACTERISTICS }
#Import "..\..\SystemInformation\IMAGE_FILE_MACHINE.ahk" { IMAGE_FILE_MACHINE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_ROM_HEADERS {
    #StructPack 4

    FileHeader : IMAGE_FILE_HEADER

    OptionalHeader : IMAGE_ROM_OPTIONAL_HEADER

}

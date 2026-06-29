#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_SCALAR_MULTIPLIER_CAPS {
    #StructPack 4

    Valid : BOOLEAN

    NumericRangeMin : Float32

    NumericRangeMax : Float32

}

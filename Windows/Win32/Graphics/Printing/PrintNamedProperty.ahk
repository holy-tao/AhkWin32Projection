#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EPrintPropertyType.ahk" { EPrintPropertyType }
#Import ".\PrintPropertyValue.ahk" { PrintPropertyValue }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintNamedProperty {
    #StructPack 8

    propertyName : PWSTR

    propertyValue : PrintPropertyValue

}

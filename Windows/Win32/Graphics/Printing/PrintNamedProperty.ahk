#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PrintPropertyValue.ahk" { PrintPropertyValue }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EPrintPropertyType.ahk" { EPrintPropertyType }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintNamedProperty {
    #StructPack 8

    propertyName : PWSTR

    propertyValue : PrintPropertyValue

}

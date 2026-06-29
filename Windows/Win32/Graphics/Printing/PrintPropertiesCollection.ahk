#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PrintNamedProperty.ahk" { PrintNamedProperty }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintPropertiesCollection {
    #StructPack 8

    numberOfProperties : UInt32

    propertiesCollection : PrintNamedProperty.Ptr

}

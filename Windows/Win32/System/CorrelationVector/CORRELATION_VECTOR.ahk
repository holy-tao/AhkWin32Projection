#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.CorrelationVector
 */
export default struct CORRELATION_VECTOR {
    #StructPack 2

    Version : CHAR

    Vector : CHAR[129]

}

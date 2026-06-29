#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the coordinates of a character cell in a console screen buffer.
 * @see https://learn.microsoft.com/windows/console/coord-str
 * @namespace Windows.Win32.System.Console
 */
export default struct COORD {
    #StructPack 2

    /**
     * The horizontal coordinate or column value. The units depend on the function call.
     */
    X : Int16

    /**
     * The vertical coordinate or row value. The units depend on the function call.
     */
    Y : Int16

}

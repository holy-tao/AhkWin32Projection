#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Sources.ahk" { Sources }
#Import ".\Adapter.ahk" { Adapter }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The Adapters structure contains a list of graphics adapters.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-adapters
 * @namespace Windows.Win32.Devices.Display
 */
export default struct Adapters {
    #StructPack 4

    /**
     * The number of graphics adapters in the array that the <b>adapter</b> member specifies.
     */
    numAdapters : Int32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-adapter">Adapter</a> structures that specify information about graphics adapters.
     */
    adapter : Adapter[1]

}

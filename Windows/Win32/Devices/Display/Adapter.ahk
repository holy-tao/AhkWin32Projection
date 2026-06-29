#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\Sources.ahk" { Sources }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The Adapter structure describes a graphics adapter.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/ns-cloneviewhelper-adapter
 * @namespace Windows.Win32.Devices.Display
 */
export default struct Adapter {
    #StructPack 4

    /**
     * A single wide-character string that holds the name of the graphics adapter.
     */
    AdapterName : WCHAR[128]

    /**
     * The number of video present sources in the array that the <b>sources</b> member specifies.
     */
    numSources : Int32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-sources">Sources</a> structures that specify a list of Video Present Network (VidPN) topologies.
     */
    sources : Sources[1]

}

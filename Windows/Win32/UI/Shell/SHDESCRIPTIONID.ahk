#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Receives item data in response to a call to SHGetDataFromIDList.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shdescriptionid
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHDESCRIPTIONID {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     */
    dwDescriptionId : UInt32

    /**
     * Type: <b>CLSID</b>
     * 
     * Receives the CLSID of the object to which the item belongs.
     */
    clsid : Guid

}

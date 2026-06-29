#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies an IImePadApplet IID list.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-appletidlist
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct APPLETIDLIST {
    #StructPack 8

    /**
     * The number of the IID's implemented in this applet.
     */
    count : Int32

    /**
     * The IID list. This must be allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>.
     */
    pIIDList : Guid.Ptr

}

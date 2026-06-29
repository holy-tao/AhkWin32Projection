#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }

/**
 * The DD_UPDATENONLOCALHEAPDATA structure contains the required heap information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_updatenonlocalheapdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_UPDATENONLOCALHEAPDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Indicates the ordinal number of the heap for which data is being requested.
     */
    dwHeap : UInt32

    /**
     * Points to the linear graphic address remapping table (GART) address of the start of the heap.
     */
    fpGARTLin : IntPtr

    /**
     * Points to the physical GART address of the start of the heap.
     */
    fpGARTDev : IntPtr

    /**
     * Indicates the maximum amount of AGP memory to use.
     */
    ulPolicyMaxBytes : IntPtr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> callback for a GUID_UpdateNonLocalHeap query. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Unused on Microsoft Windows 2000 and later versions of the operating system.
     */
    UpdateNonLocalHeap : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DD_MAPMEMORYDATA structure contains the information necessary to map or unmap a frame buffer into user-mode memory.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_mapmemorydata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_MAPMEMORYDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Specifies the memory operation that the driver should perform. A value of <b>TRUE</b> indicates that the driver should map memory; <b>FALSE</b> means that the driver should unmap memory.
     */
    bMap : BOOL

    /**
     * Handle to the process whose address space is affected.
     */
    hProcess : HANDLE

    /**
     * Specifies the location in which the driver should return the base address of the process's memory-mapped space when <b>bMap</b> is <b>TRUE</b>. When <b>bMap</b> is <b>FALSE</b>, <b>fpProcess</b> contains the base address of the memory to be unmapped by the driver.
     */
    fpProcess : IntPtr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mapmemory">DdMapMemory</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}

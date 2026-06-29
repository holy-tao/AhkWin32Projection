#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DDSCAPSEX.ahk" { DDSCAPSEX }
#Import ".\HEAPALIGNMENT.ahk" { HEAPALIGNMENT }
#Import ".\SURFACEALIGNMENT.ahk" { SURFACEALIGNMENT }

/**
 * The VMEMHEAP structure contains information about the heap.
 * @see https://learn.microsoft.com/windows/win32/api/dmemmgr/ns-dmemmgr-vmemheap
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct VMEMHEAP {
    #StructPack 8

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwFlags : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    stride : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    freeList : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    allocList : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwTotalSize : UInt32

    /**
     * Points to the linear graphic address remapping table (GART) address of the start of the heap for nonlocal display memory.
     */
    fpGARTLin : IntPtr

    /**
     * Points to the physical GART address of the start of the heap for nonlocal display memory.
     */
    fpGARTDev : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwCommitedSize : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwCoalesceCount : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    Alignment : HEAPALIGNMENT

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    ddsCapsEx : DDSCAPSEX

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    ddsCapsExAlt : DDSCAPSEX

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    liPhysAGPBase : Int64

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    hdevAGP : HANDLE

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    pvPhysRsrv : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    pAgpCommitMask : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwAgpCommitMaskSize : UInt32

}

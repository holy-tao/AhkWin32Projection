#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDV_PCI_INTERFACE_VERSION.ahk" { HDV_PCI_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HDV_PCI_DEVICE_INTERFACE {
    #StructPack 8

    Version : HDV_PCI_INTERFACE_VERSION

    Initialize : IntPtr

    Teardown : IntPtr

    SetConfiguration : IntPtr

    GetDetails : IntPtr

    Start : IntPtr

    Stop : IntPtr

    ReadConfigSpace : IntPtr

    WriteConfigSpace : IntPtr

    ReadInterceptedMemory : IntPtr

    WriteInterceptedMemory : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\Controls\HIMAGELIST.ahk" { HIMAGELIST }

/**
 * An SP_CLASSIMAGELIST_DATA structure describes a class image list.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_classimagelist_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_CLASSIMAGELIST_DATA {
    #StructPack 8

    /**
     * The size, in bytes, of the SP_CLASSIMAGE_DATA structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A handle to the class image list.
     */
    ImageList : HIMAGELIST

    /**
     * Reserved. For internal use only.
     */
    Reserved : IntPtr

}

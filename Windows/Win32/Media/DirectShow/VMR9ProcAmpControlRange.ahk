#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VMR9ProcAmpControlFlags.ahk" { VMR9ProcAmpControlFlags }

/**
 * The VMR9ProcAmpControlRange structure specifies the valid range for an image adjustment property. The range depends on the graphics device driver. This structure is used with the Video Mixing Renderer 9 Filter (VMR-9).
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9procampcontrolrange
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9ProcAmpControlRange {
    #StructPack 4

    /**
     * Size of the structure, in bytes. The value must be <c>sizeof(VMR9ProcAmpControlRange)</c>.
     */
    dwSize : UInt32

    /**
     * Specifies the image adjustment property to query, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9procampcontrolflags">VMR9ProcAmpControlFlags</a> enumeration. The caller should set this field.
     */
    dwProperty : VMR9ProcAmpControlFlags

    /**
     * Specifies the minimum value for the property. The driver sets this field.
     */
    MinValue : Float32

    /**
     * Specifies the maximum value for the property. The driver sets this field.
     */
    MaxValue : Float32

    /**
     * Specifies the default value for the property. The default value is the value that does not alter the image. The driver sets this field.
     */
    DefaultValue : Float32

    /**
     * Specifies the valid increments from <b>MinValue</b> to <b>MaxValue</b>. The driver sets this field.
     */
    StepSize : Float32

}

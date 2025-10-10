#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ALLOCATOR_PROPERTIES structure describes an allocator's count, size, alignment, and prefix properties.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-getpointer">IMediaSample::GetPointer</a> method returns a pointer to the beginning of the buffer, not including the prefix bytes designated by <i>cbPrefix</i>.
  * 
  * The alignment is applied to the prefix data, if any. If a nonzero prefix is used, the beginning of the prefix is aligned according to <i>cbAlign</i>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-allocator_properties
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ALLOCATOR_PROPERTIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Number of buffers created by the allocator.
     * @type {Integer}
     */
    cBuffers {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Size of each buffer in bytes, excluding any prefix.
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Alignment of the buffer; buffer start will be aligned on a multiple of this value.
     * @type {Integer}
     */
    cbAlign {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Each buffer is preceded by a prefix of this many bytes.
     * @type {Integer}
     */
    cbPrefix {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}

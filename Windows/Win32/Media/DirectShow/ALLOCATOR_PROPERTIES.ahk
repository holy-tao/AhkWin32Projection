#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ALLOCATOR_PROPERTIES structure describes an allocator's count, size, alignment, and prefix properties.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-getpointer">IMediaSample::GetPointer</a> method returns a pointer to the beginning of the buffer, not including the prefix bytes designated by <i>cbPrefix</i>.
 * 
 * The alignment is applied to the prefix data, if any. If a nonzero prefix is used, the beginning of the prefix is aligned according to <i>cbAlign</i>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-allocator_properties
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ALLOCATOR_PROPERTIES {
    #StructPack 4

    /**
     * Number of buffers created by the allocator.
     */
    cBuffers : Int32

    /**
     * Size of each buffer in bytes, excluding any prefix.
     */
    cbBuffer : Int32

    /**
     * Alignment of the buffer; buffer start will be aligned on a multiple of this value.
     */
    cbAlign : Int32

    /**
     * Each buffer is preceded by a prefix of this many bytes.
     */
    cbPrefix : Int32

}

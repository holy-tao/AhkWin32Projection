#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AVIOLDINDEX structure describes an AVI 1.0 index ('idx1' format). New AVI files should use an AVI 2.0 index ('indx' format).
 * @remarks
 * This structure consists of the initial RIFF chunk (the <b>fcc</b> and <b>cb</b> members) followed by one index entry for each data chunk in the 'movi' list.
 * @see https://learn.microsoft.com/windows/win32/api/aviriff/ns-aviriff-avioldindex
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVIOLDINDEX {
    #StructPack 4


    struct _avioldindex_entry {
        dwChunkId : UInt32

        dwFlags : UInt32

        dwOffset : UInt32

        dwSize : UInt32

    }

    /**
     * Specifies a FOURCC code. The value must be 'idx1'.
     */
    fcc : UInt32

    /**
     * Specifies the size of the structure, not including the initial 8 bytes.
     */
    cb : UInt32

    /**
     * Array of structures that contain the following members.
     */
    aIndex : AVIOLDINDEX._avioldindex_entry[1]

}

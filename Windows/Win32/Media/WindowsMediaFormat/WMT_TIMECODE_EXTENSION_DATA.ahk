#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_TIMECODE_EXTENSION_DATA structure contains information needed for a single SMPTE time code sample extension. One of these structures will be attached to every video frame that requires a SMPTE time code.
 * @remarks
 * One of the more common SMPTE user scenarios is assembling a bunch of clips from their source reels into a prospective edit, and preserving the source reel time code in the edit. The time code in this type of file consists of a set of disjointed SMPTE ranges, where each range corresponds to the linear time code from its source reel.
 * 
 * Because these ranges are not guaranteed to be in any sort of time-related order (in other words, the first range may occur earlier in time than the second range), the concept of a range is supported in the Windows Media Format SDK time code index and interfaces. SMPTE time code MUST increase in time over a given range. Minor discontinuities within the range (such as dropped frames, or drop-frame counting) need not be marked within the range.
 * 
 * Ranges are guaranteed to be monotonically increasing (in other words, 0, 1, 2, 3, … ) with a WMV file. SMPTE time code values are guaranteed to be increasing within a given range in a WMV file, but not across ranges.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_timecode_extension_data
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_TIMECODE_EXTENSION_DATA {
    #StructPack 4

    /**
     * <b>WORD</b> specifying the range to which the time code belongs. See Remarks.
     */
    wRange : UInt16

    dwTimecode : UInt32

    /**
     * <b>DWORD</b> containing any information that the user desires. Typically, this member is used to store shot or take numbers, or other information pertinent to the production process.
     */
    dwUserbits : UInt32

    /**
     * <b>DWORD</b> provided for maintaining any AM_TIMECODE flags that are present in source material. These flags are not used by any of the objects in the Windows Media Format SDK. For more information about AM_TIMECODE flags, refer to the SMPTE time code specification.
     */
    dwAmFlags : UInt32

}

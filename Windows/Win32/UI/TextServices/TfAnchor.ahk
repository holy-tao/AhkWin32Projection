#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TfAnchor enumeration specify the start anchor or end anchor of an ITfRange object.
 * @remarks
 * 
 * A range refers to a span of text in a document. Each range is delimited by a start anchor and an end anchor.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/ne-msctf-tfanchor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfAnchor extends Win32Enum{

    /**
     * Specifies the start anchor of the <b>ITfRange</b> object.
     * @type {Integer (Int32)}
     */
    static TF_ANCHOR_START => 0

    /**
     * Specifies the end anchor of the <b>ITfRange</b> object.
     * @type {Integer (Int32)}
     */
    static TF_ANCHOR_END => 1
}

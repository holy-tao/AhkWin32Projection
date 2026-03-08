#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the similarity data for a file.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class Similarity extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

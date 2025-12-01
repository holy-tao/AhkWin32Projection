#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Use this object to create a read-only data stream whose data is initialized to zeros. You must call the SetSize method to set the requested size of the stream.
 * @see https://learn.microsoft.com/windows/win32/imapi/msftstreamzero
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class MsftStreamZero extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

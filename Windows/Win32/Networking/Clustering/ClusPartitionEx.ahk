#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/msclus/nn-msclus-iscluspartitionex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ClusPartitionEx extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides extended information about a partition on a Physical Disk resource.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/nn-msclus-iscluspartitionex
 * @namespace Windows.Win32.Networking.Clustering
 */
class ClusPartition extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}

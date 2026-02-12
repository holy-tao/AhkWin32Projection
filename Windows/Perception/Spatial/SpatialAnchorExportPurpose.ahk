#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the purpose of a given spatial anchor export, sharing or relocalization.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexportpurpose
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchorExportPurpose extends Win32Enum{

    /**
     * This export is to relocalize an existing spatial anchor.
     * @type {Integer (Int32)}
     */
    static Relocalization => 0

    /**
     * This export is to share a new spatial anchor.
     * @type {Integer (Int32)}
     */
    static Sharing => 1
}

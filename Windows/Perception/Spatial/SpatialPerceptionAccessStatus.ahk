#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumeration describes an app's ability to see the user's surroundings in ways that require the spatialPerception capability. This includes use of either [SpatialSurfaceObserver](../windows.perception.spatial.surfaces/spatialsurfaceobserver.md) or [SpatialAnchorTransferManager](spatialanchortransfermanager.md).
 * @remarks
 * To use those APIs, call the RequestAccessAsync method on the relevant type first.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialperceptionaccessstatus
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialPerceptionAccessStatus extends Win32Enum{

    /**
     * The user has not yet decided whether the app can use this spatial perception functionality.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The user has allowed the app to use this spatial perception functionality.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * The user has denied the app use of this spatial perception functionality.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 2

    /**
     * The system has denied the app use of this spatial perception functionality.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 3
}

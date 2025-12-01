#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of volume shadow copy protection levels.
 * @remarks
 * When a volume is in shadow copy protection mode, requesters must set shadow copy storage area (diff area) associations using the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-adddiffarea">IVssDifferentialSoftwareSnapshotMgmt::AddDiffArea</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ne-vsmgmt-vss_protection_level
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_PROTECTION_LEVEL extends Win32Enum{

    /**
     * Specifies that I/O to the original volume must be maintained at the expense of shadow copies. This is the default protection level. Shadow copies might be deleted if both of the following conditions occur:
     * 
     * <ul>
     * <li>A write to the original volume occurs.</li>
     * <li>The integrity of the shadow copy cannot be maintained for some reason, such as a failure to write to the shadow copy storage area or a failure to allocate sufficient memory.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_LEVEL_ORIGINAL_VOLUME => 0

    /**
     * Specifies that shadow copies must be maintained at the expense of I/O to the original volume. This protection level is called "shadow copy protection mode." All I/O to the original volume will fail if both of the following conditions occur:
     * 
     * <ul>
     * <li>A write to the original volume occurs.</li>
     * <li>The corresponding write to the shadow copy storage area cannot be completed for some reason, such as a failure to write to the shadow copy storage area or a failure to allocate sufficient memory.</li>
     * </ul>
     * @type {Integer (Int32)}
     */
    static VSS_PROTECTION_LEVEL_SNAPSHOT => 1
}

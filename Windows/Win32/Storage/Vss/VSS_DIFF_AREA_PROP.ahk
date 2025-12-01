#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes associations between volumes containing the original file data and volumes containing the shadow copy storage area.
 * @remarks
 * The <b>m_llMaximumDiffSpace</b> member is passed as a parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-adddiffarea">IVssDifferentialSoftwareSnapshotMgmt::AddDiffArea</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-changediffareamaximumsize">IVssDifferentialSoftwareSnapshotMgmt::ChangeDiffAreaMaximumSize</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt2-changediffareamaximumsizeex">IVssDifferentialSoftwareSnapshotMgmt2::ChangeDiffAreaMaximumSizeEx</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ns-vsmgmt-vss_diff_area_prop
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_DIFF_AREA_PROP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The original volume name.
     * @type {Pointer<Integer>}
     */
    m_pwszVolumeName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The shadow copy storage area volume name.
     * @type {Pointer<Integer>}
     */
    m_pwszDiffAreaVolumeName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Maximum space used on the shadow copy storage area volume for this association.
     * @type {Integer}
     */
    m_llMaximumDiffSpace {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Allocated space on the shadow copy storage area volume by this association. This must be less than or equal 
     *       to <i>m_llMaximumDiffSpace</i>.
     * @type {Integer}
     */
    m_llAllocatedDiffSpace {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Used space from the allocated area above. This must be less than or equal 
     *       to <i>m_llAllocatedDiffSpace</i>.
     * @type {Integer}
     */
    m_llUsedDiffSpace {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }
}

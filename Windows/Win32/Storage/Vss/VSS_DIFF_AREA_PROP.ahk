#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes associations between volumes containing the original file data and volumes containing the shadow copy storage area.
 * @remarks
 * The <b>m_llMaximumDiffSpace</b> member is passed as a parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-adddiffarea">IVssDifferentialSoftwareSnapshotMgmt::AddDiffArea</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt-changediffareamaximumsize">IVssDifferentialSoftwareSnapshotMgmt::ChangeDiffAreaMaximumSize</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nf-vsmgmt-ivssdifferentialsoftwaresnapshotmgmt2-changediffareamaximumsizeex">IVssDifferentialSoftwareSnapshotMgmt2::ChangeDiffAreaMaximumSizeEx</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/ns-vsmgmt-vss_diff_area_prop
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_DIFF_AREA_PROP {
    #StructPack 8

    /**
     * The original volume name.
     */
    m_pwszVolumeName : IntPtr

    /**
     * The shadow copy storage area volume name.
     */
    m_pwszDiffAreaVolumeName : IntPtr

    /**
     * Maximum space used on the shadow copy storage area volume for this association.
     */
    m_llMaximumDiffSpace : Int64

    /**
     * Allocated space on the shadow copy storage area volume by this association. This must be less than or equal 
     *       to <i>m_llMaximumDiffSpace</i>.
     */
    m_llAllocatedDiffSpace : Int64

    /**
     * Used space from the allocated area above. This must be less than or equal 
     *       to <i>m_llAllocatedDiffSpace</i>.
     */
    m_llUsedDiffSpace : Int64

}

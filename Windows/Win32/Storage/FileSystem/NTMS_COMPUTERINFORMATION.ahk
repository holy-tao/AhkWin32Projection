#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NTMS_COMPUTERINFORMATION structure defines the properties specific to the RSM server.
 * @remarks
 * The 
 * <b>NTMS_COMPUTERINFORMATION</b> structure is included in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_computerinformation
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_COMPUTERINFORMATION {
    #StructPack 4

    /**
     * Number of seconds completed library requests are maintained in the work queue.
     */
    dwLibRequestPurgeTime : UInt32

    /**
     * Number of seconds that completed operator requests are maintained in the operator request queue.
     */
    dwOpRequestPurgeTime : UInt32

    /**
     * Library request options. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_LIBREQFLAGS_NOAUTOPURGE"></a><a id="ntms_libreqflags_noautopurge"></a><dl>
     * <dt><b>NTMS_LIBREQFLAGS_NOAUTOPURGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Library requests are not purged from the work queue. Set to <b>NULL</b> by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_LIBREQFLAGS_NOFAILEDPURGE"></a><a id="ntms_libreqflags_nofailedpurge"></a><dl>
     * <dt><b>NTMS_LIBREQFLAGS_NOFAILEDPURGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed work items are not purged from the work queue. Set to <b>NULL</b> by default.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwLibRequestFlags : UInt32

    /**
     * Operator request options. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_OPREQFLAGS_NOAUTOPURGE"></a><a id="ntms_opreqflags_noautopurge"></a><dl>
     * <dt><b>NTMS_OPREQFLAGS_NOAUTOPURGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operator requests are not purged from the work queue. Set to <b>NULL</b> by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_OPREQFLAGS_NOFAILEDPURGE"></a><a id="ntms_opreqflags_nofailedpurge"></a><dl>
     * <dt><b>NTMS_OPREQFLAGS_NOFAILEDPURGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operator requests are not purged from the queue. Set to <b>NULL</b> by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_OPREQFLAGS_NOALERTS"></a><a id="ntms_opreqflags_noalerts"></a><dl>
     * <dt><b>NTMS_OPREQFLAGS_NOALERTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The alert pop-up for operator requests is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_OPREQFLAGS_NOTRAYICON"></a><a id="ntms_opreqflags_notrayicon"></a><dl>
     * <dt><b>NTMS_OPREQFLAGS_NOTRAYICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The taskbar icon for operator requests is disabled.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwOpRequestFlags : UInt32

    /**
     * Media pool policies. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_POOLPOLICY_PURGEOFFLINESCRATCH"></a><a id="ntms_poolpolicy_purgeofflinescratch"></a><dl>
     * <dt><b>NTMS_POOLPOLICY_PURGEOFFLINESCRATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any Free media ejected are automatically deleted. Set to <b>NULL</b> by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NTMS_POOLPOLICY_KEEPOFFLINEIMPORT"></a><a id="ntms_poolpolicy_keepofflineimport"></a><dl>
     * <dt><b>NTMS_POOLPOLICY_KEEPOFFLINEIMPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any Import media ejected is not deleted automatically. Set to <b>NULL</b> by default.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwMediaPoolPolicy : UInt32

}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * The _AM_ASFWRITERCONFIG_PARAM DirectShow QASF enumeration type defines filter configuration parameters used in the IConfigAsfWriter2::GetParam and SetParam methods.
 * @remarks
 * 
  * In two-pass mode the filter makes two passes through the file. In the first pass, the filter examines each media stream in its entirety to determine the optimal encoding parameters for the file. The actual encoding is performed in the second pass. Therefore, to create an ASF file in two-pass mode, you must run the graph, wait for an <b>EC_PREPROCESS_COMPLETE</b> event, seek to the beginning of the source file, and then run the graph a second time.
  * 
  * <div class="alert"><b>Important</b>  To receive the <b>EC_PREPROCESS_COMPLETE</b> event you must use the DirectShow <b>GetEvent</b> method as demonstrated in the DSCopy sample. The DirectShow <b>WaitForCompletion</b> method will not receive this particular event.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dshowasf/ne-dshowasf-_am_asfwriterconfig_param
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class _AM_ASFWRITERCONFIG_PARAM{

    /**
     * Indicates whether the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-asf-writer-filter">WM ASF Writer</a> should automatically create a temporal index after it has completed encoding a file. Set this parameter to <b>FALSE</b> if you want to create a frame-based index using the Windows Media Format SDK directly.
     * @type {Integer (Int32)}
     */
    static AM_CONFIGASFWRITER_PARAM_AUTOINDEX => 1

    /**
     * Indicates whether the filter should operate in two-pass mode. See Remarks.
     * @type {Integer (Int32)}
     */
    static AM_CONFIGASFWRITER_PARAM_MULTIPASS => 2

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/wmformat/wm-asf-writer-filter">WM ASF Writer</a> will not attempt to compress the input streams. Use this flag to pack content that is not Windows Media–based into an ASF file.
     * @type {Integer (Int32)}
     */
    static AM_CONFIGASFWRITER_PARAM_DONTCOMPRESS => 3
}

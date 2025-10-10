#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TfLayoutCode enumeration specify the type of layout change in an ITfTextLayoutSink::OnLayoutChange notification.
 * @remarks
 * 
  * In TSF, a view is on-screen rendering of document content. These constants are assigned to parameters of methods of the <b>ITf*</b> interfaces, but not those of the <b>IText*</b> interfaces.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/ne-msctf-tflayoutcode
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfLayoutCode{

    /**
     * The view has just been created.
     * @type {Integer (Int32)}
     */
    static TF_LC_CREATE => 0

    /**
     * The view layout has changed.
     * @type {Integer (Int32)}
     */
    static TF_LC_CHANGE => 1

    /**
     * The view is about to be destroyed.
     * @type {Integer (Int32)}
     */
    static TF_LC_DESTROY => 2
}

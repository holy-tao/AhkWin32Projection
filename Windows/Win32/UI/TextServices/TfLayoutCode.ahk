#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TfLayoutCode enumeration specify the type of layout change in an ITfTextLayoutSink::OnLayoutChange notification.
 * @remarks
 * In TSF, a view is on-screen rendering of document content. These constants are assigned to parameters of methods of the <b>ITf*</b> interfaces, but not those of the <b>IText*</b> interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tflayoutcode
 * @namespace Windows.Win32.UI.TextServices
 */
class TfLayoutCode extends Win32Enum {

    /**
     * The view has just been created.
     * Native name: TF_LC_CREATE
     * @type {Integer (Int32)}
     */
    static LC_CREATE => 0

    /**
     * The view layout has changed.
     * Native name: TF_LC_CHANGE
     * @type {Integer (Int32)}
     */
    static LC_CHANGE => 1

    /**
     * The view is about to be destroyed.
     * Native name: TF_LC_DESTROY
     * @type {Integer (Int32)}
     */
    static LC_DESTROY => 2
}

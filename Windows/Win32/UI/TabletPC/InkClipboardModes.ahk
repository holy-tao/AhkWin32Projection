#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the copy options of the Clipboard.
 * @remarks
 * 
 * You can use the DelayedCopy flag to interact directly with the data object and add additional formats to the clipboard.
 * 
 * <div class="alert"><b>Caution</b>  To avoid potential memory leaks as a result of using the <b>DelayedCopy</b> flag, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleflushclipboard">OleFlushClipboard</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> method. This must be done before the application exits if the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopy">ClipboardCopy</a> method used the <b>DelayedCopy</b> flag.</div>
 * <div> </div>
 * To remove the pointer from the clipboard, the parameter for the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> should be <b>NULL</b>. For the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idataobjectprovider-setdataobject">SetDataObject</a> method, the <i>data</i> parameter should be <b>NULL</b>, and the <i>copy</i> parameter should be <b>TRUE</b>.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetclipboard">OleSetClipboard</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idataobjectprovider-setdataobject">SetDataObject</a> methods replace the contents of the clipboard.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkclipboardmodes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkClipboardModes extends Win32Enum{

    /**
     * The ink is copied to the Clipboard.
     * @type {Integer (Int32)}
     */
    static ICB_Copy => 0

    /**
     * The ink is cut and copied to the Clipboard.
     * @type {Integer (Int32)}
     */
    static ICB_Cut => 1

    /**
     * The ink is not copied to the Clipboard. Typically, use this option if you want to add something else, such as text, to the ink before you copy it to the Clipboard.
     * @type {Integer (Int32)}
     */
    static ICB_ExtractOnly => 48

    /**
     * Delayed rendering is used to reduce the amount of data that is stored on the Clipboard. The data is rendered when a paste request is made.
     * @type {Integer (Int32)}
     */
    static ICB_DelayedCopy => 32

    /**
     * Copy mode is used to copy the Ink.
     * @type {Integer (Int32)}
     */
    static ICB_Default => 0
}

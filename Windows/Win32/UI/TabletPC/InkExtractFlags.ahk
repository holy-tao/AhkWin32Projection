#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines how a stroke is removed from an InkDisp object.
 * @remarks
 * 
 * This enumeration is a flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkextractflags
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkExtractFlags extends Win32Enum{

    /**
     * The ink is copied from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @type {Integer (Int32)}
     */
    static IEF_CopyFromOriginal => 0

    /**
     * The ink is cut from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @type {Integer (Int32)}
     */
    static IEF_RemoveFromOriginal => 1

    /**
     * The ink is cut from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object.
     * @type {Integer (Int32)}
     */
    static IEF_Default => 1
}

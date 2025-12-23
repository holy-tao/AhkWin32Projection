#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the dock state of the Quick Access Toolbar (QAT).
 * @remarks
 * The QAT dock position is based on the <b>UI_CONTROLDOCK</b> value in <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-reference-properties-uipkey-quickaccesstoolbardock">UI_PKEY_QuickAccessToolbarDock</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_controldock
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_CONTROLDOCK extends Win32Enum{

    /**
     * The QAT is docked in the nonclient area of the Ribbon host application, as shown in the following screen shot.
     * 
     * <img alt="Screen shot showing the Quick Access Toolbar docked above the Ribbon in the nonclient area." src="./images/QAT_DockTop.png"/>
     * @type {Integer (Int32)}
     */
    static UI_CONTROLDOCK_TOP => 1

    /**
     * The QAT is docked as a visually integral band below the Ribbon, as shown in the following screen shot.
     * 
     * <img alt="Screen shot showing the Quick Access Toolbar docked below the Ribbon." src="./images/QAT_DockBottom.png"/>
     * @type {Integer (Int32)}
     */
    static UI_CONTROLDOCK_BOTTOM => 3
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the correction modes of the Tablet PC Input Panel.
 * @remarks
 * 
 * When used with the <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nf-peninputpanel-itextinputpanel-get_currentcorrectionmode">ITextInputPanel::CurrentCorrectionMode Property</a> property it allows an application to determine the current configuration of the Correction Comb.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/peninputpanel/nn-peninputpanel-itextinputpanel">ITextInputPanel Interface</a> object provides detailed information about and control of the correction mode. Knowing the correction mode helps applications determine the current size of the Input Panel. Controlling how the post-insertion correction expands in an application is one way to customize the correction experience in an application.
 * 
 * There are two basic modes in which the correction comb may appear; pre-insertion and post-insertion. The pre-insertion correction comb corrects text before inserting it into an application. Activate the pre-insertion mode by tapping on the pending text that appears below the baseline in the Writing Pad as the user inks.
 * 
 * The post-insertion correction comb is used to correct text after it has been inserted into an application. Activate the post-insertion mode by placing the insertion point in or selecting text that was previously inserted.
 * 
 * The post-insertion correction comb may appear either above or below Input Panel or it may appear collapsed or expanded. In the collapsed state the post-insertion correction comb only shows a list of alternates. In the expanded state it includes both the alternates and an area to rewrite the word.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/ne-peninputpanel-correctionmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class CorrectionMode extends Win32Enum{

    /**
     * The Input Panel and the correction comb are not visible.
     * @type {Integer (Int32)}
     */
    static CorrectionMode_NotVisible => 0

    /**
     * The correction comb is shown in pre-insertion mode.
     * @type {Integer (Int32)}
     */
    static CorrectionMode_PreInsertion => 1

    /**
     * The correction comb is shown in post-insertion collapsed mode.
     * @type {Integer (Int32)}
     */
    static CorrectionMode_PostInsertionCollapsed => 2

    /**
     * The correction comb is shown in post-insertion expanded mode.
     * @type {Integer (Int32)}
     */
    static CorrectionMode_PostInsertionExpanded => 3
}

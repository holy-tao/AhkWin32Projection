#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_CONSOLE_VERB enumeration defines the command identifiers available for MMC verbs. These values are used in the m_eCmdID parameter of IConsoleVerb::GetVerbState, IConsoleVerb::SetVerbState, and IConsoleVerb::SetDefaultVerb.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_console_verb
 * @namespace Windows.Win32.System.Mmc
 */
class MMC_CONSOLE_VERB extends Win32Enum {

    /**
     * No verbs specified. Snap-ins can use this verb in calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iconsoleverb-setdefaultverb">IConsoleVerb::SetDefaultVerb</a> to specify that the selected item does not have a default verb.
     * Native name: MMC_VERB_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Allows the selected item to be opened.
     * Native name: MMC_VERB_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => 32768

    /**
     * Allows the selected item to be copied to the clipboard. When the user activates this verb, MMC calls the snap-in's <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-querydataobject">IComponentData::QueryDataObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-querydataobject">IComponent::QueryDataObject</a> implementation to request a data object for the selected item.
     * Native name: MMC_VERB_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 32769

    /**
     * Allows the selected item that has been cut or copied to be pasted into the result pane. When the user activates this verb, MMC sends the snap-in's <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-notify">IComponent::Notify</a> method a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-query-paste">MMCN_QUERY_PASTE</a> notification message.
     * Native name: MMC_VERB_PASTE
     * @type {Integer (Int32)}
     */
    static PASTE => 32770

    /**
     * Allows the selected item to be deleted. When the user activates this verb, MMC sends the snap-in's <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-notify">IComponent::Notify</a> method a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-delete">MMCN_DELETE</a> notification message.
     * Native name: MMC_VERB_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 32771

    /**
     * The console instructs the snap-in and all snap-in extensions to provide property pages for the currently selected item. When the user activates this verb, MMC calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa814847(v=vs.85)">IExtendPropertySheet2::CreatePropertyPages</a> method of all snap-ins (primary and extension) that add property pages for the selected item.
     * 
     * Be aware that primary snap-ins are responsible for enabling the <b>MMC_VERB_PROPERTIES</b> verb. Extensions snap-ins cannot do this, because they do not own the item for which the verb is enabled.
     * Native name: MMC_VERB_PROPERTIES
     * @type {Integer (Int32)}
     */
    static PROPERTIES => 32772

    /**
     * Allows the selected item to be renamed. When the user activates this verb, MMC sends the snap-in's <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-notify">IComponent::Notify</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-notify">IComponentData::Notify</a> method a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-rename">MMCN_RENAME</a> notification message.
     * Native name: MMC_VERB_RENAME
     * @type {Integer (Int32)}
     */
    static RENAME => 32773

    /**
     * Determines whether the currently selected scope item (folder) can be refreshed. When the user activates this verb, MMC sends the snap-in's <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-notify">IComponent::Notify</a> a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-refresh">MMCN_REFRESH</a> notification message.
     * Native name: MMC_VERB_REFRESH
     * @type {Integer (Int32)}
     */
    static REFRESH => 32774

    /**
     * Determines whether the currently selected item can be printed. When the user activates this verb, MMC sends the snap-in's <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-notify">IComponent::Notify</a> a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-print">MMCN_PRINT</a> notification message.
     * Native name: MMC_VERB_PRINT
     * @type {Integer (Int32)}
     */
    static PRINT => 32775

    /**
     * (Applies to MMC 1.1 and later.) Used only to explicitly disable or hide the cut verb, when the copy and paste verbs are enabled. When the user activates this verb, MMC calls the snap-in's <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponentdata-querydataobject">IComponentData::QueryDataObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-querydataobject">IComponent::QueryDataObject</a> implementation to request a data object for the cut item.
     * Native name: MMC_VERB_CUT
     * @type {Integer (Int32)}
     */
    static CUT => 32776

    /**
     * Native name: MMC_VERB_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 32777

    /**
     * Native name: MMC_VERB_FIRST
     * @type {Integer (Int32)}
     */
    static FIRST => 32768

    /**
     * Native name: MMC_VERB_LAST
     * @type {Integer (Int32)}
     */
    static LAST => 32776
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for various global counters, or shared variables. Each global counter can be incremented or decremented using SHGlobalCounterIncrement and SHGlobalCounterDecrement.
 * @remarks
 * 
 * These global counters are shared variables that can help identify whether the state of a Windows component has changed over time. They can be used with these functions: <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shglobalcounterdecrement">SHGlobalCounterDecrement</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shglobalcounterincrement">SHGlobalCounterIncrement</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shglobalcountergetvalue">SHGlobalCounterGetValue</a>.
 * 
 * <h3><a id="Example"></a><a id="example"></a><a id="EXAMPLE"></a>Example</h3>
 * The following pseudocode example shows how a global counter can be used.
 * 
 * 
 * ```
 * void ValidateSomeSettings()
 *     {
 *         // Get the current GLOBALCOUNTER_SHELLSETTINGSCHANGED value.
 *         long lGlobalSettingsCounter = SHGlobalCounterGetValue(GLOBALCOUNTER_SHELLSETTINGSCHANGED);
 *             
 *         // Do some other work
 *         ...
 *     
 *         // Verify whether the Shell settings have changed since entering this method.
 *         if (lGlobalSettingsCounter == SHGlobalCounterGetValue(GLOBALCOUNTER_SHELLSETTINGSCHANGED))
 *         {
 *             // Commit the work that was done earlier 
 *             ...
 *         }
 *     
 *         else
 *         {
 *             // Shell settings have changed. Rollback and redo.
 *             ...
 *         }
 *     }
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlwapi/ne-shlwapi-shglobalcounter
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHGLOBALCOUNTER{

    /**
     * The global counter for use with the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchmanager">ISearchManager</a>.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_SEARCHMANAGER => 0

    /**
     * The global counter for use with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> to identify whether a query parser's settings have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_SEARCHOPTIONS => 1

    /**
     * The global counter used to identify whether folder settings have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_FOLDERSETTINGSCHANGE => 2

    /**
     * The global counter used to identify whether ratings have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RATINGS => 3

    /**
     * The global counter used to identify whether approved sites have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_APPROVEDSITES => 4

    /**
     * The global counter used to identify whether restrictions have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RESTRICTIONS => 5

    /**
     * The global counter used to identify whether Shell settings have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_SHELLSETTINGSCHANGED => 6

    /**
     * The global counter used to identify whether a system PIDL has changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_SYSTEMPIDLCHANGE => 7

    /**
     * The global counter used to identify whether the overlay manager state has changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_OVERLAYMANAGER => 8

    /**
     * The global counter used to identify whether query associations have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_QUERYASSOCIATIONS => 9

    /**
     * The global counter used to identify whether the number of IE sessions has changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_IESESSIONS => 10

    /**
     * The global counter used to identify whether the number of IE sessions has changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_IEONLY_SESSIONS => 11

    /**
     * Identifies The global counter used to identify whether applications have been added or removed from the system.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_APPLICATION_DESTINATIONS => 12

    /**
     * Unused.
     * @type {Integer (Int32)}
     */
    static __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_CSCSYNCINPROGRESS => 13

    /**
     * The global counter used to identify deletions to the Recycle Bin.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_BITBUCKETNUMDELETERS => 14

    /**
     * The global counter used to identify whether settings have changed on a share.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SHARES => 15

    /**
     * The global counter used to identify whether settings have changed on drive A.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_A => 16

    /**
     * The global counter used to identify whether settings have changed on drive B.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_B => 17

    /**
     * The global counter used to identify whether settings have changed on drive C.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_C => 18

    /**
     * The global counter used to identify whether settings have changed on drive D.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_D => 19

    /**
     * The global counter used to identify whether settings have changed on drive E.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_E => 20

    /**
     * The global counter used to identify whether settings have changed on drive F.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_F => 21

    /**
     * The global counter used to identify whether settings have changed on drive G.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_G => 22

    /**
     * The global counter used to identify whether settings have changed on drive H.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_H => 23

    /**
     * The global counter used to identify whether settings have changed on drive I.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_I => 24

    /**
     * The global counter used to identify whether settings have changed on drive J.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_J => 25

    /**
     * The global counter used to identify whether settings have changed on drive K.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_K => 26

    /**
     * The global counter used to identify whether settings have changed on drive L.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_L => 27

    /**
     * The global counter used to identify whether settings have changed on drive M.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_M => 28

    /**
     * The global counter used to identify whether settings have changed on drive N.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_N => 29

    /**
     * The global counter used to identify whether settings have changed on drive O.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_O => 30

    /**
     * The global counter used to identify whether settings have changed on drive P.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_P => 31

    /**
     * The global counter used to identify whether settings have changed on drive Q.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Q => 32

    /**
     * The global counter used to identify whether settings have changed on drive R.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_R => 33

    /**
     * The global counter used to identify whether settings have changed on drive S.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_S => 34

    /**
     * The global counter used to identify whether settings have changed on drive T.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_T => 35

    /**
     * The global counter used to identify whether settings have changed on drive U.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_U => 36

    /**
     * The global counter used to identify whether settings have changed on drive V.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_V => 37

    /**
     * The global counter used to identify whether settings have changed on drive W.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_W => 38

    /**
     * The global counter used to identify whether settings have changed on drive X.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_X => 39

    /**
     * The global counter used to identify whether settings have changed on drive Y.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Y => 40

    /**
     * The global counter used to identify whether settings have changed on drive Z.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Z => 41

    /**
     * Unused.
     * @type {Integer (Int32)}
     */
    static __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SERVERDRIVE => 42

    /**
     * Unused.
     * @type {Integer (Int32)}
     */
    static __UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEGLOBALDIRTYCOUNT => 43

    /**
     * The global counter used to identify whether the Recycle Bin settings have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEBINENUM => 44

    /**
     * The global counter used to identify whether a Recycle Bin has been deleted.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RECYCLEBINCORRUPTED => 45

    /**
     * The global counter used to identify whether ratings have changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_RATINGS_STATECOUNTER => 46

    /**
     * The global counter state.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_PRIVATE_PROFILE_CACHE => 47

    /**
     * The global counter used to identify whether the Internet toolbar layout has changed.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_INTERNETTOOLBAR_LAYOUT => 48

    /**
     * The global counter used to identify changes to the folder definition cache.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_FOLDERDEFINITION_CACHE => 49

    /**
     * The global counter used to identify state changes for the commonplaces list cache.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_COMMONPLACES_LIST_CACHE => 50

    /**
     * The global counter state, machine-wide.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_PRIVATE_PROFILE_CACHE_MACHINEWIDE => 51

    /**
     * The global counter used to identify the current GlobalAssocChangedCounter registry value for HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_ASSOCCHANGED => 52

    /**
     * <b>Introduced in Windows 8</b>. The global counter used to identify whether the Store is current.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_APP_ITEMS_STATE_STORE_CACHE => 53

    /**
     * <b>Introduced in Windows 8</b>. The global counter used to determine whether sync is enabled or disabled.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_SETTINGSYNC_ENABLED => 54

    /**
     * <b>Introduced in Windows 8</b>. The global counter used to identify the current FTACounter registry value for HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\StateStore.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_APPSFOLDER_FILETYPEASSOCIATION_COUNTER => 55

    /**
     * <b>Introduced in Windows 8</b>. The global counter used to identify user info change state.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_USERINFOCHANGED => 56

    /**
     * <b>Introduced in Windows 8.1</b>. The global counter used to identify sync engine counter state, machine wide..
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_SYNC_ENGINE_INFORMATION_CACHE_MACHINEWIDE => 57

    /**
     * 
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_BANNERS_DATAMODEL_CACHE_MACHINEWIDE => 58

    /**
     * The maximum value any shared variable can have.
     * @type {Integer (Int32)}
     */
    static GLOBALCOUNTER_MAXIMUMVALUE => 59
}

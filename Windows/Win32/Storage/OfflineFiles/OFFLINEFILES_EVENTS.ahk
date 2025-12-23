#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Event identifier codes describing events to be received or excluded by an event sink.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_events
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_EVENTS extends Win32Enum{

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_CACHEMOVED => 0

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_CACHEISFULL => 1

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_CACHEISCORRUPTED => 2

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ENABLED => 3

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ENCRYPTIONCHANGED => 4

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-syncbegin">IOfflineFilesEvents::SyncBegin</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_SYNCBEGIN => 5

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-syncfileresult">IOfflineFilesEvents::SyncFileResult</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_SYNCFILERESULT => 6

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecadded">IOfflineFilesEvents::SyncConflictRecAdded</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_SYNCCONFLICTRECADDED => 7

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecupdated">IOfflineFilesEvents::SyncConflictRecUpdated</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_SYNCCONFLICTRECUPDATED => 8

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-syncconflictrecremoved">IOfflineFilesEvents::SyncConflictRecRemoved</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_SYNCCONFLICTRECREMOVED => 9

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-syncend">IOfflineFilesEvents::SyncEnd</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_SYNCEND => 10

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncbegin">IOfflineFilesEvents2::BackgroundSyncBegin</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_BACKGROUNDSYNCBEGIN => 11

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-backgroundsyncend">IOfflineFilesEvents2::BackgroundSyncEnd</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_BACKGROUNDSYNCEND => 12

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-nettransportarrived">IOfflineFilesEvents::NetTransportArrived</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_NETTRANSPORTARRIVED => 13

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-nonettransports">IOfflineFilesEvents::NoNetTransports</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_NONETTRANSPORTS => 14

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemdisconnected">IOfflineFilesEvents::ItemDisconnected</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMDISCONNECTED => 15

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemreconnected">IOfflineFilesEvents::ItemReconnected</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMRECONNECTED => 16

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemavailableoffline">IOfflineFilesEvents::ItemAvailableOffline</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMAVAILABLEOFFLINE => 17

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemnotavailableoffline">IOfflineFilesEvents::ItemNotAvailableOffline</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMNOTAVAILABLEOFFLINE => 18

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itempinned">IOfflineFilesEvents::ItemPinned</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMPINNED => 19

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemnotpinned">IOfflineFilesEvents::ItemNotPinned</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMNOTPINNED => 20

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemmodified">IOfflineFilesEvents::ItemModified</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMMODIFIED => 21

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemaddedtocache">IOfflineFilesEvents::ItemAddedToCache</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMADDEDTOCACHE => 22

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemdeletedfromcache">IOfflineFilesEvents::ItemDeletedFromCache</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMDELETEDFROMCACHE => 23

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-itemrenamed">IOfflineFilesEvents::ItemRenamed</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMRENAMED => 24

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-datalost">IOfflineFilesEvents::DataLost</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_DATALOST => 25

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents-ping">IOfflineFilesEvents::Ping</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_PING => 26

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectbegin">IOfflineFilesEvents2::ItemReconnectBegin</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMRECONNECTBEGIN => 27

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-itemreconnectend">IOfflineFilesEvents2::ItemReconnectEnd</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_ITEMRECONNECTEND => 28

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_CACHEEVICTBEGIN => 29

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_CACHEEVICTEND => 30

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-policychangedetected">IOfflineFilesEvents2::PolicyChangeDetected</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_POLICYCHANGEDETECTED => 31

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-preferencechangedetected">IOfflineFilesEvents2::PreferenceChangeDetected</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_PREFERENCECHANGEDETECTED => 32

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents2-settingschangesapplied">IOfflineFilesEvents2::SettingsChangesApplied</a> event method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_SETTINGSCHANGESAPPLIED => 33

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents3-transparentcacheitemnotify">IOfflineFilesEvents3::TransparentCacheItemNotify</a> event method.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported before Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_TRANSPARENTCACHEITEMNOTIFY => 34

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents3-prefetchfilebegin">IOfflineFilesEvents3::PrefetchFileBegin</a> event method.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported before Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_PREFETCHFILEBEGIN => 35

    /**
     * Represents the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesevents3-prefetchfileend">IOfflineFilesEvents3::PrefetchFileEnd</a> event method.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>This value is not supported before Windows Server 2008 R2 and Windows 7.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_PREFETCHFILEEND => 36

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEBEGIN => 37

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_EVENT_PREFETCHCLOSEHANDLEEND => 38

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_NUM_EVENTS => 39
}

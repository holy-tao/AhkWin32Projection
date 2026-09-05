#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the possible types of information that an application that calls the ReadDirectoryChangesExW function can request.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-read_directory_notify_information_class
 * @namespace Windows.Win32.Storage.FileSystem
 */
class READ_DIRECTORY_NOTIFY_INFORMATION_CLASS extends Win32Enum {

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-readdirectorychangesexw">ReadDirectoryChangesExW</a> function  should provide  information that describes the changes within the specified directory, and return this information in the  output buffer in the form of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-file_notify_information">FILE_NOTIFY_INFORMATION</a> structures.
     * @type {Integer (Int32)}
     */
    static ReadDirectoryNotifyInformation => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-readdirectorychangesexw">ReadDirectoryChangesExW</a> function  should provide  extended information that describes the changes within the specified directory, and return this information in the  output buffer in the form of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-file_notify_extended_information">FILE_NOTIFY_EXTENDED_INFORMATION</a> structures.
     * Native name: ReadDirectoryNotifyExtendedInformation
     * @type {Integer (Int32)}
     */
    static ExtendedInformation => 2

    /**
     * Native name: ReadDirectoryNotifyFullInformation
     * @type {Integer (Int32)}
     */
    static FullInformation => 3

    /**
     * Native name: ReadDirectoryNotifyMaximumInformation
     * @type {Integer (Int32)}
     */
    static MaximumInformation => 4
}

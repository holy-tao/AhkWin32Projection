#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the unit of time used to group files into folders if a [CommonFolderQuery](commonfolderquery.md) based on date is used to create a [QueryOptions](queryoptions.md) object.
 * @remarks
 * For example, if you create a [QueryOptions](queryoptions.md) object using [CommonFolderQuery.GroupByYear](commonfolderquery.md) the [DateStackOption](queryoptions_datestackoption.md) property will contain the DateStackOption.Year value.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.datestackoption
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class DateStackOption extends Win32Enum{

    /**
     * The query options are not based on the date.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The content is grouped by year.
     * @type {Integer (Int32)}
     */
    static Year => 1

    /**
     * The content is grouped by month.
     * @type {Integer (Int32)}
     */
    static Month => 2
}

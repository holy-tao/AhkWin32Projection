#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The property by which to sort. Currently limited to due date.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskquerysortproperty
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskQuerySortProperty extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DueDate => 0
}
